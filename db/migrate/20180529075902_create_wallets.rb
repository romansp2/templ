class CreateWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.string :private_key
      t.string :public_key
      t.integer :user_id
      t.timestamps
    end
  end
end
