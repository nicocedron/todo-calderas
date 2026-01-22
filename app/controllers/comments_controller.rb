class CommentsController < ApplicationController
  before_action :authenticate_admin!, only: [:destroy]

  def create
    @course = Course.find(params[:course_id])
    @comment = @course.comments.new(comment_params)
    if verify_recaptcha(model: @comment) && @comment.save
      redirect_to course_path(@course), notice: 'Comentario enviado exitosamente.'
    else
      redirect_to course_path(@course), alert: 'Error al enviar el comentario. Verifica el reCAPTCHA.'
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @comment = @course.comments.find(params[:id])
    @comment.destroy
    redirect_to course_path(@course), notice: 'Comentario eliminado exitosamente.'
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end
end
