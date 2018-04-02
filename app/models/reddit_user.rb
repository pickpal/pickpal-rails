class RedditUser < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_many :picks, foreign_key: :picker_id, dependent: :destroy

  def to_s
    username
  end
end
