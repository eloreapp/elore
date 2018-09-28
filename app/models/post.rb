class Post < ApplicationRecord
  acts_as_taggable
  has_one_attached :image

  belongs_to :user
end
