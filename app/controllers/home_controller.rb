class HomeController < ApplicationController
  expose :slides, -> { Slide.ordered }
  expose :posts, ->  { Post.published.ordered.limit(6) }
  expose :comment, -> { Comment.new }

  def index; end

  def create_comment
    @comment = Comment.new(comment_params)
    if verify_recaptcha(model: @comment) && @comment.save
      flash[:notice] = "¡Gracias por tu comentario!"
      redirect_to root_path
    else
      flash[:alert] = "Error al enviar el comentario. Verifica el reCAPTCHA."
      redirect_to root_path(anchor: 'comment-form')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :message)
  end
end
