require "http"
require_relative '../services/retrieved_articles/retrieve_index.rb'
require_relative '../services/retrieved_articles/create_article_request.rb'


class RetrievedArticlesController < ApplicationController
  before_action :set_retrieved_article, only: %i[ show update destroy ]
  skip_before_action :verify_authenticity_token


  # GET /retrieved_articles
  def index
    @retrieved_articles = RetrieveArticlesIndex.retrieve_from_api

    #puts @retrieved_articles
    #render 'retrieved_articles/index'
  end

  # GET /retrieved_articles/1
  def show
    render json: @retrieved_article
  end

  # POST /retrieved_articles
  def create
    @retrieved_article = RetrievedArticle.new(retrieved_article_params)

    if @retrieved_article.save
      render json: @retrieved_article, status: :created, location: @retrieved_article
    else
      render json: @retrieved_article.errors, status: :unprocessable_entity
    end
  end


  def create_article
    CreateArticleRequest.send_request(article_params)

    # Handle the response according to your application's requirements
    if response.code == 200
      render status: :ok
    else
      render json: {error: "incorrect Article POST request to main app"}, status: :bad_request
    end
  end
  # PATCH/PUT /retrieved_articles/1
  def update
    if @retrieved_article.update(retrieved_article_params)
      render json: @retrieved_article
    else
      render json: @retrieved_article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /retrieved_articles/1
  def destroy
    @retrieved_article.destroy!
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
