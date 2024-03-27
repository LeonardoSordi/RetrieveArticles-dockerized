require "http"
require 'json'
require_relative '../services/retrieved_articles/retrieve_articles_index_request.rb'
require_relative '../services/retrieved_articles/create_article_request.rb'
require_relative '../services/retrieved_articles/destroy_article_request.rb'



class RetrievedArticlesController < ApplicationController
  #before_action :set_retrieved_article, only: %i[ show update ]
  skip_before_action :verify_authenticity_token



  # GET /retrieved_articles/1
  def show
    render json: @retrieved_article
  end


  # PATCH/PUT /retrieved_articles/1
  def update
    if @retrieved_article.update(retrieved_article_params)
      render json: @retrieved_article
    else
      render json: @retrieved_article.errors, status: :unprocessable_entity
    end
  end



  #----HTTP CALLS TO MAIN BLOG APP----#

  # GET Articles
  def index
    @retrieved_articles = RetrieveArticlesIndexRequest.retrieve_from_api
  end


  #POST Article
  def create_article
    response = CreateArticleRequest.send_request(article_params)
    if response.code  < 300
      render json: {status: "POST request completed. Response code: #{response}"}
    else
      render json: {error: "unable to process Article POST request to main app. Response code: #{response.code} "}, status: :bad_request
    end
  end


  #DELETE Article
  def destroy
    article_id = params[:article_id]
    author_key= params[:author_key]

    puts author_key
    puts article_id

    response = DestroyArticleRequest.send_request(article_id, author_key)
    puts "RISPOSTA:"
    puts response
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

    if response.code <= 300
      render json: {status: "POST request completed. Response code: #{response.code}"}
    else
      render json: {error: "unable to process Article DELETE request to main app. Response code: #{response.code} "}, status: :bad_request
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retrieved_article
      @retrieved_article = RetrievedArticle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def retrieved_article_params
      params.permit.fetch(:retrieved_article, {}).permit(:title, :body, :status, :author_id, :language)
    end

  def article_params
    params.permit(:title, :body, :status, :author_id, :language,  :authenticity_token, :commit, :author_key)
  end
end
