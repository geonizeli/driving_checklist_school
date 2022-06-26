class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %i[ show edit update destroy ]

  load_and_authorize_resource

  # GET /subscriptions or /subscriptions.json
  def index
    add_breadcrumb("Subscriptions")
    @subscriptions = Subscription.accessible_by(current_ability)
  end

  # GET /subscriptions/1 or /subscriptions/1.json
  def show
    add_breadcrumb("Subscriptions", subscriptions_path)
    add_breadcrumb(@subscription.id)
    @subscription_report = SubscriptionReportService.new(@subscription).call
  end

  # GET /subscriptions/new
  def new
    add_breadcrumb("Subscriptions", subscriptions_path)
    add_breadcrumb("New")
    @subscription = Subscription.new
  end

  # GET /subscriptions/1/edit
  def edit
    add_breadcrumb("Subscriptions", subscriptions_path)
    add_breadcrumb(@subscription.id, subscription_path(@subscription))
    add_breadcrumb("Edit")
  end

  # POST /subscriptions or /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user_id = current_user.id

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to subscription_url(@subscription), notice: "Subscription was successfully created." }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscriptions/1 or /subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to subscription_url(@subscription), notice: "Subscription was successfully updated." }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1 or /subscriptions/1.json
  def destroy
    respond_to do |format|
      if @subscription.destroy
        format.html { redirect_to subscriptions_url, notice: "Subscription was successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subscription_params
    params.require(:subscription).permit(:started_at, subject_ids: [])
  end
end
