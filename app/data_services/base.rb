module DataServices
  class Base
    include DataServices::Helpers

    def customer_on_video(customer_id, video_id)
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


# storage
# {
#   unix_time_string: [
#     "#{customer_id}#{separator}#{video_id}"
#   ]
# }

# storage example
# {
#   "1541254562": [
#     "customer_id_1%:%video_id_1",
#     "customer_id_1%:%video_id_2",
#     "customer_id_2%:%video_id_1"
#   ],
#   "1541254563": [
#     "customer_id_1%:%video_id_2",
#     "customer_id_2%:%video_id_1",
#     "customer_id_2%:%video_id_3"
#   ]
# }
