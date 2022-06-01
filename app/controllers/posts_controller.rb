class PostsController < ApplicationController

  before_action :set_post, only: %i[ show edit update destroy ]

  def enter_message
    massage = params[:massage]
    tg_chat_id = params[:tg_chat_id]
    TelegramMailer.send_massage(massage, tg_chat_id).deliver_now
    redirect_to posts_path, notice: 'success'
  end

  def coffee_store

  end

  def chat_messages
    @messages = Message.all
  end

  # GET /posts or /posts.json
  def index
    @posts = Message.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
        text_massage = "Создан новый пост: #{@post.body}"
        TelegramMailer.send_massage(text_massage).deliver_now
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
        text_massage = "Пост обновлен: #{@post.body}"
        TelegramMailer.send_massage(text_massage).deliver_now
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
      text_massage = "Пост удален: #{@post.body}"
      TelegramMailer.send_massage(text_massage).deliver_now
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:body)
    end
end
