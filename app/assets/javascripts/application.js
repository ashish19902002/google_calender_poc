// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

  // Your Client ID can be retrieved from your project in the Google
  // Developer Console, https://console.developers.google.com
  var CLIENT_ID = '256765835013-4u59dtb1t7gdulj0adp3lufuhmgj9oh5.apps.googleusercontent.com';

  var SCOPES = ["https://www.googleapis.com/auth/calendar"];

  /**
   * Check if current user has authorized this application.
  /**
   * Handle response from authorization server.
   *
   * @param {Object} authResult Authorization result.
   */
  function handleAuthResult(authResult) {
	  console.log(authResult);
	   	var authorizeDiv = document.getElementById('authorize-div');
	   	if (authResult && !authResult.error) {
	      // Hide auth UI, then load client library.
	      authorizeDiv.style.display = 'none';
	      loadCalendarApi();
	  } else {
	      // Show auth UI, allowing the user to initiate authorization by
	      // clicking authorize button.
	      authorizeDiv.style.display = 'inline';
	  }
  }

  /**
   * Initiate auth flow in response to user clicking authorize button.
   *
   * @param {Event} event Button click event.
   */
    function handleAuthClick(event) {
	   	gapi.auth.authorize(
	   		{client_id: CLIENT_ID, scope: SCOPES.join(' '), immediate: false},
	   		handleAuthResult);
	   	return false;
    }

    /**
     * Load Google Calendar client library. Create events
     * once client library is loaded.
     */
    function loadCalendarApi() {
    	gapi.client.load('calendar', 'v3', create_event);
    }

    /**
     * Append a pre element to the body containing the given message
     * as its text node.
     *
     * @param {string} message Text to be placed in pre element.
     */
    function appendPre(message) {
     	var pre = document.getElementById('output');
     	var textContent = document.createTextNode(message + '\n');
     	pre.appendChild(textContent);
    }

	  function create_event() {
	  	title = document.getElementById("calender_event_title").value;
	  	description = document.getElementById("calender_event_description").value;
	  	start_year =  document.getElementById("calender_event_from_1i").value;
	  	start_month = document.getElementById("calender_event_from_2i").value;
	  	start_day =  document.getElementById("calender_event_from_3i").value;
	  	start_hours = document.getElementById("calender_event_from_4i").value;
	  	start_min =  document.getElementById("calender_event_from_5i").value;
	  	start = start_year+'-'+start_month+'-'+start_day+'T'+start_hours+':'+start_min+':00+05:30';
	   	end_year =  document.getElementById("calender_event_to_1i").value;
	  	end_month = document.getElementById("calender_event_to_2i").value;
	  	end_day =  document.getElementById("calender_event_to_3i").value;
	  	end_hours = document.getElementById("calender_event_to_4i").value;
	  	end_min =  document.getElementById("calender_event_to_5i").value;
	  	end = end_year+'-'+end_month+'-'+end_day+'T'+end_hours+':'+end_min+':00+05:30';

	   	var event = {
	   		'summary': title,
	   		'location': '800 Howard St., San Francisco, CA 94103',
	   		'description': description,
	   		'start': {
	   			'dateTime': start, //'2017-2-2T09:00:00-07:00',
	   			'timeZone': 'Asia/Kolkata'
	   		},
	   		'end': {
	   			'dateTime': end,//'2017-2-2T11:00:00-07:00',
	   			'timeZone': 'Asia/Kolkata'
	   		},
	   		'recurrence': [
	   		'RRULE:FREQ=DAILY;COUNT=2'
	   		],
	   		'attendees': [
	   		{'email': 'ashish.mittal@quovantis.com'}
	   		],
	   		'reminders': {
	   			'useDefault': false,
	   			'overrides': [
	   			{'method': 'email', 'minutes': 24 * 60},
	   			{'method': 'popup', 'minutes': 10}
	   			]
	   		}
	   	};

	   	var request = gapi.client.calendar.events.insert({
	   		'calendarId': 'primary',
	   		'resource': event
	   	});

	   	request.execute(function(event) {
	   		appendPre('Event created: ' + event.htmlLink);
	   	});
   }

function show_repeats(e) {
	console.log(e.value);
	if(e.value=="Monthly"){

	}
	else{

	}
}