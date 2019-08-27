class DoctorsController < ApplicationController
  before_action :set_doc, only: [:show, :edit, :update, :destroy]

  def index
    @docs = Doctor.all
  end

  def show
  end

  def new
    @doc = Doc.new
  end

  def create
    @doc = Doc.new(doc_params)

    if @doc.save
      redirect_to @doc
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @doc.update(doc_params)
      redirect_to doctors_path
    else
      render :edit
    end
  end

  def destroy
    @doc.destroy
    redirect_to doctors_path
  end

  private

    def set_doc
      @doc = Doc.find(params[:id])
    end

    def doc_params
      params.require(:doctor).permit(:doc_name)
    end
end
