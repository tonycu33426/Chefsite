class CartsController < ApplicationController
    before_filter :initialize_cart
    
    def add
        @cart.add_item params[:id]
        session["cart"] = @cart.serialize
        product = Product.find params[:id]
        redirect_to :back, notice: "Added #{product.name} to cart."
    end
    
    def delete
            
        @cart.remove_product params[:id]
        session["cart"] = @cart.serialize
        prod = Product.find(params[:id])
        
        respond_to do |format|
            #1st argument reference the path /posts/:post_id/comments/
            format.html { redirect_to cart_path, notice: "Deleted #{prod.name} from cart." }
            format.xml  { head :ok }
        end

    end
    

   
    def show
    end
    
    def checkout
        @order_form = OrderForm.new user: current_user
        @client_token = Braintree::ClientToken.generate
    end
    
    
end
  