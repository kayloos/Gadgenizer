class GadgetsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @gadgets = current_user.gadgets
  end

  def cover_flow_index
    @gadgets = current_user.gadgets
  end

  def show
    @gadget = Gadget.find(params[:id])
    @gadget_image = GadgetImage.new
  end

  def new
    @gadget = Gadget.new
    @gadget_image = GadgetImage.new
  end

  def create
    @gadget = current_user.gadgets.new(params[:gadget].permit(:name, :description, :thumbnail))
    if @gadget.save
      flash[:success] = "Saved gadget"
    else
      flash[:error] = "Unable to save gadget"
    end
    redirect_to gadgets_path
  end

  def add_additional_image
    @gadget = Gadget.find(params[:id])
    @gadget_image = @gadget.gadget_images.new(params[:gadget_image].permit(:image))

    if @gadget_image.save
      flash[:success] = "Saved gadget image"
    else
      flash[:error] = "Unable to save gadget image"
    end
    redirect_to gadget_path(@gadget)
  end

  def update
  end

  def destroy
  end
end
