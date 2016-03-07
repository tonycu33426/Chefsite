class RecipesController < ApplicationController

  def index
      #1st you retrieve the product thanks to params[:product_id]
      product = Product.find(params[:product_id])
      #2nd you get all the recipes of this product
      @recipes = product.recipes
      
      respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @recipes }
      end
  end


  def show
      #1st you retrieve the product thanks to params[:product_id]
      product = Product.find(params[:product_id])
      #2nd you retrieve the recipes thanks to params[:id]
      @recipes = product.recipes.find(params[:id])
      
      respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @recipes }
      end
  end


  def new
      #1st you retrieve the product thanks to params[:product_id]
      product = Product.find(params[:product_id])
      #2nd you build a new one
      @recipes = product.recipes.build
      
      respond_to do |format|
          format.html # new.html.erb
          format.xml  { render :xml => @recipes }
      end
  end

  def edit
      #1st you retrieve the product thanks to params[:product_id]
      product = Product.find(params[:product_id])
      #2nd you retrieve the recipes thanks to params[:id]
      @recipes = product.recipes.find(params[:id])
  end

  def create
      #1st you retrieve the product thanks to params[:product_id]
      product = Product.find(params[:product_id])
      #2nd you create the recipes with arguments in params[:product_ingredients]
      @recipes = product.recipes.create(recipe_params)
      
      respond_to do |format|
          if @recipes.save
              #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
              format.html { redirect_to action: "index", notice: 'Recipe step was successfully created.' }
              #the key :location is associated to an array in order to build the correct route to the nested resource comment
              format.xml  { render :xml => @recipes.index, :status => :created, :location => [@recipes.post, @recipes] }
              else
              format.html { render :action => "new" }
              format.xml  { render :xml => @recipes.errors, :status => :unprocessable_entity }
          end
      end
  end

  def update
      #1st you retrieve the product thanks to params[:product_id]
      product = Product.find(params[:product_id])
      #2nd you retrieve the recipe thanks to params[:id]
      @recipes = product.recipes.find(params[:id])
      
      respond_to do |format|
          if @recipes.update(recipe_params)
              #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
              format.html { redirect_to action: "index", notice: 'Recipe step was successfully updated.' }
              format.xml  { head :ok }
              else
              format.html { render :action => "edit" }
              format.xml  { render :xml => @recipes.errors, :status => :unprocessable_entity }
          end
      end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
      #1st you retrieve the product thanks to params[:product_id]
      product = Product.find(params[:product_id])
      #2nd you retrieve the recipe thanks to params[:id]
      @recipes = product.recipes.find(params[:id])
      @recipes.destroy
      
      respond_to do |format|
          #1st argument reference the path /posts/:post_id/comments/
          format.html { redirect_to action: "index", notice: 'Recipe step was successfully deleted.' }
          format.xml  { head :ok }
      end
  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:product_id, :sequence, :time_before_meal, :instructions, :image)
    end
end
