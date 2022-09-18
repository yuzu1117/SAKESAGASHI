class ChangeColumnsNotnullAddItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :name, :string, null: false
    change_column :items, :maker, :string, null: false
    change_column :items, :genre_id, :integer, null: false
    change_column :items, :release_date, :datetime, null: false
  end
end
