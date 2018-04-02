class Pick < ApplicationRecord
  belongs_to :picker, class_name: 'RedditUser'
  belongs_to :match
  belongs_to :match_competitor, required: false

  validates_uniqueness_of :picker_id, scope: :match_id
end
