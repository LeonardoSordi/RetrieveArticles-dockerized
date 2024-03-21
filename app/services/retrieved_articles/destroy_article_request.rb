require "http"
require "json"

class DestroyArticleRequest

  def self.send_request(article_id)
    article_request = HTTP.get("http://api:3000/articles/#{article_id}")

    parsed_article_request = JSON.parse(article_request.body)

    author_id = parsed_article_request["article"]["author_id"]

    puts "AUTHOR_ID: "
    puts author_id


    author_request = HTTP.get("http://api:3000/authors/#{author_id}")

    puts "RESPONSE INTO SERVICE: "
    puts author_request
    puts"response____end"

=begin
    parsed_author_request = JSON.parse(author_request.body)

    author_key = parsed_author_request["author"]["key"]

    delete_article_request = HTTP.delete("http://api:3000/articles/#{article_id}", params: {author_key: author_key})

    delete_article_request
=end
  end



end