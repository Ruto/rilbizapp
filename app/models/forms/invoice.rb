module Forms
    class Invoice < Form
      #this sorts out routing issues for subclassing
      def self.model_name
         Form.model_name
      end

      #Invoice number can be saved as draft and deleted if not used
      #Reference the customer
      #can be created from an order number
      #must be authorized by three persons Creater -> Received by Customer -> Confirmed -> Approved
      #Total amount to be recorded on the transactions account
      #quantity
      #umit of measure
      #

    end
end
