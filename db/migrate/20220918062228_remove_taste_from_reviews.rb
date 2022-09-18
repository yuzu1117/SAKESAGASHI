class RemoveTasteFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :taste, :integer
  end
end
