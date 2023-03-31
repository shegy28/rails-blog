require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'John Doe',
      photo: 'https://picsum.photos/200/300',
      bio: 'Developer',
      posts_counter: 5
    )
  end
  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a negative posts counter' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'is not valid with a non-integer posts counter' do
    subject.posts_counter = 1.5
    expect(subject).to_not be_valid
  end

  it 'should display most recent posts' do
    subject.posts_counter = 5
    expect(subject.recent_posts).to eq(subject.posts.last(5))
  end
end
