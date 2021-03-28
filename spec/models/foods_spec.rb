require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'relationships' do
    it {should belong_to :refrigerator}
  end
end