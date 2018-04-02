class Tournament < ApplicationRecord
  has_closure_tree
  validates_presence_of :name
  has_many :matches, dependent: :destroy

  def to_s
    name
  end
end
require_dependency 'ufc_event'
