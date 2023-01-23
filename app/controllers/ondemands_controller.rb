class OndemandsController < ApplicationController
  before_action :set_ondemand, only: %i[ show edit update destroy ]

  def index
  end

  def show
  end

  def new
    @ondemand = Ondemand.new
  end

  def edit
  end

  def create
    @ondemand = Ondemand.new(ondemand_params)

    if @ondemand.save!
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
  end

  private
    def set_ondemand
      @ondemand = Ondemand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ondemand_params
      params.require(:ondemand).permit(:title, :body)
    end
end
