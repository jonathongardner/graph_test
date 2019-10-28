class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, index: true, unique: true
      t.string :username, index: true, unique: true
      t.boolean :admin, default: false

      # database_authentication
      t.string :password_digest

      t.timestamps
    end
  end
end
