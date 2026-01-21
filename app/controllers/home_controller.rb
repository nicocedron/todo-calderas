class HomeController < ApplicationController
  expose :slides, -> { Slide.ordered }
  expose :posts, ->  { Post.published.ordered.limit(6) }

  def index; end
end
