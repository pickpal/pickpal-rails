class RedditUser < ApplicationRecord
  def to_s
    username
  end
end
