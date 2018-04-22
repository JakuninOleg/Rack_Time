require_relative 'time_handler'

class App
  def call(env)
    @request = Rack::Request.new(env)

    case @request.path_info
    when '/time'
      time = TimeHandler.new(@request.params)

      if time.unknown.empty?
        response(200, Time.now.strftime(time.time_format))
      else
        response(400, "Unknown time format - #{time.unknown}")
      end
    else
      response(404, "The Force is not here, Luke!")
    end
  end

  private

  def response(status, body)
    [
      status,
      { 'Content-Type' => 'text/plain' },
      [body]
    ]
  end
end
