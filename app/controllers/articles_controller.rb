class ArticlesController < ApplicationController
  # load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  


  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = current_user
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

  def like
    article = Article.find(params[:article_id])

    # Check if the user has already liked the article
    if article.liked_by_user?(current_user)
      render json: { error: "Article already liked by the user" }, status: :unprocessable_entity
    else
      if article.disliked_by_user?(current_user)
        article.dislikes.find_by(user: current_user).destroy
      end
      # Proceed with the like logic
      like = article.likes.find_or_create_by(user: current_user)
      # like.update(liked: true)
      render json: { likes: article.likes.count, dislikes: article.dislikes.count }
    end
  end

  def dislike
    article = Article.find(params[:article_id])

    # Check if the user has already disliked the article
    if article.disliked_by_user?(current_user)
      render json: { error: "Article already disliked by the user" }, status: :unprocessable_entity
    else
      if article.liked_by_user?(current_user)
        article.likes.find_by(user: current_user).destroy
      end
      # Proceed with the dislike logic
      dislike = article.dislikes.find_or_create_by(user: current_user)
      # dislike.update(liked: false)
      render json: { likes: article.likes.count, dislikes: article.dislikes.count }
    end
  end
  
  

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:image, :title, :description)
  end
end
