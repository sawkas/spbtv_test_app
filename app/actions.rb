class SpbtvTestApp < Sinatra::Application
  # actions
  watch_stream = lambda do
    settings.data_service.customer_on_video(params[:customer_id], params[:video_id])
    json storage: settings.data_service.storage
  end

  videos_count = lambda do
    json videos_count: settings.data_service.videos_count(params[:customer_id])
  end

  customers_count = lambda do
    json customers_count: settings.data_service.customers_count(params[:video_id])
  end

  # routes
  post '/watch_stream',              &watch_stream
  get  '/videos_count/:customer_id', &videos_count
  get  '/customers_count/:video_id', &customers_count
end
