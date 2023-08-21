# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  def like
    @article = find_article
    puts "Current User ID: #{current_user.id}"
    puts "Article ID: #{params[:article_id]}"
    if current_user.likes.create(article: @article)
      puts "Like created successfully!"
    else
      puts "Like creation failed!"
    end
    render_updated_counts
  end
  
  
    def dislike
      @article = Article.find(params[:article_id])
      current_user.dislikes.create(article: @article)
      render_updated_counts
    end
  
    private
  
    def render_updated_counts
      puts "rendering updated counts";
      render json: {
        likeCount: @article.likes.count,
        dislikeCount: @article.dislikes.count
      }
    end
    
  end
  
