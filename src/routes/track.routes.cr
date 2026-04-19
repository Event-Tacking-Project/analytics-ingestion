require "../controllers/track.controller.cr"

post "/track" do |env|
    TrackController.handle(env)
end