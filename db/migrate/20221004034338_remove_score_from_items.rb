class RemoveScoreFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :score, :decimal
  end
end
