class Item < ApplicationRecord

  has_many :reviews
  belongs_to :genre
  has_one_attached :image

  def self.search(keyword)
    if keyword != ''
      Item.where("name LIKE(?)", "%#{keyword}%")
    end
  end

end
