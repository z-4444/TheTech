class Catagory < ApplicationRecord
    has_many :subcatagories
    belongs_to :user, optional: true


end
