class CoursesController < ApplicationController
  expose :posts, -> { Category.find_by(name: 'Cursos').posts.published.ordered.page(params[:page]).per(18) }

  def index; end
end
