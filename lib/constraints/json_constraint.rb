# Make sure we have json request.

class JsonConstraint
  def matches?(request)
    request.headers['ACCEPT'] == 'application/json' || request.format.to_sym == :json
  end
end