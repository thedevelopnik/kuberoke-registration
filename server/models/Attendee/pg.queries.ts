/** Types generated for queries found in "server/models/Attendee/attendee.sql" */
import { PreparedQuery } from '@pgtyped/runtime';

/** 'RegisterAttendee' parameters type */
export interface IRegisterAttendeeParams {
  email: string;
  id: string;
  name: string;
  ticketCode?: string | null | void;
}

/** 'RegisterAttendee' return type */
export interface IRegisterAttendeeResult {
  email: string;
  id: string;
  name: string;
}

/** 'RegisterAttendee' query type */
export interface IRegisterAttendeeQuery {
  params: IRegisterAttendeeParams;
  result: IRegisterAttendeeResult;
}

const registerAttendeeIR: any = {"usedParamSet":{"id":true,"name":true,"email":true,"ticketCode":true},"params":[{"name":"id","required":true,"transform":{"type":"scalar"},"locs":[{"a":87,"b":90}]},{"name":"name","required":true,"transform":{"type":"scalar"},"locs":[{"a":93,"b":98}]},{"name":"email","required":true,"transform":{"type":"scalar"},"locs":[{"a":101,"b":107}]},{"name":"ticketCode","required":false,"transform":{"type":"scalar"},"locs":[{"a":110,"b":120}]}],"statement":"INSERT INTO attendees (id, name, email, ticket_code, created_at, updated_at)\n  VALUES (:id!, :name!, :email!, :ticketCode, NOW(), NOW())\nON CONFLICT (email)\n  DO NOTHING\nRETURNING\n  id, name, email"};

/**
 * Query generated from SQL:
 * ```
 * INSERT INTO attendees (id, name, email, ticket_code, created_at, updated_at)
 *   VALUES (:id!, :name!, :email!, :ticketCode, NOW(), NOW())
 * ON CONFLICT (email)
 *   DO NOTHING
 * RETURNING
 *   id, name, email
 * ```
 */
export const registerAttendee = new PreparedQuery<IRegisterAttendeeParams,IRegisterAttendeeResult>(registerAttendeeIR);


/** 'GetAttendeeByName' parameters type */
export interface IGetAttendeeByNameParams {
  name: string;
}

/** 'GetAttendeeByName' return type */
export interface IGetAttendeeByNameResult {
  email: string;
  name: string;
  ticketCode: string | null;
}

/** 'GetAttendeeByName' query type */
export interface IGetAttendeeByNameQuery {
  params: IGetAttendeeByNameParams;
  result: IGetAttendeeByNameResult;
}

const getAttendeeByNameIR: any = {"usedParamSet":{"name":true},"params":[{"name":"name","required":true,"transform":{"type":"scalar"},"locs":[{"a":70,"b":75}]}],"statement":"SELECT\n  name,\n  email,\n  ticket_code\nFROM\n  attendees\nWHERE\n  name = :name!"};

/**
 * Query generated from SQL:
 * ```
 * SELECT
 *   name,
 *   email,
 *   ticket_code
 * FROM
 *   attendees
 * WHERE
 *   name = :name!
 * ```
 */
export const getAttendeeByName = new PreparedQuery<IGetAttendeeByNameParams,IGetAttendeeByNameResult>(getAttendeeByNameIR);


