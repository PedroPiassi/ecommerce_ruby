module Admin
    class ProductsController < BaseController
      before_action :set_products, only: %i[ show edit update destroy ]

        def index
            @products = Product.all
        end

        def edit; end
        
        def new
            @product = authorize Product.new
        rescue Pundit::NotAuthorizedError
            flash[:notice] = 'Produto só pode ser criado se tiver ao menos uma categoria.'
            redirect_to action: :index
        end

        def show; end

        def create
            @product = Product.new(product_params)

            if @product.save
                redirect_to admin_products_path(@product), notice: 'Produto criado com sucesso.'
            else
                render :new, status: :unprocessable_entity
            end
        end

        def update
            if @product.update(product_params)
                redirect_to admin_products_path(@product), notice: 'Produto alterado com sucesso.'
            else
                render :edit, status: :unprocessable_entity
            end
        end

        def destroy
            @product.destroy
  
            respond_to do |format|
              format.html { redirect_to admin_products_path, notice: "Produto deletada com sucesso." }
            end
        end

        def product_params
            params.require(:product).permit(:name, :description, :price, :publish, :image, :category_id)
        end

        private

        def set_products
            @product = Product.find(params[:id])
        end
    end
end