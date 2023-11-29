class ArticlesController < ApplicationController
  def show
    #binding.break # Call to debugger
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new

  end

  def create
    # render plain: params[:article] This line is not working in rails 7
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save
    redirect_to article_path(@article)
    #redirect_to @article   # this line has the same effect as above line

  end
end
