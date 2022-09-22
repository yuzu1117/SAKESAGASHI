class Review < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_many :review_comments, dependent: :destroy

  validates :content, presence: true
  validates :star, presence: true
  validates :sharpness, presence: true
  validates :rich, presence: true
  validates :sourness, presence: true
  validates :sweetness, presence: true
  validates :bitterness, presence: true

end
