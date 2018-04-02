class RedditUser < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  has_many :picks, foreign_key: :picker_id

  def to_s
    username
  end
end
