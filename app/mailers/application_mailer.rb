class ApplicationMailer < ActionMailer::Base
  default from: 'admin@simple_blog.com'
  layout 'mailer'
end
