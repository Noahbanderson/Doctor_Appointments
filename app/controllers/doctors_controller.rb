class DoctorsController < ApplicationController
  before_action :set_doc, only: [ :edit, :update, :destroy]

  def index
    @docs = Doctor.all
  end

  def new
    @doc = Doctor.new
    render :template => "doctors/_form"
  end

  def create
    @doc = Doctor.new(doc_params)

    if @doc.save
      redirect_to doctor_appointments_path(@doc)
    else
      render :template => "doctors/_form"
    end
  end

  def edit
    render :template => "doctors/_form"
  end

  def update
    if @doc.update(doc_params)
      redirect_to doctors_path
    else
      render :template => "doctors/_form"
    end
  end

  def destroy
    @doc.destroy
    redirect_to doctors_path
  end

  private

    def set_doc
      @doc = Doctor.find(params[:id])
    end

    def doc_params
      params.require(:doctor).permit(:doc_name)
    end
end
