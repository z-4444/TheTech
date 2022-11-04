class State < ApplicationRecord
    belongs_to :country, :class_name => "country",
    :foreign_key => "country_id"
    has_many :cities
    belongs_to :user
end
