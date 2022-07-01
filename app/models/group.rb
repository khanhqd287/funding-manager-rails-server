class Group < ApplicationRecord
    has_many :user_group_refs
    has_many :users, through: :user_group_refs

    validates :name, presence: true, length: { minimum: 6, maximum: 100 }
    validates :host_id, presence: true
end
