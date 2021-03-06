require 'rails_helper'

RSpec.describe Feed, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:url) }
    it { should validate_uniqueness_of(:url) }
  end
end
