require 'crack' 
require 'crack/json' 
require 'crack/xml'
class HealthDatum < ApplicationRecord
    
    def data_parse(data)
        Crack::XML.parse(data)
    end

end
