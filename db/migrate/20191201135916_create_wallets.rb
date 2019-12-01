class CreateWallets < ActiveRecord::Migration[5.0]
  def change
    create_table :wallets do |t|
      t.string :title
      t.integer :price

      t.timestamps
    end
  end
end
