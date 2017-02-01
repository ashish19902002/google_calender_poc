class SessionsController < ApplicationController
	def new

	end
  def create
  	p "-----------#{request.env["omniauth.auth"]}"
  	p "----Token------#{request.env["omniauth.auth"].credentials.token}"
  	render json:  request.env["omniauth.auth"]
  end

  def destroy
  end
end

# google-api-ruby-client/samples/cli/lib/samples/calendar.rb

# ya29.Ci-mA9mGOTeaM_JhmiSqF7a5n7Bd6odCDIvY3803zWTF_O47paIO77iy55INx5SWug

# require 'google/apis/calendar_v3'

# or

# client = Signet::OAuth2::Client.new({
#       client_id: "256765835013-vq9jtavh2s144rg90u1n2bb85ot3b28a.apps.googleusercontent.com",
#       client_secret: "zfqaUsz-9ZqOB3S4KhmDMp9J",
#       token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
#       refresh_token: "1/z2SNmLis989YQxO4l79igQM1BoQPxbHvszIBYwLaAZU"
#     })

# service = Google::Apis::CalendarV3::CalendarService.new

# service.authorization = client

# @calendar_list = service.list_calendar_lists

# params[:calendar_id] =>  it is the email of that user

# @event_list = service.list_events(params[:calendar_id]) #Get list of all event

# @event = {
#   'summary' => 'New Event Title',
#   'description' => 'The description',
#   'location' => 'Location',
#   'start' => { 'dateTime' => DateTime.now+5.hours },
#   'end' => { 'dateTime' => DateTime.now+7.hours },
#   'attendees' => [ { "email" => 'ashish.mittal@quovantis.com' },
#   { "email" =>'dinesh.goyal@quovantis.com' } ] }

# service.insert_event(params[:calendar_id], @event)

# {
#   "summary" : "Testing Google calendar",
#   "location" : "",
#   "description": "A chance to Testing google calendar",
#   "start": {
#     "date_time": DateTime.current,
#     "time_zone": "America/Los_Angeles",
#   },
#   "end": {
#     "date_time:" DateTime.current+5.hours,
#     "time_zone": "America/Los_Angeles",
#   },
#   "recurrence": [
#     "RRULE:FREQ=DAILY;COUNT=1"
#   ],
#   "attendees": [
#     {"email": "ashish.mittal@quovantis.com"},
#     {"email": "dinesh.goyal@quovantis.com"}
#   ]
# }


# event = Google::Apis::CalendarV3::Event.new({
#   :summary => 'event title',
#   :location => 'event address',
#   :description => 'event description',
#   :start => {
#     :date_time => DateTime.parse('2016-12-10T09:00:00-07:00'),
#     :time_zone =>  'America/Los_Angeles'
#   },
#   :end => {
#     :date_time => DateTime.parse('2016-12-10T11:00:00-07:00'),
#     :time_zone =>  'America/Los_Angeles'
#   },
#   :attendees => [
#     {:email => "ashish.mittal@quovantis.com"},
#     {:email => "dinesh.goyal@quovantis.com"}
#   ],
#   :recurrence => [
#     'RRULE:FREQ=MONTHLY'
#   ],
#   :reminders => {
#     :use_default => false,
#     :overrides => [
#       {'method' => 'email', :minutes => 24 * 60},
#       {'method' => 'popup', :minutes => 10}
#     ]
#   }
# })

# response = service.insert_event(params[:calendar_id], event, send_notifications: true )
