class PanelMailer < MandrillMailer::TemplateMailer
  default async: true
 
  def blast(user, email)

    case email.to
    when 1
      to_map = user.humans.map { |human| { email: human.email, name: human.fullname }}
    when 2
      to_map = user.map { |user| { email: user.email, name: user.firstname+" "+user.lastname }}
    end
    
    var_humans = user.humans.map { |human| { human.email => {'FULL_NAME' => human.fullname}}}

    mandrill_mail template: 'blast-1',
      subject: email.subject,
      to: to_map,
      from_email: user.mailer,
      from: user.mailer,
      from_name: user.businessname, 
      template_content: {'body' => email.body},
      vars: {
            'LOGO' => "https://wifiuploads.s3.amazonaws.com/uploads/user/logourl/#{user.id}/#{user.logourl.file.filename}",
            'BG_COLOR' => user.bghex},
      inline_css: true,
      recipient_vars: var_humans
  end
end