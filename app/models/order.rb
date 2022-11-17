class Order < ApplicationRecord
    has_many :orderproducts, dependent: :destroy
    has_many :products, through: :orderproducts
    belongs_to :user
end
