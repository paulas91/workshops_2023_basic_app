require 'bunny'
class Publishers::LoanBookPublisher
  def initialize(data)
    @data = data
  end

  def publish
    ::Publishers::Application.new(
      routing_key: 'basic_app.book_loans',
      exchange_name: 'basic_app',
      message: data
    ).perform
  end

  attr_reader :data
end
