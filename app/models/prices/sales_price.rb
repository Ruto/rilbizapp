module Prices
    class SalesPrice < Price

        #this sorts out routing issues for subclassing
          def self.model_name
             Price.model_name
          end

    end
end
