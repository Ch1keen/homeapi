# frozen_string_literal: true

module Api
  class HomesController < ApplicationController
    def index
      @homes = Home.all
      render 'index'
    end

    def create
      Home.create(home_params)
      # TO-DO: 중복 등록 방지
      render json: {msg: true}
    end

    def show
      @statuses = Home.find(params[:id]).statuses
      @humidity = @statuses.map(&:humidity).last
      @temperature = @statuses.map(&:temperature).last
      @pm1p0 = @statuses.map(&:pm1p0).last
      @pm2p5 = @statuses.map(&:pm2p5).last
      @pm10 = @statuses.map(&:pm10).last
      @gas = @statuses.map(&:gas).last
      @brightness = @statuses.map(&:brightness).last
      @fan = @statuses.map(&:fan).last
      @window = @statuses.map(&:window).last

      render 'show'
    end

    private

    def home_params
      params.require(:home).permit(:serial_number)
    end
  end
end
