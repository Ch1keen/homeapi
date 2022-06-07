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

      if params[:detail].nil?
        @humidity = @statuses.map(&:humidity).last
        @temperature = @statuses.map(&:temperature).last
        @pm1p0 = @statuses.map(&:pm1p0).last
        @pm2p5 = @statuses.map(&:pm2p5).last
        @pm10 = @statuses.map(&:pm10).last
        @gas = @statuses.map(&:gas).last
        @brightness = @statuses.map(&:brightness).last
        @fan = @statuses.map(&:fan).last
        @fan_force = @statuses.map(&:fan_force).last
        @window = @statuses.map(&:window).last
        @times_ago = times_ago(@statuses.last.created_at)

        render 'show'
      else
        @data = @statuses.map(&params[:detail].to_sym)
        @time = @statuses.map(&:created_at)
        render 'detail'
      end
    end

    def update
      @status = Status.create(fan_force: home_params[:fan_force])
      @status.home = Home.find_by(serial_number: home_params[:serial_number])
      @status.save
    end

    private

    def home_params
      params.require(:home).permit(:serial_number, :fan_force)
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
        return created_at.strftime('%Y년 %m월 %d일 %H시 %M분')
      end
    end
  end
end
