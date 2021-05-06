class McMt::HostMetricTimeRangesController < ApplicationController
  before_action :set_mc_mt_host_metric_time_range, only: %i[show edit update destroy]

  # GET /mc_mt/host_metric_time_ranges
  def index
    @mc_mt_host_metric_time_ranges = McMt::HostMetricTimeRange.all
  end

  # GET /mc_mt/host_metric_time_ranges/1
  def show; end

  # GET /mc_mt/host_metric_time_ranges/new
  def new
    @mc_mt_host_metric_time_range = McMt::HostMetricTimeRange.new
  end

  # GET /mc_mt/host_metric_time_ranges/1/edit
  def edit; end

  # POST /mc_mt/host_metric_time_ranges
  def create
    @mc_mt_host_metric_time_range = McMt::HostMetricTimeRange.new(mc_mt_host_metric_time_range_params)

    if @mc_mt_host_metric_time_range.save
      redirect_to @mc_mt_host_metric_time_range, notice: 'Host metric time range was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mc_mt/host_metric_time_ranges/1
  def update
    if @mc_mt_host_metric_time_range.update(mc_mt_host_metric_time_range_params)
      redirect_to @mc_mt_host_metric_time_range, notice: 'Host metric time range was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mc_mt/host_metric_time_ranges/1
  def destroy
    @mc_mt_host_metric_time_range.destroy
    redirect_to mc_mt_host_metric_time_ranges_url, notice: 'Host metric time range was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mc_mt_host_metric_time_range
    @mc_mt_host_metric_time_range = McMt::HostMetricTimeRange.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mc_mt_host_metric_time_range_params
    params.require(:mc_mt_host_metric_time_range).permit(:host_id, :from_at, :to_at)
  end
end
