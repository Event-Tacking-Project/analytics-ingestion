# Persistence model for events.
# This is the DB-facing record separate from the ingestion DTO.

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

  def self.from_ingested_event(event : IngestedEvent)
    EventRecord.new(
      id: Random.uuid,
      event: event.event,
      timestamp: event.timestamp,
      received_at: event.received_at,
      project_id: event.project_id,
      org_id: event.org_id,
      funnel_id: event.funnel_id,
      user_id: event.user_id,
      anonymous_id: event.anonymous_id,
      properties: event.properties,
      context: event.context,
      created_at: Time.local.to_unix
    )
  end
end
