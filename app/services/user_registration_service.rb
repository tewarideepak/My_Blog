class UserRegistrationService
    def self.call(user)
        if user.persisted?
            # UserMailer.new_user_email(user).deliver_later
            UserMailer.delay.new_user_email(user)
        end
    end
end
