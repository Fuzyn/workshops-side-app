# frozen_string_literal: true

class Log < ApplicationRecord
  include ActiveModel::Serializers::JSON
  
  validates :user_id, presence: true
  validates :data, presence: true
  validates :log_type, presence: true

  def log_type_description
    if self.log_type == 'basic_app.book_loans'
      'New Book Loan'
    elsif self.log_type == 'basic_app.remove_loans'
      'Book Loan removed'
    else
      'Default log'
    end
  end
end
