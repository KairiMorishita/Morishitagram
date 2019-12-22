class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, precence: true
end
