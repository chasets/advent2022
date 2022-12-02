Class {
	#name : #RPSGame2,
	#superclass : #RPSGame,
	#category : #Advent2022
}

{ #category : #accessing }
RPSGame2 >> beat: aMove [
	| d |
	d := Dictionary new.
	d at: 'rock' put: 'paper'.
	d at: 'paper' put: 'scissors'.
	d at: 'scissors' put: 'rock'.
	
	^ d at: aMove
]

{ #category : #accessing }
RPSGame2 >> findPlay [
	(strategy = 'X') ifTrue: [^ self lose: self play1Normal].
	(strategy = 'Y' ) ifTrue: [^ self play1Normal].
	(strategy = 'Z') ifTrue: [^ self beat: self play1Normal].
	
]

{ #category : #accessing }
RPSGame2 >> findPlayFor: aStrategy [
	| theirMove |
	theirMove := self play1Normal.
	(play2 = 'X') ifTrue: [^ self lose:theirMove ].
	(play2 = 'Y' ) ifTrue: [^ theirMove].
	(play2 = 'Z') ifTrue: [^ self beat: theirMove].
	
]

{ #category : #accessing }
RPSGame2 >> game: aCollection [
	self play1: aCollection first.
	self strategy: aCollection second.
	self play2: (self findPlayFor: strategy)
]

{ #category : #accessing }
RPSGame2 >> lose: aMove [ 
	| d |
	d := Dictionary new.
	d at: 'rock' put: 'scissors'.
	d at: 'paper' put: 'rock'.
	d at: 'scissors' put: 'paper'.
	
	^ d at: aMove
]

{ #category : #util }
RPSGame2 >> playStringfor: aString [
	"given aString make a sorted string that confirms to the winnerDict format"
	^ ({self play1Normal . aString} sorted ) joinUsing: ''
]

{ #category : #accessing }
RPSGame2 >> winner [
	| plays winner |
	plays := OrderedCollection new.
	plays add: self play1Normal.
	plays add: self play2Normal.
	(plays first = plays second) ifTrue: [^ 'draw'].
	winner := self winnerDict at: (plays sorted joinUsing: '').
	^ winner
]

{ #category : #accessing }
RPSGame2 >> winningMoveFor: playString move: aMove [
	| s |
	self winnerDict at: playString
	ifPresent: 
		[s := self winnerDict at: playString.
		^(playString removePrefix: s) removeSuffix: s]
	ifAbsent: [^ nil]


]

{ #category : #accessing }
RPSGame2 >> winningStrategy [
	"to win, find something in winnerDict"
	| strategies winnerString outcomes |
	strategies := OrderedCollection new.
	strategies add: (self playStringfor: 'rock').
	strategies add: (self playStringfor: 'paper').
	strategies add: (self playStringfor: 'scissors').
	
	outcomes := OrderedCollection new.
	outcomes add: (self winningMoveFor: (self playStringfor: 'rock') move: play1).
	outcomes add: (self winningMoveFor: (self playStringfor: 'paper') move: play1).
	outcomes add: (self winningMoveFor: (self playStringfor: 'scissors') move: play1).
	
	^ outcomes
	"winnerString := 'default'.
	
	^ strategies collect: [:p | self winningMoveFor: p ]."
	"^ winnerString"


]
