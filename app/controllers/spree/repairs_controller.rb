module Spree
  class RepairsController < Spree::StoreController
    
    def find_repair_phone_user
      @phone = Spree::Repair.find_by(phone: params[:phone])
      if !@phone.nil?
        respond_to do |format|
        format.html{}
        format.js{  }
      end
      else
        respond_to do |format|
          format.html{}
          format.js{ render "spree/repairs/not_find.js.erb" }
        end
      end
    end

    def find_repair_number_user
      @number = Spree::Repair.find_by(number: params[:number])
      if !@number.nil?
        respond_to do |format|
        format.html{}
        format.js{  }
      end
      else
        respond_to do |format|
          format.html{}
          format.js{ render "spree/repairs/not_find.js.erb" }
        end
      end
    end


  end
end