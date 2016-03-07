class ProductIngredientsController < ApplicationController
    
    

    def index
        #1st you retrieve the product thanks to params[:product_id]
        product = Product.find(params[:product_id])
        #2nd you get all the ingredients of this product
        @product_ingredients = product.product_ingredients
        
        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @product_ingredients }
        end
        
    end
    

    def show
        #1st you retrieve the product thanks to params[:product_id]
        product = Product.find(params[:product_id])
        #2nd you retrieve the ingredients thanks to params[:id]
        @product_ingredients = product.product_ingredients.find(params[:id])
        
        respond_to do |format|
            format.html # show.html.erb
            format.xml  { render :xml => @product_ingredients }
        end
    end
    

    def new
        
        #1st you retrieve the product thanks to params[:product_id]
        product = Product.find(params[:product_id])
        #2nd you build a new one
        @product_ingredients = product.product_ingredients.build
        
        respond_to do |format|
            format.html # new.html.erb
            format.xml  { render :xml => @product_ingredients }
        end
    end
    
    
    def edit
        #1st you retrieve the product thanks to params[:product_id]
        product = Product.find(params[:product_id])
        #2nd you retrieve the ingredients thanks to params[:id]
        @product_ingredients = product.product_ingredients.find(params[:id])
    end
    

    def create
        #1st you retrieve the product thanks to params[:product_id]
        product = Product.find(params[:product_id])
        #2nd you create the ingredients with arguments in params[:product_ingredients]
        @product_ingredients = product.product_ingredients.create(product_ingredients_params)
        
        respond_to do |format|
            if @product_ingredients.save
                #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
                format.html { redirect_to action: "index", notice: 'Ingredient was successfully created.' }
                #the key :location is associated to an array in order to build the correct route to the nested resource comment
                format.xml  { render :xml => @product_ingredients.index, :status => :created, :location => [@product_ingredients.post, @comment] }
                else
                format.html { render :action => "new" }
                format.xml  { render :xml => @product_ingredients.errors, :status => :unprocessable_entity }
            end
        end
    end
    

    def update
        #1st you retrieve the product thanks to params[:product_id]
        product = Product.find(params[:product_id])
        #2nd you retrieve the comment thanks to params[:id]
        @product_ingredients = product.product_ingredients.find(params[:id])
        
        respond_to do |format|
            if @product_ingredients.update(product_ingredients_params)
                #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
                format.html { redirect_to action: "index", notice: 'Ingredient was successfully updated.' }
                format.xml  { head :ok }
            else
                format.html { render :action => "edit" }
                format.xml  { render :xml => @product_ingredients.errors, :status => :unprocessable_entity }
            end
        end
    end
    

    def destroy
        #1st you retrieve the product thanks to params[:product_id]
        product = Product.find(params[:product_id])
        #2nd you retrieve the ingredient thanks to params[:id]
        @product_ingredients = product.product_ingredients.find(params[:id])
        @product_ingredients.destroy
        
        respond_to do |format|
            #1st argument reference the path /posts/:post_id/comments/
            format.html { redirect_to action: "index", notice: 'Ingredient was successfully deleted.' }
            format.xml  { head :ok }
        end
    end
    
    private
    
    
    def product_ingredients_params
        
        params.require(:product_ingredient).permit(:product_id, :ingredient_id, :metric_qty, :imperial_qty, :metric_pack_size, :imperial_pack_size, :metric_unit, :imperial_unit)
    end
    

    
end

