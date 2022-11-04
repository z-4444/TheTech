class City < ApplicationRecord
    belongs_to :country, :class_name => "country",
    :foreign_key => "country_id"
    belongs_to :state, :class_name => "state",
    :foreign_key => "state_id"
    belongs_to :user
end
