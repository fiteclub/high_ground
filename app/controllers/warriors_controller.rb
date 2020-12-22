class WarriorsController < ApplicationController
  before_action :set_warrior, only: [:show, :edit, :update, :destroy]

  # GET /warriors
  # GET /warriors.json
  def index
    @warriors = Warrior.all
  end

  # GET /warriors/1
  # GET /warriors/1.json
  def show; end

  # GET /warriors/new
  def new
    @warrior = Warrior.new
  end

  # GET /warriors/1/edit
  def edit; end

  # POST /warriors
  # POST /warriors.json
  def create
    @warrior = Warrior.new(warrior_params)
    respond_to do |format|
      if @warrior.save
        format.html { redirect_to @warrior, notice: 'Warrior was successfully created.' }
        format.json { render :show, status: :created, location: @warrior }
      else
        format.html { render :new }
        format.json { render json: @warrior.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warriors/1
  # PATCH/PUT /warriors/1.json
  def update
    respond_to do |format|
      if @warrior.update(warrior_params)
        format.html { redirect_to @warrior, notice: 'Warrior was successfully updated.' }
        format.json { render :show, status: :ok, location: @warrior }
      else
        format.html { render :edit }
        format.json { render json: @warrior.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warriors/1
  # DELETE /warriors/1.json
  def destroy
    @warrior.destroy
    respond_to do |format|
      format.html { redirect_to warriors_url, notice: 'Warrior was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def duel
    @player_one = 
      if params[:p1]
        Warrior.find(params[:p1])
      elsif params[:p1_address]
        new_warrior = Warrior.new(title: 'Player One', address: params[:p1_address], autolocate: true)
        new_warrior.fetch_geo_data
        new_warrior
      else
        Warrior.all.sample
      end
    @player_two =
      if params[:tie]
        @player_one
      elsif params[:p2]
        Warrior.find(params[:p2])
      elsif params[:p2_address]
        new_warrior = Warrior.new(title: 'Player Two', address: params[:p2_address], autolocate: true)
        new_warrior.fetch_geo_data
        new_warrior
      else
        Warrior.all.sample
      end
    @results = Warrior.duel(@player_one, @player_two)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_warrior
    @warrior = Warrior.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def warrior_params
    params.require(:warrior).permit(:title, :address, :latitude, :longitude, :elevation, :wins, :losses, :ties, :autolocate)
  end
end
