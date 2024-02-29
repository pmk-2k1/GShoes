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

    redirect_to root_path
    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: [turbo_stream.replace('cart',
    #                                                partial: 'cart/orderables',
    #                                                locals: { cart: @cart }),
    #                           turbo_stream.replace(@product)]
    #   end
    # end
  end

  def add_quantity
    # @product = Product.find_by(id: params[:id])
    # quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find(params[:id])
    current_orderable.quantity += 1
    # current_orderable.save
    current_orderable.update(quantity:)
    redirect_to root_path
  end

  def reduce_quantity
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable.quantity > 1
      current_orderable.quantity -= 1
      current_orderable.update(quantity:)
    else
      current_orderable.destroy
    end

    # current_orderable.save
    redirect_to root_path
  end

  def remove
    @cart_details = Orderable.find(params[:id])
    @cart_details.destroy
    redirect_to root_path
    # respond_to do |format|
    #   format.turbo_stream do
    #     render turbo_stream: turbo_stream.replace('cart',
    #                                               partial: 'cart/orderables',
    #                                               locals: { cart: @cart })
    #   end
    # end
  end
end
