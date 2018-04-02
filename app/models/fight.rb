class Fight < Match
  # belongs_to :ufc_event, inverse_of: :fights, foreign_key: :tournament_id
  has_many :fighters, through: :match_competitors, source: :competitor, class_name: "Fighter"

  def to_s
    name
  end

  def name
    fighters.map(&:name).join(" vs ")
  end

  def self.make first_fighter, second_fighter
    fighter1 = Fighter.find_or_create_by(name: first_fighter)
    fighter2 = Fighter.find_or_create_by(name: second_fighter)

    self.create!(fighters: [fighter1, fighter2])
  end

end
