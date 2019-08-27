class AppointmentsController < ApplicationController
  before_action :set_doc
  before_action :set_appt, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_doc
      @doc = Doctor.find(params[:id])
    end

    def set_appt
      @appt = @doc.appointments.find(params[:doctor_id])
    end

    def appt_params
      params.require(:appointment).permit(:specialty, :user_id)
    end


end
