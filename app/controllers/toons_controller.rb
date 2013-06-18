class ToonsController < ApplicationController
  # before_filter :authenticate_user! , :except => [:index , :show]
  #  before_filter :only_allow_admin, :only => [ :index ]
  load_and_authorize_resource

  def new
    @toon = Toon.new
  end

  def create
    @toon = Toon.new(params[:toon])
    @toon.created_by = current_user.id
    if @toon.save
      redirect_to toons_path
      flash[:notice]= "Your Toon has been sent for approval..It will be published shortly"
    else
      render "new"
    end
  end

  def index
    #    raise current_user.inspect
    @search1 = Toon.search(params[:search]).published().where("name like ?", "%#{params[:q]}%")
     @search = Toon.search(params[:search])
    @toons=@search.published().order('created_at DESC').page(params[:page]).per(4)
    @toons_corousel=Toon.published()
    respond_to do |format|
      format.html
      format.json { render :json => @search1.map(&:attributes)}
    end
  end
  
  def show
    @toon=Toon.find(params[:id])
    @comments = @toon.comments.all
  end

  def myshow
    @search = Toon.search(params[:search])
    @toons=@search.myshow(current_user).order('created_at DESC' ).page(params[:page]).per(4)
    # @toonss=Toon.myshow(current_user)

  end

  def dashboard_moderator
    @unapproved = Toon.unapproved(current_user).order('created_at DESC' )
  end

  def dashboard_publisher
    @approved = Toon.approved(current_user).order('created_at DESC' )
    @toons=@unapproved
  end

  def approve
    @toon = Toon.find(params[:id])
    @toon.state = "approved"
    @toon.save
    flash[:notice]= "Approved Succesfully"
    redirect_to dashboard_moderator_url
    flash[:notice]= "Approved Succesfully"
  end

  def disapprove
    @toon = Toon.find(params[:id])
    @toon.state = "disapproved"
    @toon.save
    redirect_to dashboard_moderator_url
    flash[:notice]= "Disapproved Succesfully"
  end

  def publish
    @toon = Toon.find(params[:id])
    @toon.state = "published"
    @toon.save
    redirect_to dashboard_publisher_url
    flash[:notice]= "Published Succesfully"
  end
end
