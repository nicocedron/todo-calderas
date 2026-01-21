class CommentsController < ApplicationController
  before_action :authenticate_admin!, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)
    if verify_recaptcha(model: @comment) && @comment.save
      redirect_to root_path, notice: 'Comentario enviado exitosamente.'
    else
      redirect_to root_path, alert: 'Error al enviar el comentario. Verifica el reCAPTCHA.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path, notice: 'Comentario eliminado exitosamente.'
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end
end
