class User < ApplicationRecord
  has_secure_password
  has_many :user_group_refs
  has_many :groups, through: :user_group_refs

  validates :email, presence: true, uniqueness: true
end
