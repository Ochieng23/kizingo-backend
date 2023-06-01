class User < ApplicationRecord

  has_secure_password

  has_one :house_seeker, foreign_key: :user_code
  has_one :admin, foreign_key: :user_code
end
