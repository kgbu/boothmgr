class MembersController < ApplicationController
  def index
    @members = Member.find(:all, :order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @members}
    end
  end

  # GET /members/1
  # GET /members/1.xml
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @member}
    end
  end

  def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.xml
  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        flash[:notice] = 'メンバー#{@member.name}が作成されました'
        format.html { redirect_to(:action =>'index') }
        format.xml  { render :xml => @member, :status => :created, :location => @member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.xml
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        flash[:notice] = 'メンバー#{@member.name}が更新されました'
        format.html { redirect_to(:action =>'index') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.xml
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to(members_url) }
      format.xml  { head :ok }
    end
  end

private
  def find_admin
    unless session[:admin]
      session[:admin] = Admin.new
    end
    session[:admin]
  end
end
