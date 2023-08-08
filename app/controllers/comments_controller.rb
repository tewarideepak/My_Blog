class CommentsController < ApplicationController

    def new
        @article=Article.find(params[:article_id])
        @comment=@article.comments.build
    end

    def create
        # @article=Article.find(params[:article_id])
        # @comment=@article.comments.create(comment_params)
        # @comment.author=User.last
        @article = Article.find(params[:article_id])
        @comment = @article.comments.new(comment_params)
        @comment.author = User.last
        if @comment.save
            redirect_to article_path(@article), notice: 'Comment was successfully created.'
        else
            render 'new'
        end
    end

    # def create
    #     @article = Article.find(params[:article_id])
    #     @comment = @article.comments.build(comment_params)
      
    #     if @comment.save
    #       redirect_to article_path(@article), notice: 'Comment was successfully created.'
    #     else
    #       flash.now[:alert] = 'Comment could not be created.'
    #       render 'new'
    #     end
    #   end
      

    def destroy
        @article=Article.find(params[:article_id])
        @comment=@article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end


    private
        def comment_params
            params.require(:comment).permit(:commenter,:body)
        end

end
