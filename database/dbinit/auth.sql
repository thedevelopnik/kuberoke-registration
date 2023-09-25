CREATE ROLE app WITH LOGIN PASSWORD 'Password123';

GRANT ALL privileges ON ALL tables IN SCHEMA kuberoke TO app;

GRANT ALL privileges ON ALL sequences IN SCHEMA kuberoke TO app;

GRANT usage ON SCHEMA kuberoke TO app;

ALTER ROLE app SET search_path = kuberoke;

ALTER DEFAULT PRIVILEGES IN SCHEMA kuberoke GRANT ALL PRIVILEGES ON tables TO app;
 