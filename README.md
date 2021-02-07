# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.7.2

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

Update the redis URL
Live application sample link is


https://enigmatic-gorge-24669.herokuapp.com/

Sample API call for Inbound sms

require 'uri'
require 'net/http'

url = URI("https://enigmatic-gorge-24669.herokuapp.com//api/v1/inbound/sms")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["content-type"] = 'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW'
request["authorization"] = 'Basic YXpyNTo2RExIOEEyNVha'
request["cache-control"] = 'no-cache'
request["postman-token"] = '8650371b-56b0-5e03-ae5d-5d96a80dd63d'
request.body = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"from\"\r\n\r\n61871112940\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"to\"\r\n\r\n61871112940\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"text\"\r\n\r\nSTOP\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"

response = http.request(request)
puts response.read_body


Sample API call for OutBound 

require 'uri'
require 'net/http'

url = URI("https://enigmatic-gorge-24669.herokuapp.com/api/v1/outbound/sms")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["content-type"] = 'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW'
request["authorization"] = 'Basic YXpyNTo2RExIOEEyNVha'
request["cache-control"] = 'no-cache'
request["postman-token"] = '0fa8aa15-3147-90be-cd46-fc1b14d325b2'
request.body = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"from\"\r\n\r\n61871112940\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"to\"\r\n\r\n61871112940\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"text\"\r\n\r\nSTOP\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"

response = http.request(request)
puts response.read_body

* ...
