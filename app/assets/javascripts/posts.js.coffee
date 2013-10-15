$ ->
  return true

  posts = $('#posts-container').data('posts')
  $('body').empty()
  for post in posts
    link = $('<a/>').attr({href: "/posts/#{post.id}.json"}).html(post.title)
    paragraph = $('<p/>').html link

    link.on 'click', (evt) ->
      evt.preventDefault()
      $.getJSON this.href, (post) =>
        $(this).after $('<p/>').html(post.body)

    $('body').append paragraph

  # $.getJSON '/posts.json', (posts) ->
  #   $('body').empty()
  #   for post in posts
  #     link = $('<a/>').attr({href: "/posts/#{post.id}.json"}).html(post.title)
  #     paragraph = $('<p/>').html link

  #     link.on 'click', (evt) ->
  #       evt.preventDefault()
  #       $.getJSON this.href, (post) =>
  #         $(this).after $('<p/>').html(post.body)

  #     $('body').append paragraph

