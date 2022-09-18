class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :maker
      t.datetime :release_date
      t.timestamps
    end
  end
end
