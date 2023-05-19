class DueDateNotificationJob
  include Sidekiq::Job

  def perform
    BookLoan.where(status: 'checked_out', due_date: Time.zone.now..Time.zone.now + 4.minutes).each do |book_loan|
      UserMailer.notification_email(book_loan).deliver_later
    end
  end
end
