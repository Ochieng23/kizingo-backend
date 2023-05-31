class User < ApplicationRecord

    has_secure_password

  has_one :house_seeker
  has_one :admin
end
