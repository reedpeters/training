require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it 'should test for name to be less than 255' do
      product = FactoryBot.build(:product, name: ("X" * 256))
      expect(product.valid?).to eq(false)
    end

    it 'should test for name to be less than 255' do
      product = FactoryBot.build(:product, name: ("X" * 255))
      expect(product.valid?).to eq(true)
    end

    it 'should test that the category value is not blank' do
      product = FactoryBot.build(:product, category: '')
      expect(product.valid?).to eq(false)
    end

    it 'should test the category value against a list' do
      product = FactoryBot.build(:product, category: 'otc')
      expect(product.valid?).to eq(true)
    end

    it 'should test the category value against a list' do
      product = FactoryBot.build(:product, category: 'not_in_list')
      expect(product.valid?).to eq(false)
    end
  end
end
