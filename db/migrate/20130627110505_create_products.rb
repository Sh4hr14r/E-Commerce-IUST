class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :manufacturer
      t.text :description
      t.float :price
      t.string :image_url
      t.integer :stock
      t.integer :sold
      t.float :income

      t.timestamps
    end
  end
end
