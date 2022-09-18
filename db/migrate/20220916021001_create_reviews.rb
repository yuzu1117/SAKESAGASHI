class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :item_id
      t.text :content
      t.float :star
      t.integer :taste
      t.text :food
      t.text :situation

      t.timestamps
    end
  end
end
