module Api
  module V1
    class CategoriesController < ApplicationController
      include RenderJson

      before_action :set_category, only: [:show, :update, :destroy]

      # GET /categories
      def index
        @categories = Category.order('created_at DESC')
        render_json(:success, @categories)
      end

      # GET /categories/1
      def show
        if @category
          render_json(:success, @category.as_json(include: :products))
        else
          render_json(:error)
        end
      end

      # POST /categories
      def create
        @category = Category.new(category_params)

        if @category.save
          render_json(:success, @category, 'Categoria adicionada!')
        else
          render_json(:error)
        end
      end

      # PATCH/PUT /categories/1
      def update
        if @category.update_attributes(product_params)
          render_json(:success, @category, 'Categoria atualizada!')
        else
          render_json(:error)
        end
      end

      # DELETE /categories/1
      def destroy
        if @category.destroy
          render_json(:success, @category, 'Categoria deletada!')
        else
          render_json(:error)
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_category
        begin
          @category = Category.friendly.find(params[:id])
        rescue ActiveRecord::RecordNotFound => message_error
          @message_error = message_error
        end
      end

      # Only allow a trusted parameter "white list" through.
      def category_params
        params.require(:category).permit(:name, :description)
      end
    end
  end
end
