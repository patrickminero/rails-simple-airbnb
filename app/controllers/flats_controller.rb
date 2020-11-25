class FlatsController < ApplicationController
    before_action :find_flat, except: [:index, :new, :create, :search]
  def index
      @flats = Flat.search(params[:search])
  end

  def show
  end

  def new
    @flat = Flat.new
    render 'form'
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy

    redirect_to flats_path
  end

  def edit
    render 'form'
  end

  def update
    @flat.update(flat_params)

    redirect_to flat_path(@flat)
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :search)
  end
end
