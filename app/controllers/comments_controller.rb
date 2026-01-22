class CommentsController < ApplicationController
  before_action :authenticate_admin!, only: [:destroy]

  def create
    @post = Post.friendly.find(params[:article_id] || params[:course_id])
    @comment = @post.comments.new(comment_params)

    if verify_recaptcha(model: @comment) && @comment.save
      redirect_to_back_or_post(@post, notice: 'Comentario enviado exitosamente.')
    else
      redirect_to_back_or_post(@post, alert: 'Error al enviar el comentario. Verifica el reCAPTCHA.')
    end
  end

  def destroy
    @post = Post.friendly.find(params[:article_id] || params[:course_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to_back_or_post(@post, notice: 'Comentario eliminado exitosamente.')
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end

  def redirect_to_back_or_post(post, flash_hash = {})
    if params[:article_id]
      redirect_to article_path(post), flash_hash
    elsif params[:course_id]
      redirect_to course_path(post), flash_hash
    else
      redirect_back(fallback_location: root_path, flash: flash_hash)
    end
  end
end
