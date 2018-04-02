class MatchCompetitor < ApplicationRecord
  belongs_to :match
  belongs_to :competitor
  has_many :picks

  def to_s
    name
  end
end
