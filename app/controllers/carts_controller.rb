class CartsController < ApplicationController

  def show
  end

  def add_to
    if params[:product_id].present?
      @cart.add(product_id: params[:product_id])
      save_cart
      redirect_to(product_path(params[:product_id]), only_path: true)
      return
    end
    redirect_to cart_path(@cart)
  end

  def remove_from
    if params[:product_id].present?
      @cart.add(product_id: params[:product_id])
      save_cart
      redirect_to(product_path(params[:product_id]), only_path: true)
      return
    end
    redirect_to(product_paths, only_path: true)
  end

  def remove_multiple_from
    remove_ids = params[:select_products].blank? ? [] : params[:select_products]
    remove_ids.each { |id| @cart.remove(product_id: id) }
    save_cart
    redirect_to cart_path(@cart)
  end
end