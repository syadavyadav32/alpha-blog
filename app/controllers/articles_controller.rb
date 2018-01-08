class ArticlesController < ApplicationController

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
  @article = Article.find(params[:id])
end
  

private

def article_params
  params.require(:article).permit(:title, :description)
end

end
