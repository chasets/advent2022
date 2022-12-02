Class {
	#name : #RPSGame,
	#superclass : #Object,
	#instVars : [
		'play1',
		'play2',
		'strategy'
	],
	#category : #Advent2022
}

{ #category : #setup }
RPSGame >> game: aCollection [
	self play1: aCollection first.
	self play2: aCollection second.
]

{ #category : #util }
RPSGame >> gameLog [
	| log winner |
	log := OrderedDictionary new.
	log at: 'Play 1' put: play1, ' = ', self play1Normal.
	log at: 'Play 2' put: play2, ' = ', self play2Normal.
	winner := self winner.
	log at: 'Winner' put: (self whois: (self winner)), ' = ', self winner.
	log at: 'Score' put: self score.
	^ log
]

{ #category : #accessing }
RPSGame >> gamePoints [
	^ self pointsDict at: self play2Normal
]

{ #category : #view }
RPSGame >> gtDetailsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Game Log';
		items: [ self gameLog associations];
		column: 'Event' text: #key;
		column: 'Value' text: #value
]

{ #category : #accessing }
RPSGame >> play1: aString [ 
	play1 := aString
]

{ #category : #accessing }
RPSGame >> play1Normal [
	| d |
	d := Dictionary new.
	d at: 'A' put: 'rock'.
	d at: 'B' put: 'paper'.
	d at: 'C' put: 'scissors'.
	^ d at: play1.
]

{ #category : #accessing }
RPSGame >> play2: aString [ 
	play2 := aString
]

{ #category : #accessing }
RPSGame >> play2Normal [
	| d |
	d := Dictionary new.
	d at: 'X' put: 'rock'.
	d at: 'Y' put: 'paper'.
	d at: 'Z' put: 'scissors'.
	^ d at: play2.
]

{ #category : #util }
RPSGame >> pointsDict [
	| d |
	d := Dictionary new.
	d at: 'rock' put: 1.
	d at: 'paper' put: 2.
	d at: 'scissors' put: 3.
	d at: 'draw' put: 0.
	^ d
]

{ #category : #accessing }
RPSGame >> score [
	^ self winnerPoints + self gamePoints
]

{ #category : #setup }
RPSGame >> strategy: anObject [ 
	strategy := anObject
]

{ #category : #util }
RPSGame >> whois: aPlay [
	(self play1Normal = self play2Normal) ifTrue: [^ 'draw'].
	(aPlay = self play1Normal) ifTrue: [^ play1].
	^ play2
]

{ #category : #accessing }
RPSGame >> winner [
	| plays winner |
	plays := OrderedCollection new.
	plays add: self play1Normal.
	plays add: self play2Normal.
	(plays first = plays second) ifTrue: [^ 'draw'].
	winner := self winnerDict at: (plays sorted joinUsing: '').
	^ winner
	
]

{ #category : #accessing }
RPSGame >> winnerDict [
	| d |
	d := Dictionary new.
	d at: 'paperrock' put: 'paper'.
	d at: 'rockscissors' put: 'rock'.
	d at: 'paperscissors' put: 'scissors'.
	^ d
]

{ #category : #accessing }
RPSGame >> winnerPoints [
	| winner |
	winner := self winner.
	(winner = 'draw') ifTrue: [^ 3].
	(play2 = (self whois:  winner)) ifTrue: [^ 6].
	^ 0.

]
