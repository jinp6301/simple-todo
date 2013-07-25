class ItemsController < ApplicationController

  def index
    @items = Item.find_all_by_completed(nil).reverse
  end

  def create
    @item = Item.create(params[:item])

    respond_to do |format|
      format.json {render json: @item.id.to_json}
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(completed: true)
    respond_to do |format|
      format.json {render json: "success".to_json}
    end
  end

end
