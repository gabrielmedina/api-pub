module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :update, :destroy]

      # GET /products
      def index
        @products = Product.order('created_at DESC')

        render json: {
          status: 'SUCCESS',
          message: 'Sucesso!',
          data: @products
        }, status: :ok
      end

      # GET /products/1
      def show
        if @product
          render json: {
            status: 'SUCCESS',
            message: 'Sucesso!',
            data: @product
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
            message: 'Opa, não localizamos esse produto!',
            data: @product.erros
          }, status: :unprocessable_entity
        end
      end

      # POST /products
      def create
        @product = Product.new(product_params)

        if @product.save
          render json: {
            status: 'SUCCESS',
            message: 'Produto adicionado!',
            data: @product
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
            message: 'Opa, deu alguma coisa errada por aqui, patrão.',
            data: @product.erros
          }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /products/1
      def update
        if @product.update_attributes(product_params)
          render json: {
            status: 'SUCCESS',
            message: 'Produto atualizado!',
            data: @product
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
            message: 'Opa, deu alguma coisa errada por aqui, patrão.',
            data: @product.erros
          }, status: :unprocessable_entity
        end
      end

      # DELETE /products/1
      def destroy
        if @product.destroy
          render json: {
            status: 'SUCCESS',
            message: 'Produto deletado!',
            data: @product
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
            message: 'Opa, deu alguma coisa errada por aqui, patrão.',
            data: @product.erros
          }, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.friendly.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def product_params
        params.require(:product).permit(:name, :price, :quantity)
      end
    end
  end
end
