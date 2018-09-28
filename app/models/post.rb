class Post < ApplicationRecord
  acts_as_taggable
  has_one_attached :image

  acts_as_commontable dependent: :destroy

  belongs_to :user
end
