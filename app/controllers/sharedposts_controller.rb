class SharedpostsController < ApplicationController
  before_action :set_sharedpost, only: [:show, :edit, :update, :destroy]

  # GET /sharedposts
  # GET /sharedposts.json
  def index
    @sharedposts = Sharedpost.all
  end

  # GET /sharedposts/1
  # GET /sharedposts/1.json
  def show
  end

  # GET /sharedposts/new
  def new
    @sharedpost = Sharedpost.new
  end

  # GET /sharedposts/1/edit
  def edit
  end

  # POST /sharedposts
  # POST /sharedposts.json
  def create
    @sharedpost = Sharedpost.find_by(user_id: sharedpost_params[:user_id], post_id: params[:post_id])
    if @sharedpost == nil
      @sharedpost = Post.find(params[:post_id]).sharedposts.new(sharedpost_params)
      respond_to do |format|
        if @sharedpost.save
          format.html { redirect_to post_path(@sharedpost.post_id), notice: 'Succesfully following this .' }
          format.json { render :show, status: :created, location: @sharedpost }
        else
          format.html { render :new }
          format.json { render json: @sharedpost.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to post_path(@sharedpost.post_id), notice: 'Stopped following this .'
      @sharedpost.destroy
    end

  end

  # PATCH/PUT /sharedposts/1
  # PATCH/PUT /sharedposts/1.json
  def update
    respond_to do |format|
      if @sharedpost.update(sharedpost_params)
        format.html { redirect_to @sharedpost, notice: 'Sharedpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @sharedpost }
      else
        format.html { render :edit }
        format.json { render json: @sharedpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sharedposts/1
  # DELETE /sharedposts/1.json
  def destroy
    @sharedpost.destroy
    respond_to do |format|
      format.html { redirect_to sharedposts_url, notice: 'Sharedpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sharedpost
      @sharedpost = Sharedpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sharedpost_params
      params.require(:sharedpost).permit(:user_id, :posts_id, :date_of_sharing)
    end
end
