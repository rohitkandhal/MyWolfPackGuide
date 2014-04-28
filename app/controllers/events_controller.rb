class EventsController < ApplicationController

	def event_detail
		event_id=params[:eid]
		uid=session[:uid]
		@rsvp_button_flag=false
		if !event_id.nil?
			# check if this user is not rsvp'd for this event 
			event_rsvp_check=Rsvp.find_by_uid_and_event_id(@uid,@event_id)
			if event_rsvp_check.nil?
				#if not then display the rsvp button				
				@rsvp_button_flag=true;
			end
			
			 @rsvpd_list=Rsvp.find_all_by_event_id(@event_id)
				
			# display the list of all the rsvp's people 

		end		
	end

end
