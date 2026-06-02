require "../models/track.model.cr"
require "../models/event_record.cr"

class TrackService
  ###
  # Process an ingested event.
  # This service layer is responsible for translating the incoming payload
  # into a persistence record and enqueuing it for later batch processing.
  ###
  def self.process(event : IngestedEvent)
    record = EventRecord.from_ingested_event(event)
    enqueue_for_processing(record)
  end

  private def self.enqueue_for_processing(record : EventRecord)
    # TODO: replace this with Redis queue logic when ready.
    # For now the event is serialized for a queue consumer.
    serialized = record.to_json
    puts "Enqueued event record: #{serialized}"
  end
end
