require 'httparty'

body = {
  timestamp: 1493758596,
  data: [
    { title: 'Part 1', values: [0, 3, 5, 6, 2, 9] },
    { title: 'Part 2', values: [6, 3, 1, 3, 9, 4] }
  ]
}

response = HTTParty.post('http://localhost:3000/compute/123456.json',
  body: body.to_json,
  :headers => { 'Accept' => 'application/json', 'Content-Type' => 'application/json' })

puts response.body
