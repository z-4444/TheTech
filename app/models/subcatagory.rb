class Subcatagory < ApplicationRecord
    has_many :products_subcatagories
    has_many :products, through: :products_subcatagories

    belongs_to :catagory
    belongs_to :user
    

end
