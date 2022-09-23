class Item < ApplicationRecord

  has_many :reviews, dependent: :destroy
  belongs_to :genre
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags
  has_one_attached :image

  validates :name, presence: true
  validates :maker, presence: true


  def self.search(keyword)
    if keyword != ''
      Item.where("name LIKE(?)", "%#{keyword}%")
    end
  end

end
