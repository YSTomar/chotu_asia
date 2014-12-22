class UsersController < ApplicationController
  
  before_filter :require_user, :only => [:show, :edit, :update]

  def show
    @user = current_user
  end

  def geocoding_search
    ips = ["122.160.25.240", "122.170.25.240", "122.140.25.240", "122.179.25.240"]
    ip = ips[rand(4)]
    geo = Geokit::Geocoders::GoogleGeocoder.geocode(ip)
    render :json => {:lat => geo.all.first.lat, :lon => geo.all.first.lng}
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if @user.save
      flash[:notice] = "Your account has been created."
      redirect_to root_url
    else
      flash[:notice] = "There was a problem creating you."
      render :action => :new
    end
    
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update(user_params)
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end    
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :name, :password_confirmation)
    end
end
