class HomeController < ApplicationController
    before_action :entry_authenticate_user
    
    def top
    end

    def about
    end
end
