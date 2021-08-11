class PublicController < ApplicationController
   def main
      if account_signed_in?
         path = current_account.admin? ? accounts_path : dashboard_path
         redirect_to path, flash: { notice: "Successfully signed in, Welcome to Sarari" } and return
      end

      @properties = Property.latest
   end
end
