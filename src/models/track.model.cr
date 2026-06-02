# Model for incoming events to handle

struct IngestedEvent
    include JSON::Serializable

    # Event time data
    property event : String
    property timestamp : Int64
    property received_at : Int64

    # Id data for realtional mapping
    property project_id : String
    property org_id : String
    property funnel_id : String?

    # User data tied to event
    property user_id : String?
    property anonymous_id : String?

    # Event properties to support custom events
    property properties : JSON::Any
    property context : JSON::Any?
end
