# Persistence model for events.
# This is the DB-facing record separate from the ingestion DTO.

require "uuid"

class EventRecord
  include JSON::Serializable

  property id : String
  property event : String
  property timestamp : Int64
  property received_at : Int64

  property project_id : String
  property org_id : String
  property funnel_id : String?

  property user_id : String?
  property anonymous_id : String?

  property properties : JSON::Any
  property context : JSON::Any?

  property created_at : Int64

  def initialize(
    id : String,
    event : String,
    timestamp : Int64,
    received_at : Int64,
    project_id : String,
    org_id : String,
    funnel_id : String?,
    user_id : String?,
    anonymous_id : String?,
    properties : JSON::Any,
    context : JSON::Any?,
    created_at : Int64
  )
    @id = id
    @event = event
    @timestamp = timestamp
    @received_at = received_at
    @project_id = project_id
    @org_id = org_id
    @funnel_id = funnel_id
    @user_id = user_id
    @anonymous_id = anonymous_id
    @properties = properties
    @context = context
    @created_at = created_at
  end

  def self.from_ingested_event(event : IngestedEvent)
    EventRecord.new(
      UUID.random.to_s,
      event.event,
      event.timestamp,
      event.received_at,
      event.project_id,
      event.org_id,
      event.funnel_id,
      event.user_id,
      event.anonymous_id,
      event.properties,
      event.context,
      Time.local.to_unix
    )
  end
end
