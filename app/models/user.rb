class User < ApplicationRecord
  has_many :games


  def topScore
    sorted = self.games.map { |game| game.score.to_i  }
    @topScore = sorted[-1]
    @topScore
  end

  def self.leaderboard
    obj = []
    User.all.each do |user|
       userObj = {name: user.name, score: user.topScore} unless user.games.empty?
       obj << userObj unless userObj.nil?
     end

    newObj = obj.sort_by {|player| player[:score]}
    newObj.reverse!
    @leaderboard = newObj.slice(0, 10);
  end



end
