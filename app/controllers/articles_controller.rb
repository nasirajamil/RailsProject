class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "nasira", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
    @myidvar=params[:num]
    @msg="my msg"

  end

  def show
    @article = Article.find(params[:id])
    @articles= Article.group(:title).count
    if @article.id==39
      render plain: "This is first book with id 39 in database"
    elsif @article.id==42
      render action: "non_Commented_Book"
    end
    #render plain: "Rendering Text"
  end

  def new
    @article=Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
      #render body: "raw"
      #render plain: "OK"
    end
  end

  def non_Commented_Book
    @myparam=params[:v]
    #render plain: "Another page with routing parameter " + @myparam
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end

