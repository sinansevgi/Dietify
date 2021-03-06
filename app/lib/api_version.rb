class ApiVersion
  attr_reader :version, :default

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(version, default = false)
    @version = version
    @default = default
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def matches?(request)
    check_headers(request.headers) || default
  end

  private

  def check_headers(headers)
    accept = headers[:accept]
    accept&.include?("application/vnd.meals.#{version}+json")
  end
end
