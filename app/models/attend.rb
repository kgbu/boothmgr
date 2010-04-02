class Attend < ActiveRecord::Base
  validates_uniqueness_of :member_id, :scope => "game_id"
  belongs_to :game
  belongs_to :member
end
