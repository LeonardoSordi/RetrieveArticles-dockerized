require "http"
require "json"

class DestroyArticleRequest

  def self.send_request(article_id, author_key)


    #passes author's key as a parameter
    #the API app checks if the passed key equals article's creator key and then proceeds to delete the article
    delete_article_request = HTTP.delete("http://api:3000/articles/#{article_id}", :params => {:author_key => author_key})
    delete_article_request
  end



end