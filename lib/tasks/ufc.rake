require 'csv'

namespace :ufc do
  desc "imports ufc data"
  task import: :environment do
    puts 'import'
    CSV.read('db/data/ufc223.csv', headers: true).each do |line|
      fighter1 = line['fighter1']&.strip
      fighter2 = line['fighter2']&.strip
      type = line['type']&.strip
      if line['fighter2']
        p [fighter1, fighter2, type]
      end
    end
  end
end
