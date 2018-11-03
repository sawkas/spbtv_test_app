module DataServices
  class Base
    include DataServices::Helpers

    def customer_on_video(_customer_id, _video_id)
      raise 'customer_on_video should be implemented'
    end

    def videos_count(customer_id)
      select_by_customer_id(actual_data_strings, customer_id).size
    end

    def customers_count(video_id)
      select_by_video_id(actual_data_strings, video_id).size
    end
  end
end
