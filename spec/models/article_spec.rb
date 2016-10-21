require 'rails_helper'

RSpec.describe Article, type: :model do
  subject {
    described_class.new( title: 'Behaviour driven development',
                         text: 'check it, it is really awesome!')
  }

  describe 'Associations' do
    # ver.1 - ori rspec syntax
    # it 'has many comments' do
    #   assc = described_class.reflect_on_association(:comments)
    #   expect(assc.macro).to eq :has_many
    # end

    # ver.2 - using `shoulda`
    it { should have_many(:comments) }
  end

  describe 'Validation' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is valid without a text' do
      subject.text = nil
      expect(subject).to be_valid
    end
  end
end
