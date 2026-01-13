class CoursesController < ApplicationController
  def index
    category = Category.find_by(name: 'Cursos')

    @posts =
      if category.present?
        category.posts.published.ordered.page(params[:page]).per(18)
      else
        Post.none
      end
  end
end
