require 'faraday'

#conn = Faraday::Connection.new 'http://127.0.0.1:3000'
#conn.post('http://127.0.0.1:3000/friends/new', first_name: "Sagar", last_name: "Saini", email: "sagar@gmail.com",phone: "234234324",twitter: "sagar020")

conn = Faraday.new(:url => 'http://127.0.0.1:3000') do |c|
    c.adapter Faraday::Request::UrlEncoded  # encode request params as "www-form-urlencoded"
    c.adapter Faraday::Response::Logger     # log request & response to STDOUT
    c.adapter Faraday::Adapter::NetHttp     # perform requests with Net::HTTP
  end
  
  response = conn.get '/friends/new'     # GET http://sushi.com/nigiri/sake.json
  response.body
  
  conn.post '/friends/new', { :first_name => "Sagar", :last_name => "Saini", :email => "sagar@gmail.com",:phone => "234234324",:twitter => "sagar020"}  # POST "name=maguro" to http://sushi.com/nigiri
  

