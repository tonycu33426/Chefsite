class OrdersController < ApplicationController
    before_filter :initialize_cart
    
    def index
        @orders = Order.order(created_at: :desc).all
    end
    
    def create
        @order_form = OrderForm.new(
                                    user: current_user,
                                    cart: @cart
                                    )
                                    
                                    if @order_form.save
                                        notify_user
                                        if false#charge_user
                                            redirect_to root_path, notice: "Thank you for placing the order."
                                            else
                                            flash[:warning] =
                                            "We have stored your order with the id of #{@order_form.order.id}. You should receive an email with the order details and password change.<br/> However, something went wrong with your credit card, please add another one."
                                        
                                            session[:cart] = nil
                                            session[:total_items_in_cart] = 0
                                            redirect_to new_payment_order_path(@order_form.order)
                                        end
                                        else
                                        render "carts/checkout"
                                    end
    end
    
    def shoppinglist
        @order = Order.find params[:id]
        
        query = "select  ft.name as Type, i.name as Ingredient, sum(pi.metric_qty) as Quantity, pi.metric_unit as Unit, o.order_id as OrderNo from Order_items o inner join Products p on o.product_id = p.id inner join Product_ingredients pi on o.product_id = pi.product_id inner join Ingredients i on i.id = pi.ingredient_id inner join foodtypes ft on ft.id = i.foodtype_id  WHERE (o.order_id = #{@order.id}) group by ft.name, i.name"
        
        @result = ActiveRecord::Base.connection.execute(query)

    end
    

          
          
    
    def recipesteps
        @order = Order.find params[:id]
        
        query = "select  r.time_before_meal, c.name as Category, p.name as ProductName, r.instructions, r.id as Image, o.order_id as OrderNo from Order_items o inner join Products p on o.product_id = p.id inner join Recipes r on o.product_id = r.product_id inner join Categories c on p.category_id = c.id  WHERE (o.order_id = #{@order.id})"
        
        @result = ActiveRecord::Base.connection.execute(query)
    end
    
    def update
        @order = Order.find params[:id]
        @previous_state = @order.state
        
        if @order.update state_order_params
            notify_user_about_state
            redirect_to orders_path, notice: "Order was updated."
        end
    end
    
    def new_payment
        @order = Order.find params[:id]
        @client_token = Braintree::ClientToken.generate
    end
    
    def pay
        @order = Order.find params[:id]
        transaction = OrderTransaction.new @order, params[:payment_method_nonce]
        transaction.execute
        if transaction.ok?
            redirect_to root_path, notice: "Thank you for placing the order."
            else
            render "orders/new_payment"
        end
    end
    
    private
    
    def notify_user
        #@order_form.user.send_reset_password_instructions
        OrderMailer.order_confirmation(@order_form.order).deliver
    end
    
    def notify_user_about_state
        OrderMailer.state_changed(@order, @previous_state).deliver
    end
    
    def order_params
        params.require(:order_form).permit(
                                           user: [:name, :phone, :address, :city, :country, :postal_code, :email]
        )
    end
    
    def state_order_params
        params.require(:order).permit(:state)
    end
end

