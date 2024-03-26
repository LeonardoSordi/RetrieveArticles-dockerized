require "http"
require "json"

class DestroyArticleRequest

  def self.send_request(article_id)

    article_request = HTTP.get("http://api:3000/articles/#{article_id}")
    parsed_article_request = JSON.parse(article_request.body)
    author_id = parsed_article_request["article"]["author_id"].to_s

    author_request = HTTP.get("http://api:3000/authors/#{author_id}")
    parsed_author_request = JSON.parse(author_request.body)
    author_key = parsed_author_request["author"]["key"]

    delete_article_request = HTTP.delete("http://api:3000/articles/#{article_id}", :params => {:author_key => author_key})
    delete_article_request

  end



end