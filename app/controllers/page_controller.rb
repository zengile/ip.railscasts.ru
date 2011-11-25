class PageController < ApplicationController
  def index
    @user_ip = request.remote_ip
  end


  def json
    render :json => {:ip => request.remote_ip }    
  end

  def domain
    domain = params[:domain]
    if domain.blank?
      json = {}
    else
      json = {:domain => domain, :ip => IPSocket::getaddress(domain) }
    end
    render :json => json    
  end  
  
end
