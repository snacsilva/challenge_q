class LeadersController < ApplicationController
  before_action :set_leader, only: %i[ show update destroy get_all_leds_per_leader get_colleagues ]

  # GET /leaders
  def index
    @leaders = Leader.all

    render json: @leaders
  end

  # GET /leaders/1
  def show
    render json: @leader
  end

  # POST /leaders
  def create
    @leader = Leader.new(leader_params)

    if @leader.save
      render json: @leader, status: :created
    else
      render json: @leader.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leaders/1
  def update
    if @leader.update(leader_params)
      render json: @leader
    else
      render json: @leader.errors, status: :unprocessable_entity
    end
  end

  # DELETE /leaders/1
  def destroy
    @leader.destroy
  end

  def get_colleagues
    colleagues = get_leds(@leader.employee_id)

    render json: colleagues
  end

  def get_all_leds_per_leader
    leds = get_leds(params[:employee_id])
    
    render json: leds
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leader
      @leader = Leader.find(params[:id] || params[:leader_id])
    end

    # Only allow a list of trusted parameters through.
    def leader_params
      params.require(:leader).permit(:employee_id, :led_id)
    end

    def get_leds leader_id
      @leader.all_leds_from_leader(leader_id)
    end
end
