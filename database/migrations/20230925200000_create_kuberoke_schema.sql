-- migrate:up
CREATE SCHEMA IF NOT EXISTS kuberoke;

-- migrate:down
DROP SCHEMA IF EXISTS kuberoke;
