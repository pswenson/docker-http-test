#!/usr/bin/env ruby

require 'rubygems'
require 'rest-client'
EXPECTED_HTTP_STATUS_CODE = (ENV['EXPECTED_HTTP_STATUS_CODE'] || 200).to_i
RETRY_MAX = (ENV['RETRY_MAX'] || 5).to_i
url = ENV['URL'] || (raise 'required [URL] environment variable not set!')
begin
  retries ||= 0
  puts "try ##{ retries + 1 }"
  puts "http check:[#{url}]"
  response = RestClient.get url
  puts response
  if response.code != EXPECTED_HTTP_STATUS_CODE
    raise "HTTP Response code [#{response.code}] received, expected [#{EXPECTED_HTTP_STATUS_CODE}]"
  end
rescue Exception => e
  puts e
  if (retries += 1) < RETRY_MAX
    sleep 1
    retry
  end
  puts "Max retries hit."
  exit(1)
end
