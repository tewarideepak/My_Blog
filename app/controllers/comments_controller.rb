class CommentsController < ApplicationController
    load_and_authorize_resource


    def new
        @article=Article.find(params[:article_id])
        @comment=@article.comments.build
    end

    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.new(comment_params)
        @comment.author = current_user
        if @comment.save
            redirect_to user_article_path(current_user,@article), notice: 'Comment was successfully created.'
        else
            render 'new'
        end
    end

    def destroy
        @article=Article.find(params[:article_id])
        @comment=@article.comments.find(params[:id])
        @comment.destroy
        redirect_to user_article_path(current_user,@article)
    end


    private
        def comment_params
            params.require(:comment).permit(:commenter,:body)
        end

end
