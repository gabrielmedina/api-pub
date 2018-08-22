module Api
  module V1
    class BeersController < ApplicationController
      def index
        beers = Beer.order('created_at DESC')

        render json: {
          status: 'SUCCESS',
          message:'Cervejas no bar!',
          data: beers
        }, status: :ok
      end

      def show
        beer = Beer.find(params[:id])

        render json: {
          status: 'SUCCESS',
          message:'Essa é das boas!',
          data: beer
        }, status: :ok
      end

      def create
        beer = Beer.new(beer_params)

        if beer.save
          render json: {
            status: 'SUCCESS',
            message: 'Adoramos novas cervejas por aqui!',
            data: beer
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
            message: 'Opa, deu alguma coisa errada por aqui, patrão.',
            data: beer.erros
          }, status: :unprocessable_entity
        end
      end

      def destroy
        beer = Beer.find(params[:id])

        if beer.destroy
          render json: {
            status: 'SUCCESS',
            message: 'É patrão, não temos mais essa cerveja por aqui.',
            data: beer
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
            message: 'Opa, deu alguma coisa errada por aqui, patrão.',
            data: beer.erros
          }, status: :unprocessable_entity
        end
      end

      def update
        beer = Beer.find(params[:id])

        if beer.update_attributes(beer_params)
          render json: {
            status: 'SUCCESS',
            message: 'Opa, cerveja atualizada!',
            data: beer
          }, status: :ok
        else
          render json: {
            status: 'ERROR',
            message: 'Opa, deu alguma coisa errada por aqui, patrão.',
            data: beer.erros
          }, status: :unprocessable_entity
        end
      end

      private

      def beer_params
        params.permit(:name, :price, :quantity)
      end
    end
  end
end
