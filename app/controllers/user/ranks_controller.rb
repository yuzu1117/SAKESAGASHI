class User::RanksController < ApplicationController

  def rank
    @ranks = Item.find(Review.group(:item_id).order('avg(star) desc').pluck(:item_id))
  end

end
