Class {
	#name : #RPSGames,
	#superclass : #Object,
	#instVars : [
		'rawGames',
		'games'
	],
	#category : #'Advent2022-Day 02'
}

{ #category : #accessing }
RPSGames >> games [
	games := rawGames collect: [:g | RPSGame new game: g]
]

{ #category : #accessing }
RPSGames >> gtGamesFor: aView [
	<gtView>
	^ aView columnedList
	title: 'Games - total=', self totalScore asString;
	items: [games];
	column: 'Play 1' text: #play1Normal;
	column: 'Play 2' text: #play2Normal;
	column: 'Winner' text: #winner;
	column: 'Score'  text: #score

]

{ #category : #accessing }
RPSGames >> rawGames: listOfPlays [
	rawGames := listOfPlays
]

{ #category : #accessing }
RPSGames >> totalScore [
	^ (games collect: #score) sum
]
