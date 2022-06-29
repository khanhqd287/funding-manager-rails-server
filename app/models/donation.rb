class Donation < ApplicationRecord
    validates :user_id, presence: true
    validates :group_id, presence: true
    validates :amount, presence: true
end
