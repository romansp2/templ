class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :password
      t.string :email
      t.string :name
      t.string :surname

      t.timestamps
    end
  end
end
