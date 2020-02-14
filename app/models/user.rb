class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :own_tweets, class_name: 'Tweet', dependent: :destroy
  has_many :follower_users, class_name: 'Follow', foreign_key: :following_id
  has_many :followers, through: :follower_users
  has_many :following_users, class_name: 'Follow', foreign_key: :follower_id
  has_many :followings, through: :following_users

  def full_name
    "#{first_name} #{last_name}".titleize
  end

  def follower?(user)
    !!followers.find { |rec| rec.id == user.id }
  end

  def tweets
    (own_tweets + followings.includes(:own_tweets).map(&:own_tweets)).flatten
  end
end
