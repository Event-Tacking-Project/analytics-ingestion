require "json"
require "../services/track.service.cr"

class TrackController
    def self.handle(env)
        body = env.request.body.try do |io|
            io.gets_to_end
        end

        if body.nil? || body.empty?
            env.response.status_code = 400
            return env.response.print({"error" => "Empty request body"}.to_json)
        end

        event = parse_event(body)
        unless event
            env.response.status_code = 400
            return env.response.print({"error" => "Invalid event payload"}.to_json)
        end

        TrackService.process(event)

        env.response.status_code = 202
        env.response.print({"status" => "accepted"}.to_json)
    end

    private def self.parse_event(body : String)
        IngestedEvent.from_json(body) rescue nil
    end
end