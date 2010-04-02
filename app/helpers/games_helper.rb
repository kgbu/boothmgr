module GamesHelper
  def numberofattendants(game_id, schedulesymbol) 
    attends = Attend.find(:all, :conditions => [
      #"game_id = ? and ? like '%○%'", game_id, schedulesymbol.to_s])
      "game_id = ? and " + schedulesymbol.to_s + " like '%○%'", game_id])
      # "game_id = ?", game_id])
    attends.length 
  end
end
