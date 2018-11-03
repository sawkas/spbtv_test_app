module DataServices
  class Redis < Base
    attr_reader :redis

    def initialize
      @redis = ::Redis.new(
        host: ENV['REDIS_HOST'],
        port: ENV['REDIS_PORT'],
        db:   ENV['REDIS_DB']
      )
    end

    def customer_on_video(customer_id, video_id)
      redis.sadd(timestamp, data_string(customer_id, video_id))
    end

    private

    def actual_data_strings
      actual_timestamps.map { |t| redis.smembers(t) }.flatten.uniq.compact
    end
  end
end
