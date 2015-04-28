module SessionsHelper

  def active_session
    # FIXME — Remove duplicate `code` code
    @active_session unless @active_session.blank?
    code = cookies[:session_code]
    if code.blank?
      code = params[:session_code]
    end
    @active_session = Session.where(session_code: code, is_active: true).first
  end

  def active_session_character
    @current_user unless @current_user.blank?
    code = cookies[:session_code]
    if code.blank?
      code = params[:session_code]
    end
    session = Session.where(session_code: code).includes(:user).limit(1).to_a.first
    session.blank? ? nil : @current_user = session.character
  end
  alias_method :current_user, :active_session_character

  def clear_session_cookie
    #cookies.signed.permanent[:session_code] = ''
    cookies.delete(:session_code)
  end
  
  def is_active_session
    !active_session.blank?
  end

  def save_session_for_character(character)
    save_session_for_user(character)
  end

  def save_session_cookie(session)
    cookies.permanent[:session_code] = session.code
  end

  def save_session_for_user(user)
    s = Session.new(ip_address: request.remote_ip)
    s.user = user
    s.save_with_session_code
    save_session_cookie(s)
  end
end
