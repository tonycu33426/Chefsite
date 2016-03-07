class OrderMailer < ActionMailer::Base
    default from: "info@imthechef.co.za"
    
    def order_confirmation order
        @order = order
        mail to: order.user.email, subject: "your order (##{order.id})"
    end
    
    def state_changed order, previous_state
        @order = order
        @previous_state = previous_state
        
        mail to: order.user.email, subject: "Your order (##{order.id}) has changed!"
    end
        
end
