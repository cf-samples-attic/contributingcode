class Team < ActiveRecord::Base
  belongs_to :user 

  has_many :team_members, :dependent => :destroy
  has_many :join_requests, :dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_uniqueness_of :owner_id, :message => "Cant own many teams"
  validate :user_not_in_a_team

  def user_not_in_a_team
    user = User.find(owner_id)
    team = user.team
    if team.present?
     errors.add(:owner_id,"Already in a team")
    end   
  end   

end
