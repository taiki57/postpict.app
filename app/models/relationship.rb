class Relationship < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "User"
    validates :follower_id, presence: true
    validates :followed_id, presence: true
   #has_many :follower, through: :active_relationships, source: :followed
   #has_many :followed, through: :active_relationships, source: :follower
end
