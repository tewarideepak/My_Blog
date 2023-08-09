class ArticlesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_article, only: [:show, :edit, :update, :destroy]
  
    def index
      @articles = Article.paginate(page: params[:page], per_page: 5)
    end
  
    def show
    end
  
    def new
        @article = current_user.articles.build
    end
    
    def create
        @article=current_user.articles.new(article_params)
        @article.author=current_user
      if @article.save
        flash[:notice] = "Article created successfully"
        redirect_to user_article_path(current_user, @article)
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @article.update(article_params)
        flash[:notice] = "Article updated successfully"
        redirect_to user_article_path(current_user, @article)
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @article.comments.destroy_all
      @article.destroy
      redirect_to user_articles_path(current_user)
    end

    def articles_with_comments
        @articles_with_comments = Article.includes(:comments).order('articles.created_at DESC')
    end
  
    private
  
    def set_article
      @article = Article.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:image, :title, :description)
    end
  end
  