var Comment = Backbone.Model.extend();

var Comments = Backbone.Collection.extend({
  model: Comment,
  url: '/posts/2/comments'
})

window.comments = new Comments();
comments.fetch();

var CommentView = Backbone.View.extend({
  initialize: function() {
    this.model.on('change', this.render, this);
  },

  render: function() {
    this.$el.html('<article>' + this.model.get('body') + '</article>');

    return this;
  }
})

var CommentsView = Backbone.View.extend({
  initialize: function() {
    this.collection.on('reset', this.render, this);
  },

  render: function() {
    var that = this;

    this.collection.each(function(comment){
      var commentView = new CommentView({model: comment});
      that.$el.append(commentView.render().el);
    })

    return this;
  }
})

var CommentsRouter = Backbone.Router.extend({
  routes: {
    '': 'comments'
  },

  comments: function() {
    var commentsView = new CommentsView({collection: comments});
    $('#comments').html(commentsView.render().el);
  }
})

$(function(){
  window.app = new CommentsRouter();
  Backbone.history.start();
})