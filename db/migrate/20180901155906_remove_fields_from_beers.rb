class RemoveFieldsFromBeers < ActiveRecord::Migration[5.1]
  def change
    remove_column :beers, :name
    remove_column :beers, :price
    remove_column :beers, :quantity
  end
end
