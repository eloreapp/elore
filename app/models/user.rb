class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_one_attached :avatar

  acts_as_commontator

  extend FriendlyId
  friendly_id :username, :use => [:slugged, :finders]

  def full_name
    return "#{first_name} #{ last_name }".strip if ( first_name || last_name )
    "Anonymous" 
  end
end
