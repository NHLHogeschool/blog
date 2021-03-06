class Post < ActiveRecord::Base
  attr_accessible :body, :title
  validates_presence_of :title
  has_many :comments, dependent: :destroy

  def punchline
    "#{title} heeft #{comments.count} reactie"
  end
end
