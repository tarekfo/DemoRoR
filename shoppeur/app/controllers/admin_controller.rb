class AdminController < ApplicationController
  before_filter :authorize, :except => :login

  def index
    list
    render :action => 'list'
  end

  def list
      @products = Product.paginate :page => params[:page], :per_page => 10
  end
  
  def ship
    count = 0
    if things_to_ship = params[:to_be_shipped]
      count = do_shipping(things_to_ship)
      if count > 0
        count_text = pluralize(count, "commande")
        flash.now[:notice] = "#{count_text} marquées comme expédiées"
      end
    end
    @pending_orders = Order.pending_shipping
  end
  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    if @product.save
      flash[:notice] = 'Product was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => "new"
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    if @product.save
      flash[:notice] = 'Product was successfully created.'
      redirect_to :action => 'show', :id => @product
    else
      render :action => "edit"
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to :action => 'list'
  end
  
  private
  def do_shipping(things_to_ship)
    count = 0
    things_to_ship.each do|order_id, do_it|
      if do_it == "yes"
        order = Order.find(order_id)
        order.mark_as_shipped
        order.save
        count += 1
      end
    end
    count
  end
  def pluralize(count, noun)
    case count
    when 0: "Aucun(e) #{noun.pluralize}"
    when 1: "Un(e) #{noun}"
    else "#{count} #{noun.pluralize}"
    end
  end
end
