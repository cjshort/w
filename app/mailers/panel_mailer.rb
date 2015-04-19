class PanelMailer < MandrillMailer::TemplateMailer
  default async: true
 
  def blast(user, email)

    to_humans = user.humans.map { |human| { email: human.email, name: human.fullname }}
    var_humans = user.humans.map { |human| { human.email => {'FULL_NAME' => human.fullname}}}

    mandrill_mail template: 'blast-1',
      subject: email.subject,
      to: to_humans,
      from_email: user.mailer,
      from: user.mailer,
      from_name: user.businessname, 
      template_content: {'body' => email.body},
      vars: {
            'LOGO' => "https://wifiuploads.s3.amazonaws.com/uploads/user/logourl/#{user.id}/#{user.logourl}",
            'BG_COLOR' => user.bghex},
      inline_css: true,
      recipient_vars: var_humans
  end
end