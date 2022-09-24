class Review < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_many :review_comments, dependent: :destroy

  validates :content, presence: true, length: { maximum: 500 }
  validates :star, presence: true
  validates :sharpness, presence: true
  validates :rich, presence: true
  validates :sourness, presence: true
  validates :sweetness, presence: true
  validates :bitterness, presence: true
  validates :food, length: { maximum: 200 }
  validates :situation, length: { maximum: 200 }

end
