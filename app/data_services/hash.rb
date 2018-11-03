module DataServices
  class Hash < Base
    attr_reader :storage

    def initialize
      @storage = {}
    end

    def customer_on_video(customer_id, video_id)
      current_timestamp = timestamp

      storage[current_timestamp] ||= []
      storage[current_timestamp] << data_string(customer_id, video_id)
    end

    private

    def actual_data_strings
      storage.values_at(*actual_timestamps).flatten.uniq.compact
    end
  end
end
