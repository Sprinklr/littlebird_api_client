module LittleBird
  class User < ResponseType
    def topics
      client.influencer_discover(domain: "twitter", identity: user.id)
    end
  end
end