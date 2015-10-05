class RequestmembersController < ApplicationController
  before_action :set_requestmember, only: [:show, :edit, :update, :destroy]

  # GET /requestmembers
  # GET /requestmembers.json
  def index
    @requestmembers = Requestmember.all
  end

  # GET /requestmembers/1
  # GET /requestmembers/1.json
  def show
  end

  # GET /requestmembers/new
  def new
    @requestmember = Requestmember.new
  end

  # GET /requestmembers/1/edit
  def edit
  end

  # POST /requestmembers
  # POST /requestmembers.json
  def create
    @requestmember = Requestmember.new(requestmember_params)

    respond_to do |format|
      if @requestmember.save
        format.html { redirect_to @requestmember, notice: 'Requestmember was successfully created.' }
        format.json { render :show, status: :created, location: @requestmember }
      else
        format.html { render :new }
        format.json { render json: @requestmember.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requestmembers/1
  # PATCH/PUT /requestmembers/1.json
  def update
    respond_to do |format|
      if @requestmember.update(requestmember_params)
        format.html { redirect_to @requestmember, notice: 'Requestmember was successfully updated.' }
        format.json { render :show, status: :ok, location: @requestmember }
      else
        format.html { render :edit }
        format.json { render json: @requestmember.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requestmembers/1
  # DELETE /requestmembers/1.json
  def destroy
    @requestmember.destroy
    respond_to do |format|
      format.html { redirect_to requestmembers_url, notice: 'Requestmember was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requestmember
      @requestmember = Requestmember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requestmember_params
      params.require(:requestmember).permit(:article_id, :member_id)
    end
end
