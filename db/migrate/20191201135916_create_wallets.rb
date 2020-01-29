class CreateWallets < ActiveRecord::Migration[5.0]

  def change
    create_table :wallets do |t|
      t.string :title,         null: false
      t.integer :price,        null: false
      t.integer :color
      t.references :user,      foreign_key: true
      t.timestamps
    end
  end
  
end