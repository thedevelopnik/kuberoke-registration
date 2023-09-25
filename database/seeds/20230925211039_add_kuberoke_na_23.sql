-- migrate:up
INSERT INTO kuberoke.events(name, created_at, updated_at)
  VALUES ('Kuberoke NA 2023', NOW(), NOW());

-- migrate:down
DELETE FROM kuberoke.events
WHERE name = 'Kuberoke NA 2023'
