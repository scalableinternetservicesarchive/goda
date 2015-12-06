module UsersHelper
    def cache_key_for_user(user)
        "user/#{user.id}/#{user.updated_at}"
    end

    def cache_key_for_user_table
        "user-table-#{User.maximum(:updated_at)}"
    end
end
