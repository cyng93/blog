require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:test_article) {
    Article.new( title: 'test_article',
                 text: 'test_text'
               )
  }

  test_file = File.join(Rails.root, '/spec/fixtures/files/test_photo.jpg')
  test_attachment = Rack::Test::UploadedFile.new(File.open(test_file))

  subject {
    described_class.new(article: test_article,
                        commenter: 'test_commenter',
                        body: 'test_body',
                        attachment: test_attachment
                       )
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is valid without a commenter' do
    subject.commenter = nil
    expect(subject).to be_valid
  end

  it 'is valid without a body' do
    subject.body = nil
    expect(subject).to be_valid
  end

  it 'is valid without an attachment' do
    subject.attachment = nil
    expect(subject).to be_valid
  end

  it 'is not valid without both body and attachment' do
    subject.body = nil
    subject.attachment = nil
    expect(subject).to_not be_valid
  end
end
