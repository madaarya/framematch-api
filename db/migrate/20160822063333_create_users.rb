class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :token
      t.string :username
      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :token, unique: true
  end
end
