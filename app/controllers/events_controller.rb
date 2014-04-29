class EventsController < ApplicationController

	@@event_id =0

	def self.event_id
		@@event_id		
	end


	def self.event_id=value
		@@event_id=value
	end

	def event_detail
		event_id=params[:eid]
		uid=session[:uid]
		@rsvp_button_flag=false
		if !event_id.nil?
			@@event_id=event_id
			# check if this user is not rsvp'd for this event 
			event_rsvp_check=Rsvp.find_by_uid_and_event_id(uid,event_id)
			if event_rsvp_check.nil?
				#if not then display the rsvp button				
				@rsvp_button_flag=true;
			end			
			 rsvpd_list=Rsvp.find_all_by_event_id(event_id)				
			# display the list of all the rsvp's people 
			# for each rsvp list item, using the uid find the username from users list			
			#@user_names = User.where()
			@user_names=[]
			@count=0
			if !rsvpd_list.nil?
				rsvpd_list.each do |rsvpd_user|					
					#@user_names[@count]=rsvpd_user.uid
					@user_names[@count]=User.find_by_id(rsvpd_user.uid)
						@count=@count+1					
				end
			end
		end	
		
		if request.post?
			# save the RSVP in Db and show a dialog that RSVP was successful
			rsvp_new=Rsvp.new 
			rsvp_new.cal_id=params[:calendar_id] # need to send calendar id from the calling page
			rsvp_new.event_id=@@event_id
			rsvp_new.uid=session[:uid]	
			if rsvp_new.save!	
				flash[:notice]="Successfully RSVP's for the event!"
				render action: "event_detail"
			else
				flash[:error]="Something went wrong with the request!"
				render action: "event_detail"
			end
			# navigate back to the Event Details page
		end
			
	end

end
