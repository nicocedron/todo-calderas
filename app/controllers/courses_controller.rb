class CoursesController < ApplicationController
  expose :posts, -> { category = Category.find_by(name: 'Cursos'); category&.posts&.published&.ordered&.page(params[:page])&.per(18) || [] }

  def index; end
end
