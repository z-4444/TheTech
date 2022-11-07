class Country < ApplicationRecord
    has_many :states
    has_many :cities
    has_many :users
end
