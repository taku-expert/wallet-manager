class CreateWallets < ActiveRecord::Migration[5.0]

  def change
    create_table :wallets do |t|
      t.string :title           null: false
      t.integer :price
      t.integer :color
      t.references :user, foreign_key: true
      t.timestamps

      t.string :email,              null: false, default: ""

    end
  end
  
end