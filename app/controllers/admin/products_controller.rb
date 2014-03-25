class Admin::ProductsController < AdminsController
  respond_to :html, :js

  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find params[:id]
  end

  def create
    @products = Product.all
    @product = Product.create(product_params)
  end

  def update
    @products = Product.all
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
  end

  def destroy
    @products = Product.all
    @product = Product.find params[:id]
    @product.destroy
  end

  private
  def product_params
    params.require(:product).permit Product::PERMITTED_PARAMS
  end
end
