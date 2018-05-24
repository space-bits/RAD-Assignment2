class ItemsController < ApplicationController

  def show
    type = "article"
    @type = type
    if type.downcase.eql? "article"
      @item = Article.find(params[:id])
    elsif type.downcase.eql? "comment"
      @item = Comment.find(params[:id])
    end
  end

end
