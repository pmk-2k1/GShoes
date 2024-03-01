class CartController < ApplicationController
  def show
    @render_cart = false
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity:)
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity:)
    end
    redirect_to cart_add_path
  end

  def add_quantity
    quantity = params[:quantity].to_i
    current_orderable = Orderable.find(params[:id])
    current_orderable.quantity += 1
    current_orderable.save(quantity:)
    render partial: 'cart/cart'
  end

  def reduce_quantity
    quantity = params[:quantity].to_i
    current_orderable = Orderable.find(params[:id])
    if current_orderable.quantity > 1
      current_orderable.quantity -= 1
      current_orderable.save(quantity:)
    else
      current_orderable.destroy
    end
    render partial: 'cart/cart'
  end

  def remove
    @cart_details = Orderable.find(params[:id])
    @cart_details.destroy
    render partial: 'cart/cart'
  end
end
