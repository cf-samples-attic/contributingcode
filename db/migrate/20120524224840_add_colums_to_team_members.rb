class AddColumsToTeamMembers < ActiveRecord::Migration
  def change
    add_column :team_members, :token, :string
    add_column :team_members, :status, :boolean, :default => false 
  end
end
