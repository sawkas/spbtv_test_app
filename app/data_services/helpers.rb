module DataServices
  module Helpers
    NOT_EARLIER_SECONDS = 5
    DATA_SEPARATOR = '%:%'

    private

    def timestamp
      Time.now.to_i
    end

    def actual_timestamps
      current_timestamp = timestamp
      range = (current_timestamp - NOT_EARLIER_SECONDS)..current_timestamp
      range.to_a
    end

    def data_string(customer_id, video_id)
      "#{customer_id}#{DATA_SEPARATOR}#{video_id}"
    end

    def select_by_customer_id(array, customer_id)
      array.select { |i| i[/^#{customer_id}#{DATA_SEPARATOR}.*$/] }
    end

    def select_by_video_id(array, video_id)
      array.select { |i| i[/^.*#{DATA_SEPARATOR}#{video_id}$/] }
    end
  end
end
