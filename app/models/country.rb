class Country < ApplicationRecord
    has_many :states
    has_many :cities
    belongs_to :user
end
