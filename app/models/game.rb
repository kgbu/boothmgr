class Game < ActiveRecord::Base
  validates_presence_of :title, :kickoff
  validates_uniqueness_of :title, :kickoff
  validates_length_of :title, :minimum => 3
  has_many :attends
end
