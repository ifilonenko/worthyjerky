module UsersHelper

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  BAD_WORDS = %w(cunt shit pussy faggot fuck fuq hoes hoez jizz nigger nigga motherfucker motherfucka mfucka fucka fucker fuckity fck)
  
  def is_profane_name?(name)
    if name.blank?
      return false
    else
      n = name.downcase
    end
    BAD_WORDS.each do |t|
      if n.include? t
        return true
      end
    end
    return false
  end

  def save_user_to_cookie(a_user)
    if a_user.has_temp_password && !has_facebook_id(a_user)
      cookies[:new_user] = { value: a_user.id, expires: 20.years.from_now }
    else
      cookies[:current_user] = { value: a_user.remember_token, expires: 20.years.from_now }
    end
  end


end

