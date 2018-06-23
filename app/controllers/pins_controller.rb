class PinsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :correct_user?, only: [:edit, :update, :destroy]
  before_action :find_pin, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pins = Pin.all.sorted.paginate(page: params[:page], per_page: 6)
    #respond_wth(@pins)
  end

  def show
    #@pin = Pin.find(params[:id])
  end

  def new
    #@pin = Pin.new
    @pin = current_user.pins.build
  end

  def create
    #@pin = Pin.new(pin_params)
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      #flash[:notice] = "Yesss! It was saved."
      redirect_to(pins_path, notice: "Pin was created successfully!")
    else
      render('new')
    end
  end

  def edit
    #@pin = Pin.find(params[:id])
  end

  def update
    #@pin = Pin.find(params[:id])
    if @pin.update_attributes(pin_params)
      #flash[:notice] ="Yesss!, It was updated!"
      redirect_to(pin_path(@pin), notice: "It was successfully updated.")
    else
      render('edit')
    end
  end

  def destroy
    #@pin = Pin.find(params[:id])
    @pin.destroy
    redirect_to(pins_path)
  end

  private
    def correct_user?
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to(pins_path, notice: "Not authorized to edit this pin") if @pin.nil?
    end

    def find_pin
      @pin = Pin.find(params[:id]) 
    end

    def pin_params
      return params.require(:pin).permit(:description, :image)
    end
end
