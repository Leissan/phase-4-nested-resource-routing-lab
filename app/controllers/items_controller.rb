class ItemsController < ApplicationController

  def index
    if params[:user_id]
    user = User.find_by(params[:user_id])
    render json: user.items, include: :user
   
    else
    items = Item.all
    render json: items, include: :user
    end
  end

  def show
    item = Item.find(params[:id])
    render json: item, include: :user
  end

  def create 
    if params[:user_id]
      user = User.find_by(params[:user_id])
      item = user.items.build(name: "Garden gnomes", description: "No refunds", price: 23)
      render json: item, include: :user, status: :created
    else
      item = Item.create(name: "Garden gnomes", description: "No refunds", price: 23)
      render json: item, include: :user, status: :created
    end
    item
  end

end
