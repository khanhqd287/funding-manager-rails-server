class Group < ApplicationRecord
    validates :name, presence: true, length: { minimum: 6, maximum: 100 }
    validates :host_id, presence: true
end
