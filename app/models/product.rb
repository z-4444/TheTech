class Product < ApplicationRecord
    belongs_to :user
##########################################################

    has_many :products_subcatagories
    has_many :subcatagories, through: :products_subcatagories

#################################################
    has_many :cart_products
    has_many :carts, through: :cart_products
    has_many :orderproducts
    has_many :orders, through: :orderproducts
    
#####################################################
    has_many :comments
    has_many :likes

    has_many :images, as: :imageable, dependent: :destroy

    mount_uploaders :images, ProfilePicUploader

    validates :name,:price, presence: true
    validates :name, uniqueness: true 

    enum status: {pending: 0, active: 1}

    # {message: "Subcatagory must include. Don't worry if you do not have subcatagory 
    #     click #{ link_to 'new subcatagories', new_users_subcatagory_path } "}
end
