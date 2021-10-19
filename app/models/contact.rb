class Contact < MailForm::Base
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w.%+\-]+)@([\w\-]+\.)+(\w{2,})\z/i
  attribute :subject,   validate: true
  attribute :message,   validate: true
  attribute :security_question, validate: /\b(archivist|archiver)\b/i
  attribute :nickname, captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: subject,
      to: 'mandap.fmg@gmail.com',
      from: %("#{name}" <#{email}>)
    }
  end
end
