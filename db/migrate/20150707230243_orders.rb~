class Orders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :customer_name, limit: 50, null: false
      t.string :email, limit: 100
      t.string :phone_number, limit: 20
      t.string :delivery_address, limit: 200, null: false
      t.integer :quantity
      t.string :status, limit: 10
      t.timestamp :created_at
      t.references :beer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end


  def self.down
    drop_table :orders
  end
end
