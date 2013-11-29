class StoreController < ApplicationController
  before_filter :find_cart, :except => :index
  def index
    @products = Product.find_products_for_sale
    @cart = find_cart
  end
  def add_to_cart
    begin                     
      product = Product.find(params[:id])
      @product = product
    rescue ActiveRecord::RecordNotFound
      logger.error("Tentative d'accès à un produit invalide (#{params[:id]})")
      redirect_to_index("Produit Invalide")
    else
      @current_item = @cart.add_product(product)
    end
  end
  def empty_cart
    session[:cart] = nil
    redirect_to_index
  end
  def checkout
    if @cart.items.empty?
      redirect_to_index("Votre panier est vide")
    else
      @order = Order.new
    end
  end
  #END:checkout
    #START:save_order
  def save_order
    @order = Order.new(params[:order])   # <label id="code.p.new.order" />
    @order.add_line_items_from_cart(@cart)
    if @order.save                       # <label id="code.p.save" />
      session[:cart] = nil
      redirect_to_index("Merci pour votre commande")
    else
      render :action => :checkout
    end
  end
  #END:save_order
    
  def find_cart
    @cart = (session[:cart] ||= Cart.new)
  end
end