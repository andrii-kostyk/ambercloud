class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uuid
      t.string :name
      t.string :password_digest
      t.string :token
      t.integer :role

      t.timestamps null: false
    end
  end
end
