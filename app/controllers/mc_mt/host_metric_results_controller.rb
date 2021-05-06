class McMt::HostMetricResultsController < ApplicationController
  before_action :set_mc_mt_host_metric_result, only: %i[show edit update destroy]

  # GET /mc_mt/host_metric_results
  def index
    @mc_mt_host_metric_results = McMt::HostMetricResult.all
  end

  # GET /mc_mt/host_metric_results/1
  def show; end

  # GET /mc_mt/host_metric_results/new
  def new
    @mc_mt_host_metric_result = McMt::HostMetricResult.new
  end

  # GET /mc_mt/host_metric_results/1/edit
  def edit; end

  # POST /mc_mt/host_metric_results
  def create
    @mc_mt_host_metric_result = McMt::HostMetricResult.new(mc_mt_host_metric_result_params)

    if @mc_mt_host_metric_result.save
      redirect_to @mc_mt_host_metric_result, notice: 'Host metric result was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mc_mt/host_metric_results/1
  def update
    if @mc_mt_host_metric_result.update(mc_mt_host_metric_result_params)
      redirect_to @mc_mt_host_metric_result, notice: 'Host metric result was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mc_mt/host_metric_results/1
  def destroy
    @mc_mt_host_metric_result.destroy
    redirect_to mc_mt_host_metric_results_url, notice: 'Host metric result was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mc_mt_host_metric_result
    @mc_mt_host_metric_result = McMt::HostMetricResult.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mc_mt_host_metric_result_params
    params.require(:mc_mt_host_metric_result).permit(:host_id, :metric_name, :from_at, :to_at, :result)
  end
end
