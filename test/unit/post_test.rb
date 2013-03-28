require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "expect a new record" do
    post = Post.new(title: 'Dit is een nieuw artikel')
    assert_equal('Dit is een nieuw artikel', post.title)
  end

  test "my punchlines!" do
    post = Post.create(title: 'Dit is een artikel')
    post.comments.create(body: 'Dit is een reactie')
    assert_equal('Dit is een artikel heeft 1 reactie', post.punchline)

    post.title = 'Dit is een nieuw artikel'
    assert_equal('Dit is een nieuw artikel heeft 1 reactie', post.punchline)
  end
end
