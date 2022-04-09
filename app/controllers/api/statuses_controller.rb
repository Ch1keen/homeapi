# frozen_string_literal: true

module Api
  class StatusesController < ApplicationController
    def index
      render json: { msg: true }
    end

    def create
      @status = Status.create(log_params)
      @status.save

      render json: { msg: true }
    end

    private

    def status_params
      params.require(:status).permit(:humidity, :temperature, :pm1p0, :pm2p5, :pm10, :gas, :brightness)
    end
  end
end
