class ChangeColumnsNotnullAddReviews < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :user_id, :integer, null: false
    change_column :reviews, :item_id, :integer, null: false
    change_column :reviews, :content, :text, null: false
    change_column :reviews, :star, :float, null: false
    change_column :reviews, :taste, :integer, null: false
  end
end
