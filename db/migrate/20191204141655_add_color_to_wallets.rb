class AddColorToWallets < ActiveRecord::Migration[5.0]
  def change
    add_column :wallets, :color, :integer
  end
end
