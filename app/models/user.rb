class User < ActiveRecord::Base
	acts_as_authentic
  has_one :location, :class_name => 'Location',dependent: :destroy

  def remote_ip
    if current_login_ip == '127.0.0.1'
      '122.179.43.225'
    else
      current_login_ip
    end
  end

end
