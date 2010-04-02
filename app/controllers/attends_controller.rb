class AttendsController < ApplicationController
  def index
    @game = Game.find(params[:game_id])
    @timeschedules = @game.timeschedule.chomp.split("\n")
    @schedulehash = @timeschedules.zip([:prepok, :zenzaok, :prepsignok,
                     :signhelpok, :settledownok, :kaigiok, :extraok])
    # @member = Member.find(params[:member_id])
    @attends = @game.attends
  end

  def show
    @game = Game.find(params[:game_id])
    @timeschedules = @game.timeschedule.chomp.split("\n")
    @schedulehash = @timeschedules.zip([:prepok, :zenzaok, :prepsignok,
                     :signhelpok, :settledownok, :kaigiok, :extraok])
    @attend = @game.attends.find(params[:id])
    @member = Member.find(@attend.member_id)
  end

  def new
    @game = Game.find(params[:game_id])
    @timeschedules = @game.timeschedule.chomp.split("\n")
    @schedulehash = @timeschedules.zip([:prepok, :zenzaok, :prepsignok,
                     :signhelpok, :settledownok, :kaigiok, :extraok])
    @members = Member.all
    @attend = @game.attends.build
  end

  def create
    @game = Game.find(params[:game_id])
    @timeschedules = @game.timeschedule.chomp.split("\n")
    @schedulehash = @timeschedules.zip([:prepok, :zenzaok, :prepsignok,
                     :signhelpok, :settledownok, :kaigiok, :extraok])
    @attend = @game.attends.build(params[:attend])
    @members = Member.all
    @member = Member.find(@attend.member_id)
    if @attend.save
      redirect_to game_attend_url(@game, @attend)
    else
      render :action => "new"
    end
  end

  def edit
    @game = Game.find(params[:game_id])
    @timeschedules = @game.timeschedule.chomp.split("\n")
    @schedulehash = @timeschedules.zip([:prepok, :zenzaok, :prepsignok,
                     :signhelpok, :settledownok, :kaigiok, :extraok])
    @attend = @game.attends.find(params[:id])
    @member = Member.find(@attend.member_id)
    @members = Member.all
  end

  def update
    @game = Game.find(params[:game_id])
    @timeschedules = @game.timeschedule.chomp.split("\n")
    @schedulehash = @timeschedules.zip([:prepok, :zenzaok, :prepsignok,
                     :signhelpok, :settledownok, :kaigiok, :extraok])
    @attend = Attend.find(params[:id])
    @member = Member.find(@attend.member_id)
    if @attend.update_attributes(params[:attend])
      redirect_to game_attend_url(@game, @attend)
    else
      render :action => "edit"
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
    @attend = Attend.find(params[:id])
    @member = Member.find(@attend.member_id)
    @attend.destroy

    respond_to do |format|
      format.html { redirect_to game_attends_path(@game) }
      format.xml { head :ok }
    end
  end

protected
  def authorize
  end

end
