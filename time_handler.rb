class TimeHandler
  attr_reader :time_format, :unknown

  FORMATS = { 'year' => '%Y-', 'month' => '%m-', 'day' => '%d',
              'hour' => '%H:', 'minute' => '%M:', 'second' => '%S' }.freeze

  def initialize(params)
    @time_format = ''
    @unknown = []
    time_output(params['format'].split(','))
  end

  private

  def time_output(params)
    params.each do |format|
      if FORMATS[format]
        @time_format += FORMATS[format]
      else
        @unknown << format
      end
    end
  end
end
