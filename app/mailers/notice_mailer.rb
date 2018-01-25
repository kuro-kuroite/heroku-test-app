class NoticeMailer < ApplicationMailer
  def notice_mail(blog)
    @blog = blog

    mail to: @blog.user.email, subject: "【お知らせ】ブログの投稿が完了しました"
  end
end
