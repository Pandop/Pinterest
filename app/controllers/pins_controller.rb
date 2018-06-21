class PinsController < ApplicationController
  
  def index
    @pins = Pin.all.sorted
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
      flash[:notice] = "Yesss! It was saved."
      redirect_to(pins_path)
    else
      render('new')
    end
  end

  def edit
    @pin = Pin.find(params[:id])
  end

  def update
    @pin = Pin.find(params[:id])
    if @pin.update_attributes(pin_params)
      flash[:notice] ="Yesss!, It was updated!"
      redirect_to(pin_path(@pin))
    else
      render('edit')
    end
  end

  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy
    redirect_to(pins_path)
  end

  private
    def pin_params
      return params.require(:pin).permit(:description)
    end
end
