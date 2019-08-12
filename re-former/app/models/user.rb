class User < ApplicationRecord
  validates :name
  validates :email
  validates :password
end
