require 'csv'

namespace :ufc do
  desc "imports ufc data"
  task import: :environment do
    Tournament.destroy_all
    ufc = UfcNumberedEvent.create(name: 'UFC 223')
    CSV.read('db/data/ufc223.csv', headers: true).each do |line|
      if line['fighter2']
        card = UfcNumberedEvent.find_or_create_by(name: line['type'].strip, parent: ufc)
        card.fights.make(line['fighter1'].strip, line['fighter2'].strip)
      end
    end
  end
end
