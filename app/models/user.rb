class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #RELATIONS 
  has_many :courses, dependent: :destroy
  has_many :matieres, through: :courses
  has_many :comments, through: :courses
  belongs_to :level, optional: true

#Slug
  class User < ApplicationRecord
    extend FriendlyId
    friendly_id :username, use: :slugged
  end

  def should_generate_new_friendly_id?
      username_changed?
  end 

  #avatar
  has_one_attached :avatar
end
