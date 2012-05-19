class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :owner_id
      t.integer :count 
      t.timestamps
    end
  end
end
