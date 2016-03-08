class ProductsController < ApplicationController
  def new
    @user = User.find params[:user_id]
    @product = Product.new
  end

  def create
    @user = User.find params[:user_id]
    @product = @user.products.new(product_params)
    #Try to save it
    if @product.save 
      flash[:notice] = "product created correctly"
      redirect_to user_products_path
    else
      flash[:alert] = "Something went wrong"
      render "new"
    end
  end

  def index
    @user = User.find params[:user_id]
    @products = @user.products.last_created_products(30)
  end

  def show
    @product = Product.find_by(id: params[:id]) #|| render_404(params)
  end

  def destroy
    product = Product.find params[:product_id]
    product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :date)
  end
end
