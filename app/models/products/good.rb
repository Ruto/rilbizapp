module Products
    class Good < Structure

        #this sorts out routing issues for subclassing
          def self.model_name
             Product.model_name
          end

    end
end
