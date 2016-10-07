class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    # Notify user for invalid creation
    if !@comment.valid?
      flash[:message] = @article.errors.full_messages
    end

    # redirect here will cause including error msg twice, check log for details
    #   yet we need redirect to show the article again
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :attachment)
    end
end
