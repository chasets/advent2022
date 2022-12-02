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
RPSGame2 >> game: aCollection [
	self play1: aCollection first.
	self strategy: aCollection second.
	self play2: (self findPlay)
]

{ #category : #accessing }
RPSGame2 >> gameLog [
	| gl |
	gl := super gameLog.
	gl at: 'Strategy' put: strategy, ' - ', self strategyNormal.
	^ gl
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

{ #category : #accessing }
RPSGame2 >> play2Normal [
	^ play2
]

{ #category : #accessing }
RPSGame2 >> strategyNormal [
	| d |
	d := Dictionary new.
	d at: 'X' put: 'lose'.
	d at: 'Y' put: 'draw'.
	d at: 'Z' put: 'win'.
	^ d at: strategy
]
