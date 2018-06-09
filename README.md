# Calendar(https://calendar-kamil.herokuapp.com/)

The following features are implemented in the calendar: viewing of events of one's own and all users in two modes:
1. Month calendar
2. List 

The current day in the monthly calendar is marked in orange.

In the monthly calendar, by clicking on a certain date, you can go to the page to view all the events of this day.

The event has the following fields:
    1. Event title(title)
    2. Event body(body)
    3. Event start time(start_time)

On the event view page, except for the above event fields, you can also see the author of the event. The event can also be edited and deleted.

Gem slim is used for all views.

Additional functionality:
1. Login by Google account, I use omniauth-google-oauth2 gem to it
2. Filter events: 
    1. Past event
    2. Future event