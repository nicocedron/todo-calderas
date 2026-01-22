class CommentsController < ApplicationController
  before_action :authenticate_admin!, only: [:destroy]

  def create
    # Usa friendly.find para buscar el post por slug
    @post = Post.friendly.find(params[:course_id])
    @comment = @post.comments.new(comment_params)
    
    if verify_recaptcha(model: @comment) && @comment.save
      redirect_to course_path(@post), notice: 'Comentario enviado exitosamente.'
    else
      redirect_to course_path(@post), alert: 'Error al enviar el comentario. Verifica el reCAPTCHA.'
    end
  end

  def destroy
    @post = Post.friendly.find(params[:course_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to course_path(@post), notice: 'Comentario eliminado exitosamente.'
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end
end