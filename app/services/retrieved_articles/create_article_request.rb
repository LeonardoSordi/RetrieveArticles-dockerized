require "http"
class CreateArticleRequest

  def self.send_request(params)
    request = HTTP.post("http://api:3000/articles", form: params)
    request
  end

end