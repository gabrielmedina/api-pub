class CreateBeers < ActiveRecord::Migration[5.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
