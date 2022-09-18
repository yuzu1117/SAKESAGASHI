class Item < ApplicationRecord
  
  has_many :reviews
  belongs_to :genre
  has_one_attached :image

  def self.search(search)
    if search != ''
      Item.where("name LIKE(?)", "%#{search}%")
    end
  end
  
end
