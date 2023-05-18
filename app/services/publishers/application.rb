require 'bunny'
class Publishers::Application
  def initialize( message: , exchange_name: , routing_key: )
    @message = message
    @exchange_name = exchange_name
    @routing_key = routing_key
  end

  def perform
    connection.start
    channel = connection.create_channel
    exchange = channel.direct(exchange_name)
    exchange.publish(message.to_json, routing_key: routing_key)
    connection.close
  end

  private
  attr_reader :message, :exchange_name, :routing_key

  def connection_options
    {
      host: "localhost",
      port: "5672",
      vhost: "/",
      username: "guest",
      password: "guest"
    }
   end

   def connection
    @connection ||= Bunny.new(connection_options)
   end
end
