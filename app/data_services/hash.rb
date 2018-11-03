module DataServices
  class Hash < Base
    def initialize
      @storage = {}
    end

    def customer_on_video(customer_id, video_id)
      current_timestamp = timestamp

      storage[current_timestamp] ||= []
      storage[current_timestamp] << data_string(customer_id, video_id)
    end

    def videos_count(customer_id)
      select_by_customer_id(actual_data_strings, customer_id).size
    end

    def customers_count(video_id)
      select_by_video_id(actual_data_strings, video_id).size
    end

    private

    def actual_data_strings
      storage.values_at(*actual_timestamps).flatten.uniq.compact
    end
  end
end
