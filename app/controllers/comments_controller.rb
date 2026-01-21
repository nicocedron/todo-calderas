class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if verify_recaptcha(model: @comment) && @comment.save
      redirect_to root_path, notice: 'Comentario enviado exitosamente.'
    else
      redirect_to root_path, alert: 'Error al enviar el comentario. Verifica el reCAPTCHA.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end
end
