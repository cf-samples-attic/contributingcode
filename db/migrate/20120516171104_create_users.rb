class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid
      t.string  :fname
      t.string  :lname
      t.string  :email 
      t.string  :handle
      t.timestamps
    end
  end
end
