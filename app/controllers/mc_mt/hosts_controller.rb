class McMt::HostsController < ApplicationController
  before_action :set_mc_mt_host, only: %i[show edit update destroy]

  # GET /mc_mt/hosts
  def index
    @mc_mt_hosts = McMt::Host.all
  end

  # GET /mc_mt/hosts/1
  def show
    pp @mc_mt_host.metadata_h
    pp @mc_mt_host.metric_time_ranges
  end

  # GET /mc_mt/hosts/new
  def new
    @mc_mt_host = McMt::Host.new
  end

  # GET /mc_mt/hosts/1/edit
  def edit; end

  # POST /mc_mt/hosts
  def create
    @mc_mt_host = McMt::Host.new(mc_mt_host_params)

    if @mc_mt_host.save
      redirect_to @mc_mt_host, notice: 'Host was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mc_mt/hosts/1
  def update
    if @mc_mt_host.update(mc_mt_host_params)
      redirect_to @mc_mt_host, notice: 'Host was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mc_mt/hosts/1
  def destroy
    @mc_mt_host.destroy
    redirect_to mc_mt_hosts_url, notice: 'Host was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mc_mt_host
    @mc_mt_host = McMt::Host.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mc_mt_host_params
    params.require(:mc_mt_host).permit(:host_id)
  end
end
