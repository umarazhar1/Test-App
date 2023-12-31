class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    #binding.break # Call to debugger
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article] This line is not working in rails 7
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to article_path(@article)
      #redirect_to @article   # this line has the same effect as above line
    else
      flash[:notice] = "Failed to create article!"
      render 'new', status: :unprocessable_entity
    end
  end
  
  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to article_path(@article)
    else
      flash[:notice] = "Failed to update the article!"
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end


  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
  
end
