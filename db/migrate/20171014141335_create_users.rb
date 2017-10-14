class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :access_token
      t.string  :password_digest
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
