require 'spec_helper'

describe Post do

  let(:post) { Post.new title: 'Post Title', body: 'Post Body' }

  it 'returns a nice punchline' do
    expect(post.punchline).to be_eql('Post Title heeft 0 reactie')
  end

  it 'has two comments' do
    2.times do |i|
      post.comments.new(body: "Comment #{i}")
    end

    expect(post).to have(2).comments
  end

end
