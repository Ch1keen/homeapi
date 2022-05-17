# frozen_string_literal: true

module Api
  class HomesController < ApplicationController
    def index
      @homes = Home.all.order(created_at: :desc)
      render 'index'
    end

    def create
      Home.create(home_params)
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
      @times_ago = times_ago(@statuses.last.created_at)

      render 'show'
    end

    private

    def home_params
      params.require(:home).permit(:serial_number)
    end

    def times_ago(created_at)
      seconds_ago = Time.now - created_at
       
      if seconds_ago < 60
        return seconds_ago.to_i.to_s + "초 전"
      elsif seconds_ago >= 60 && seconds_ago < 60*60
        minutes_ago = seconds_ago/60
        return minutes_ago.to_i.to_s + "분 전"
      elsif seconds_ago >= 60*60 && seconds_ago < 60*60*24
        hours_ago = seconds_ago/3600
        return hours_ago.to_i.to_s + "시간 전"
      else
        return created_at
      end
    end
  end
end
