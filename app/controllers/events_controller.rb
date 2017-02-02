require 'google/apis/calendar_v3'
class EventsController < ApplicationController
	before_filter :init_oauth,only: [:create,:show,:update,:index,:edit]
  def new
  end

  def create
  	summary = params[:event][:title]
  	location = params[:event][:location]
  	description = params[:event][:description]
  	date_from = DateTime.parse("#{params[:event]["from(1i)"]}-#{params[:event]["from(2i)"]}-#{params[:event]["from(3i)"]}T#{params[:event]["from(4i)"]}:#{params[:event]["from(5i)"]}:00+05:30")
  	date_to = DateTime.parse("#{params[:event]["to(1i)"]}-#{params[:event]["to(2i)"]}-#{params[:event]["to(3i)"]}T#{params[:event]["to(4i)"]}:#{params[:event]["to(5i)"]}:00+05:30")
  	timezone = 'Asia/Kolkata'
  	repeats = params[:event][:repeats]
  	repeats_every = params[:event][:repeats_every]
  	recurrence = ['RRULE:FREQ='+repeats+';'+'INTERVAL='+repeats_every]
		event = Google::Apis::CalendarV3::Event.new({
		  :summary => summary,
		  :location => location,
		  :description => description,
		  :start => {
		    :date_time => date_from,
		    :time_zone =>  timezone
		  },
		  :end => {
		    :date_time => date_to,
		    :time_zone =>  timezone
		  },
		  :attendees => [
		    {:email => "ashish.mittal@quovantis.com"}
		  ],
		  :recurrence => recurrence
		})
		response = @service.insert_event(params[:calendar_id], event, send_notifications: true )
		p "--------------#{response.as_json["id"]}"
		@event = Event.create(e_id: response.as_json["id"])
		redirect_to edit_event_path(@event.e_id)
  end

  def show

  end

  def edit
  	# @event = @service.list_event_instances('primary', params[:id]) //get instance of particular event
    # render json: @event.as_json
  end

  def update
  	@event = @service.get_event('primary', 'k0b0j22dv478g0umfld01gk1ps_20170202T035800Z')
  	repeats = params[:event][:repeats]
  	repeats_every = params[:event][:repeats_every]
  	@event.recurrence = ['RRULE:FREQ='+repeats+';'+'INTERVAL='+repeats_every]
  	@event.summary = params[:event][:title]
  	result = @service.update_event('primary', @event.id, @event)
  	render json: result.as_json
  end

  def index
    @events = @service.list_events(params[:calendar_id]).as_json["items"]
  end

  private
  def init_oauth
  	client = Signet::OAuth2::Client.new({
      client_id: "256765835013-vq9jtavh2s144rg90u1n2bb85ot3b28a.apps.googleusercontent.com",
      client_secret: "zfqaUsz-9ZqOB3S4KhmDMp9J",
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      refresh_token: "1/z2SNmLis989YQxO4l79igQM1BoQPxbHvszIBYwLaAZU"
    })
    @service = Google::Apis::CalendarV3::CalendarService.new
    @service.authorization = client
    params[:calendar_id] = "ashish.mittal@quovantis.com"
  end
end
