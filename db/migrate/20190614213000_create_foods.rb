class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.integer :restaurant_id
      t.string :name
      t.text :description
      t.integer :price
      t.text :img_url
      t.timestamps
    end
  end
end
