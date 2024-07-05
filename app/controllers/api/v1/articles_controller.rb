module Api
  module V1
    class ArticlesController < ApplicationController
      before_action :authenticate_user!
      load_and_authorize_resource

     def index
        @articles = Article.page(params[:page])
        render json: @articles.map { |article| ArticlePresenter.new(article).as_json }
      end

      def show
        @article = Article.find(params[:id])
        render json: ArticlePresenter.new(@article).as_json
      end

      def create
        @article = current_user.articles.build(article_params)
        if @article.save
          render json: @article, status: :created
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
          render json: @article
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @article = Article.find(params[:id])
        @article.destroy
        head :no_content
      end

      private

      def article_params
        params.require(:article).permit(:title, :content)
      end
    end
  end
end
