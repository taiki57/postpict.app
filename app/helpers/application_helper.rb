module ApplicationHelper
    def ensure_correct_user
        !current_user.id
    end
end
