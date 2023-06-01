class HouseSeeker < ApplicationRecord
    belongs_to :user, foreign_key: :user_code
end
