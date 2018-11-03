module DataServices
  class Base
    include DataServices::Helpers

    attr_reader :storage

    def customer_on_video(customer_id, video_id)
      raise 'customer_on_video should be implemented'
    end

    def videos_count(customer_id)
      raise 'videos_count should be implemented'
    end

    def customers_count(video_id)
      raise 'customers_count should be implemented'
    end
  end
end

# storage object example
# {
#   "1541254562": [
#     "customer_id_1%:%customer_id_1"
#     "customer_id_1%:%customer_id_2"
#     "customer_id_2%:%customer_id_2"
#   ],
#   "1541254563": [
#     "customer_id_1%:%customer_id_1"
#     "customer_id_2%:%customer_id_2"
#     "customer_id_3%:%customer_id_1"
#   ]
# }
