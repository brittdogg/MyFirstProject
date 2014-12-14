class ArticlesController < ApplicationController

	def new # view portion of create action; points to View file

	end

	def create #saves to database from new
		# render plain: params[:article].inspect
		@article = Article.new(article_params) #"Article" comes from the Model
		@article.save #saves to the database
		redirect_to @article #redirects user in browser to view the article they just saved
	end
	def edit # view portion of update action
		@article = Article.find(params[:id])
	end

	def update #saves to database from edit
		@article = Article.find(params[:id])
		if @article.update(article_params)
		redirect_to @article
		else
		render 'edit'
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def index
		@articles = Article.all
	end

	private
	  def article_params
	  	  params.require(:article).permit(:title, :text)
	  end



end
