class ContactMailer < ApplicationMailer
  #default from: "helps.bd2@gmail.com"
  def sample_email(name, email, phone,message)
    #puts name
    mail(to: "helps.bd2@gmail.com", subject: 'Sample Email', body: "email"+" "+ email +"\n"+ "phone"+" "+phone +"\n"+ "message"+" "+ message)
  end
end
