class NewLoanWorker
  ROUTING_KEY = 'basic_app.book_loans'

  include Sneakers::Worker
  from_queue 'logs', exchange: 'basic_app', exchange_type: :direct, routing_key: ROUTING_KEY

  def work(data)
    logs = JSON.parse(data)

    Log.create(
      user_id: logs['book_loan']['user_id'],
      data: logs,
      log_type: ROUTING_KEY)
  end
end