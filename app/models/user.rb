class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

  #ゲストログイン用
  def self.guest
    find_or_create_by!(name: 'guestuser',email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
      user.nickname = "guest"
    end
  end

  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :review_comment, dependent: :destroy
end
