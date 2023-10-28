class LogsWorker
  include Sneakers::Worker
  from_queue 'logs', exchange: 'basic_app', exchange_type: :direct, routing_key: 'basic_app.book_loans'

  def work(data)
    logs = JSON.parse(data)

    Log.create(user_id: logs['book_loan']['user_id'], data: logs)
  end
end