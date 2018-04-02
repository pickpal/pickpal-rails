class Match < ApplicationRecord
  has_many :match_competitors, dependent: :destroy
  has_many :competitors, through: :match_competitors
  belongs_to :tournament, polymorphic: true, required: false
  has_many :picks, dependent: :destroy
end
