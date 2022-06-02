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
        #must instantiate a new article for if the "if" condition doesn't work on first load.
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        #render plain: params[:article]
        #permits the title and description from the article to be saved...
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice] = "article was created succesfully."
        #this is how you make a redirect...  Find the path in endpoints and append _path to it.
        #can also shorten this to redirect_to @article
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "article updated!"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
        

    end

end