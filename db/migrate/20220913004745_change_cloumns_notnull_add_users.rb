class ChangeCloumnsNotnullAddUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :name, :string, null: false
    change_column :users, :nickname, :string, null: false
  end
end
