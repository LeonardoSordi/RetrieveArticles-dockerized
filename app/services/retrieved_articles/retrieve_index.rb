require "http"
class RetrieveArticlesIndex

  def self.retrieve_from_api
    response = HTTP.get("http://api:3000/articles")
    body = response.parse
    body
  end

end