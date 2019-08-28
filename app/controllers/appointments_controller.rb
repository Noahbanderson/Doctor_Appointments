class AppointmentsController < ApplicationController
  before_action :set_doc
  before_action :set_appt, only: [:edit, :update, :destroy]

  def index
    @neuro = @doc.appointments.where(specialty: 'neuro')
    @cardio = @doc.appointments.where(specialty: 'cardio')
    @ortho = @doc.appointments.where(specialty: 'ortho')
  end

  def new
    @users = User.all - @doc.users
    @appt = @doc.appointments.new
  end

  def create
    @appt = @doc.appointments.new(appt_params)

    if @appt.save
      redirect_to doctor_appointments_path(@doc)
    else
      render :new
    end
  end

  def edit
    @users = User.all - @doc.users + #User.find(params[@doc.user]) #trying to find the specific person whom I am changing. 
    @appt = @doc.appointments
  end

  def update
    if @appt.update(appt_params)
      redirect_to doctor_appointments_path(@doc)
    else
      render :edit
    end
  end

  def destroy
    @appt.destroy
    redirect_to doctor_appointments_path(@doc)
  end

  private

    def set_doc
      @doc = Doctor.find(params[:doctor_id])
    end

    def set_appt
      @appt = @doc.appointments.find(params[:id])
    end

    def appt_params
      params.require(:appointment).permit(:specialty, :user_id)
    end


end
