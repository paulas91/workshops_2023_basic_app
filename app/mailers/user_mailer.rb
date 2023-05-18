class UserMailer < ApplicationMailer
  def loan_created_email(book_loan )
    @title = book_loan.book.title
    @due_date = book_loan.due_date
    email_adress = book_loan.user.email
    mail(to: email_adress, subject: "wypożyczona książka")
  end

  def due_date_notification_email(book_loan)
    @title = book_loan.book.title
    @due_date = book_loan.due_date
    email_adress = book_loan.user.email
    mail(to: email_adress, subject: "Termin oddania książki jest jutro")
  end
end
