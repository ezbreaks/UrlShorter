$('.result').append('<p class="short_url">Your Shortened Link: <%= link_to @link.display_slug, @link.display_slug, target: "_blank" %></p>')
