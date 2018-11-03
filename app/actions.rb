class SpbtvTestApp < Sinatra::Application
  # actions
  watch_stream = lambda do
    customer_id = params[:customer_id]
    video_id    = params[:video_id]
    timestamp   = Time.now.to_i

    status 200
  end

  videos_count = lambda do
    customer_id = params[:customer_id]
    timestamp   = Time.now.to_i

    json videos_count: 10
  end

  customers_count = lambda do
    video_id  = params[:video_id]
    timestamp = Time.now.to_i

    json customers_count: 10
  end

  # routes
  post '/watch_stream',              &watch_stream
  get  '/videos_count/:customer_id', &videos_count
  get  '/customers_count/:video_id', &customers_count
end
