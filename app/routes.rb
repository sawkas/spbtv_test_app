class SpbtvTestApp < Sinatra::Base
  watch_stream = lambda do
  end

  videos_count = lambda do
  end

  customers_count = lambda do
  end

  post '/watch_stream',              &watch_stream
  get  '/videos_count/:customer_id', &videos_count
  get  '/customers_count/:video_id', &customers_count
end
