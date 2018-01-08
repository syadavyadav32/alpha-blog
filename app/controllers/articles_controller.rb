class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:show, :edit, :update, :destroy]

def index
  @articles = Article.all
end

def new
  @article = Article.new
end

def create
  #render plain: params[:article].inspect  -- to show the parameters passed to create action from new.html.erb file 
  
  @article = Article.new(article_params)
  if @article.save
    flash[:notice] = "Article was successfully created"
    redirect_to article_path(@article) 
  else
    render 'new'  #render new template which is new.hrml.erb
  end
end

def show
end

def edit
end

def update
  if @article.update(article_params)
    redirect_to article_path(@article)
  else
    render 'edit'
  end
end

def destroy
  @article.destroy
  flash[:notice] = "Article was successfully deleted"
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
