Class {
	#name : #RPSGames2,
	#superclass : #RPSGames,
	#category : #'Advent2022-Day 02'
}

{ #category : #accessing }
RPSGames2 >> games [
	"need to factor this so that the Game class is dynamic"
	games := rawGames collect: [:g | RPSGame2 new game: g]
]
