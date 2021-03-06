class Beers < ActiveRecord::Migration
  def self.up
    create_table :beers do |t|
      t.string :name, limit: 50, null: false
      t.string :description, limit: 250, null: false
      t.string :style, limit: 30, null: false
      t.string :bootle_size, limit: 20, null: false
      t.binary :label
      t.float :price, null: false
      t.integer :maximum_order_amount
      t.integer :available_quantity, null: false, default: 0
      t.timestamp :created_at 

      t.timestamps null: false
    end
  end


  def self.down
    drop_table :beers
  end
end
