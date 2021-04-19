module Accounts
    class Auditor < Account

        #this sorts out routing issues for subclassing
          def self.model_name
             Account.model_name
          end

    end
end
