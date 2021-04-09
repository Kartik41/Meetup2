class ContactMailer < ApplicationMailer
    default from: 'notification@example.com'

    CONTACT_EMAIL = 'kartikchauhan999@gmail.com'

    def submission(message)
        @message = message
        mail(to: CONTACT_EMAIL, subject: 'New contact Page submission')
    end
    
end
