class Post < ApplicationRecord
  acts_as_taggable_on :tags
  has_one_attached :image

  belongs_to :user
end
