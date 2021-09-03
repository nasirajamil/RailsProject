class CommentsController < ApplicationController

  http_basic_authenticate_with name: "nasira", password: "secret", only: :destroy

  before_action :set_article

  def index
    #@comments = @article.comments
    @comments=Comment.find_by_sql("SELECT * FROM comments")
  end

  def create
    @comment = @article.comments.create(comment_params)
    #redirect_to article_path(@article)
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
    params.require(:comment).permit(:commenter, :body)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
