class CommentsController < ApplicationController
  before_action :set_article
  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def index
    @comments = @article.comments
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
