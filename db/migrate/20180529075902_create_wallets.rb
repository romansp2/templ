class CreateWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.string :private_key
      t.string :public_key
      t.string :address
      t.integer :user_id
      t.integer :password
      t.timestamps
    end
  end
end
