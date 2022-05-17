# frozen_string_literal: true

module Api
  class StatusesController < ApplicationController
    def index
      @statuses = Status.all.order(created_at: :desc)

      render 'index'
    end

    def create
      @status = Status.create(status_params)
      @status.home = Home.find_by(serial_number: serial_number_param[:serial_number])
      @status.save

      render json: { msg: true }
    end

    private

    def status_params
      params.require(:status).permit(:humidity, :temperature, :pm1p0, :pm2p5, :pm10, :gas, :brightness, :fan, :window)
    end

    def serial_number_param
      params.require(:status).permit(:serial_number)
    end
  end
end
