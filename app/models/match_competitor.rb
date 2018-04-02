class MatchCompetitor < ApplicationRecord
  belongs_to :match
  belongs_to :competitor

  def to_s
    name
  end
end
