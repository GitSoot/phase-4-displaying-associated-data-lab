class ItemsController < ApplicationController
    def index
      items = Item.all.includes(:user)
      render json: items.to_json(
        only: [:id, :name, :description, :price],
        include: { user: { only: [:id, :username, :city] } }
      )
    end
  end