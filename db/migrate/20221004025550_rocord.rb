class Rocord < ActiveRecord::Migration[6.1]
  def change
    drop_table :item_tags
  end
end
