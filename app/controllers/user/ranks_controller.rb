class User::RanksController < ApplicationController

  def rank
    @ranks = Item.find(Review.group(:item_id).order('avg(star) desc').pluck(:item_id))
  end

  def sourness_ranks
    @sourness_ranks = Item.find(Review.group(:item_id).order('avg(sourness) desc').pluck(:item_id))
  end

  def sweetness_ranks
    @sweetness_ranks = Item.find(Review.group(:item_id).order('avg(sweetness) desc').pluck(:item_id))
  end

  def bitterness_ranks
     @bitterness_ranks = Item.find(Review.group(:item_id).order('avg(bitterness) desc').pluck(:item_id))
  end


end
