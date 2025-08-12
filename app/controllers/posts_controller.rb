class PostsController < ApplicationController
  before_action :set_post, only: %i[ edit update destroy ]

  def index
  @posts = Post.all

  if params[:raise_exception] == "true"
    raise "some exception (simulação de erro)"
  end

  respond_to do |format|
    format.html # garante q o bloco renderiza index.html.erb
  end

  rescue StandardError => e
    Rails.logger.error("An error occurred: #{e.message}")
    redirect_to posts_path, alert: "An error occurred while fetching posts (mensagem de alerta amigável)."
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit;end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "Post alterado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path, notice: "Post deletado com sucesso."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :banner_image, :body)
  end
end
