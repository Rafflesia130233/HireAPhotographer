class PagesController < ApplicationController
  def show
    render template: "pages/#{params[:page]}"
    puts "Hellow"
    puts params[:email]
    if !params[:email].nil?

      mail = ContactMailer.sample_email(params[:name],params[:email], params[:phone], params[:message]) # => a tmail object
      mail.deliver()
    end
  end
end
