class Item < ApplicationRecord

  has_many :reviews, dependent: :destroy
  has_many :tags, dependent: :destroy
  belongs_to :genre
  has_one_attached :image

  validates :name, presence: true
  validates :maker, presence: true

  def self.search(keyword)
    if keyword != ''
      Item.where("name LIKE(?)", "%#{keyword}%")
    end
  end

end
