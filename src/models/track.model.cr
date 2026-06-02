struct IngestedEvent
    include JSON::Serializable

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
end
