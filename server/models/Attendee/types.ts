import { v4 as UUID } from 'uuid'

export type Attendee = {
  id: string // UUID
  name: string
  email: string
  ticketCode?: string
  createdAt: Date
  updatedAt: Date
}

export type RegisterPayload = {
  email: string
  name: string
  ticketCode?: string
}
