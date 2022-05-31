class ArticlesController < ApplicationController
    #defined as :show in routes.rb
    def show
        #params are what is passed in url bar, the variable is :id
        @article = Article.find(params[:id])
    end


    #when this is made, you need a new view. (Much like show.html.erb in views/articles/  In this case we make index.html.erb)
    def index
        #@articles is an isntance variable which is available in views. (same as above)
        @articles = Article.all
    end

    def new

    end

    def create
        #render plain: params[:article]
        #permits the title and description from the article to be saved...
        @article = Article.new(params.require(:article).permit(:title, :description))
        @article.save
        #this is how you make a redirect...  Find the path in endpoints and append _path to it.
        #can also shorten this to redirect_to @article
        redirect_to article_path(@article)
    end
end