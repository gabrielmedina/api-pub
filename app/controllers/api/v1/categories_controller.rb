module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: [:show, :update, :destroy]

      # GET /categories
      def index
        @categories = Category.order('created_at DESC')

        render json: {
          status: 'SUCCESS',
          message: 'Sucesso!',
          data: @categories
        }, status: :ok
      end

      # GET /categories/1
      def show
        if @category
          render json: {
            status: 'SUCCESS',
            message: 'Sucesso!',
            data: @category.as_json(include: :products)
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
            message: 'Opa, não localizamos essa categoria!'
          }, status: :unprocessable_entity
        end
      end

      # POST /categories
      def create
        @category = Category.new(category_params)

        if @category.save
          render json: {
            status: 'SUCCESS',
            message: 'Categoria adicionada!',
            data: @category
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
            message: 'Opa, deu alguma coisa errada por aqui, patrão.'
          }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /categories/1
      def update
        if @category.update_attributes(product_params)
          render json: {
            status: 'SUCCESS',
            message: 'Categoria atualizada!',
            data: @category
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
            message: 'Opa, deu alguma coisa errada por aqui, patrão.'
          }, status: :unprocessable_entity
        end
      end

      # DELETE /categories/1
      def destroy
        if @category.destroy
          render json: {
            status: 'SUCCESS',
            message: 'Categoria deletada!',
            data: @category
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
            message: 'Opa, deu alguma coisa errada por aqui, patrão.'
          }, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.friendly.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def category_params
        params.require(:category).permit(:name, :description)
      end
    end
  end
end
