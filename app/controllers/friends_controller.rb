class FriendsController < ApplicationController
  before_action :set_friend, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]
  before_action :correct_user, only: [:edit, :update, :destroy]
  

  # GET /friends or /friends.json
  def index
    @friends = Friend.all.paginate(page: params[:page], per_page: 5)
  end

  # GET /friends/1 or /friends/1.json
  def show
    @friends = Friend.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = FriendPdf.new(@friends)
        send_data pdf.render
      end
      format.json { render json: @friends}
    end  

  end


  # GET /friends/new
  def new
    @friend = current_user.friends.build
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends or /friends.json
  def create
    @friend = current_user.friends.build(friend_params)

    respond_to do |format|
      if @friend.save
        format.html { redirect_to @friend, notice: "Friend was successfully created." }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update
    @user = current_user
    respond_to do |format|
      if @user.friends.update(friend_params)
        format.html { redirect_to @friend, notice: "Friend was successfully updated." }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: "Friend was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id, :image, books_attributes:[:id, :title, :_destroy])
    end
    def correct_user
      @friend = current_user.friends.find_by(id: params[:id])
      redirect_to friends_path, notice: "Not Authorize to Edit this Friend" if @friend.nil?
    end  
end
