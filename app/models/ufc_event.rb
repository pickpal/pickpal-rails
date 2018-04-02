class UfcEvent < Tournament
  # has_many :fights, class_name: 'Match'
  # has_many :fights#, as: :tournament, class_name: 'Fight'
  # alias_method :fights, :matches
  has_many :fights, foreign_key: :tournament_id, dependent: :destroy
end
require_dependency 'ufc_numbered_event'
