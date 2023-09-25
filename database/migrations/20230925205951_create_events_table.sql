-- migrate:up
CREATE TABLE IF NOT EXISTS kuberoke.events (
  id serial PRIMARY KEY,
  name text NOT NULL,
  created_at timestamp NOT NULL,
  updated_at timestamp NOT NULL
);

-- migrate:down
DROP TABLE IF EXISTS kuberoke.events CASCADE;
