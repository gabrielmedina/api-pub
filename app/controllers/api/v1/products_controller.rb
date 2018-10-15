module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :update, :destroy]

      # GET /products
      def index
        @products = Product.order('created_at DESC')
        render_json(:success, @products)
      end

      # GET /products/1
      def show
        if @product
          render_json(:success, @product)
        else
          render_json(:error)
        end
      end

      # POST /products
      def create
        @product = Product.new(product_params)

        if @product.save
          render_json(:success, @product, 'Produto cadastro!')
        else
          render_json(:error)
        end
      end

      # PATCH/PUT /products/1
      def update
        if @product.update_attributes(product_params)
          render_json(:success, @product, 'Produto atualizado!')
        else
          render_json(:error)
        end
      end

      # DELETE /products/1
      def destroy
        if @product.destroy
          render_json(:success, @product, 'Produto deletado!')
        else
          render_json(:error)
        end
      end

      private

      def render_json(status, data = {}, message = 'sucesso')
        if status == :success
          render json: {
            status: 'SUCCESS',
            message: message,
            data: data
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
            message: @message_error,
            data: data
          }, status: :unprocessable_entity
        end
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_product
        begin
          @product = Product.friendly.find(params[:id])
        rescue ActiveRecord::RecordNotFound => message_error
          @message_error = message_error
        end
      end

      # Only allow a trusted parameter "white list" through.
      def product_params
        params.require(:product).permit(:name, :price, :quantity)
      end
    end
  end
end
