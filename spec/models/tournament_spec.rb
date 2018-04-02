require 'rails_helper'

RSpec.describe Tournament, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:matches) }
end