class AdminController < ApplicationController
  def login
    if request.post?
      member = Member.authenticate(params[:name], params[:password])
      if member
        session[:member_id] = member.id
        uri = session[:original_uri]
        if /logout/ =~ uri
          uri = nil
        end
        if uri
          uri = "/booth" + uri
          session[:original_uri] = nil
        end
        redirect_to(uri || {:action => "index"})
      else
        flash.now[:notice] = "無効なユーザ・パスワードの組み合わせです"
      end
    end
  end

  def logout
    session[:member_id] = nil
    flash[:notice] = 'ログアウト'
  end

  def index
  end

end
