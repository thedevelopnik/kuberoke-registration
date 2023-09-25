/* @name registerAttendee */
INSERT INTO attendees (id, name, email, ticket_code, created_at, updated_at)
  VALUES (:id!, :name!, :email!, :ticketCode, NOW(), NOW())
ON CONFLICT (email)
  DO NOTHING
RETURNING
  id, name, email;

/* @name getAttendeeByName */
SELECT
  name,
  email,
  ticket_code
FROM
  attendees
WHERE
  name = :name!;
