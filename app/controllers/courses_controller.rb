class CoursesController < ApplicationController
  expose :posts, -> {
    category = Category.find_by(name: 'Cursos')

    if category
      category.posts
              .published
              .ordered
              .page(params[:page])
              .per(18)
    else
      Post.none
          .page(params[:page])
          .per(18)
    end
  }

  expose :course, -> { Post.friendly.find(params[:id]) }

  def index; end

  def show; end
end
