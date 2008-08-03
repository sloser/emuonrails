class SettingsController < ApplicationController
	
	layout 'users'
	
	def	index
		
		@settings = Setting.first
		
		if request.post?						
			@settings.update_attributes(params[:settings])        
			redirect_to :action => 'index'			
		end
		
	end	
	
end
