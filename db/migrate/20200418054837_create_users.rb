class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :lastname
      t.string :firstname
      t.text :bio
      t.text :interests

      t.timestamps null: false
    end
  end
end
