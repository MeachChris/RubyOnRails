class ArticlesController < ApplicationController
    def show
        #params are what is passed in url bar, the variable is :id
        @article = Article.find(params[:id])
    end
end