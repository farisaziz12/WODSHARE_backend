class HealthDataController < ApplicationController

    def index
        healthdata = HealthDatum.new
        # data = File.read("/Users/farisaziz/Desktop/WODSHARE/WODSHARE_backend/app/export_cda.xml")
        data = healthdata.data_parse(data) 
        render json: data
    end

end
