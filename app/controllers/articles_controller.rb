class ArticlesController < ApplicationController
  expose :post,  -> { Post.friendly.find(params[:id]) }
  expose :posts, -> { Post.published.ordered.page(params[:page]).per(18) }

  def index; end

  def show
    post.update_attribute :views, post.views + 1
  end
end
