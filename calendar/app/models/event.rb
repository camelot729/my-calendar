class Event < ApplicationRecord
  belongs_to :user
  scope :future_events, -> (start_time) {
    where( "start_time >= ?", Time.current )
  }
  scope :prev_events, -> (start_time) {
    where( "start_time <?", Time.current )
  }

end
