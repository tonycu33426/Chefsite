class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   
   has_many :Orders
         
         #validates_presence_of :name, :address, :city, :country, :postal_code
  
  def full_address
      "#{address} #{postal_code} #{city} #{country}"
  end
end
