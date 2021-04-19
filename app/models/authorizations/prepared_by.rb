module Authorizations
    class PreparedBy < Authorization

        #this sorts out routing issues for subclassing
          def self.model_name
             Authorization.model_name
          end

    end
end
