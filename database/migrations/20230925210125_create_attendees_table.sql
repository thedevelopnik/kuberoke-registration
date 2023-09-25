-- migrate:up
CREATE TABLE IF NOT EXISTS kuberoke.attendees (
  id uuid PRIMARY KEY,
  name text NOT NULL,
  email text NOT NULL UNIQUE,
  ticket_code text,
  created_at timestamp NOT NULL,
  updated_at timestamp NOT NULL
);

-- migrate:down
DROP TABLE IF EXISTS kuberoke.attendees CASCADE;
