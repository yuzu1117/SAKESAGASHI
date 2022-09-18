class AddDetailsToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :sharpness, :integer, default: 0, null: false
    add_column :reviews, :rich, :integer, default: 0, null: false
    add_column :reviews, :sourness, :integer, default: 0, null: false
    add_column :reviews, :sweetness, :integer, default: 0, null: false
    add_column :reviews, :bitterness, :integer, default: 0, null: false
  end
end
