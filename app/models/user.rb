class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :tweets, dependent: :destroy
  has_many :followers, foreign_key: :follower_id
  has_many :followings, foreign_key: :following_id
end
