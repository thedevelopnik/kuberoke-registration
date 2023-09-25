-- migrate:up
CREATE TABLE IF NOT EXISTS kuberoke.attendees_events (
  attendee_id uuid NOT NULL REFERENCES kuberoke.attendees(id),
  event_id int NOT NULL references kuberoke.events(id),
  created_at timestamp NOT NULL,
  updated_at timestamp NOT NULL,
  PRIMARY KEY (attendee_id, event_id)
);

-- migrate:down
DROP TABLE IF EXISTS upchieve.attendees_events CASCADE;
