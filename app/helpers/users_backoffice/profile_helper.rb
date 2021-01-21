module UsersBackoffice::ProfileHelper
    def user_gender (user, current_gender)
        user.user_profile.gender == current_gender ?
        'btn-primary' : 'btn-default'
    end
end
