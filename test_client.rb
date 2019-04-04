require 'httparty'

body = {
  timestamp: 1493758596,
  data: [
    { title: 'Part 1', values: [0, 3, 5, 6, 2, 9] },
    { title: 'Part 2', values: [6, 3, 1, 3, 9, 4] }
  ]
}

host = 'https://warm-waters-43210.herokuapp.com'

# Uncomemnt to test in development environment
# host = 'http://localhost:3000'

response = HTTParty.post("#{host}/compute/123456",
  body: body.to_json,
  :headers => { 'Accept' => 'application/json', 'Content-Type' => 'application/json' })

pp response.body
