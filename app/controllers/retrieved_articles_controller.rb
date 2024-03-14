require "http"
require_relative '../services/retrieved_articles/retrieve_index.rb'

class RetrievedArticlesController < ApplicationController
  before_action :set_retrieved_article, only: %i[ show update destroy ]

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
      params.fetch(:retrieved_article, {})
    end
end
