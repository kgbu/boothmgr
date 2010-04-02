class AddTimescheduleToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :timeschedule, :string,
	  :default => "１．開門前準備（１０時１５分～）\n２．前座試合(１０時３０分～１２時、時間は目安)\n３．開門～サイン会整理券配布（１１時～１２時）\n４．サイン会列整理（７G)、旗貸出し(メイン)、１２時～１２時４０分）\n５．試合終了後片付け"
  end

  def self.down
    remove_column :games, :timeschedule
  end
end
