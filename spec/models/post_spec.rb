require 'spec_helper'

describe Post do

  it 'has two comments' do
    post = Post.new

    2.times do |i|
      post.comments.new(body: "Comment #{i}")
    end

    expect(post).to have(2).comments
  end

end
