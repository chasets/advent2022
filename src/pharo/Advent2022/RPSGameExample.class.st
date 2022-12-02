Class {
	#name : #RPSGameExample,
	#superclass : #Object,
	#category : #Advent2022
}

{ #category : #accessing }
RPSGameExample >> dataDir [
	^ self repo location / 'data' / 'day_02'
]

{ #category : #accessing }
RPSGameExample >> getDataFor: filenameString [
	| rawData |
	rawData := ((self dataDir / filenameString) contents) trimBoth.
	^ rawData lines collect: [:i | (i splitOn: '\s' asRegex)]
]

{ #category : #accessing }
RPSGameExample >> pageExample [
	<gtExample>
	| data rps |
	data := self pageExampleData.
	rps := RPSGames new rawGames: data; games.
	self assert: rps totalScore = 15.
	^ rps
]

{ #category : #accessing }
RPSGameExample >> pageExampleData [
	^ self getDataFor: 'data_1.txt'
]

{ #category : #accessing }
RPSGameExample >> puzzle1Data [
	^ self getDataFor: 'puzzle_1.txt'
]

{ #category : #accessing }
RPSGameExample >> puzzle1Example [
	<gtExample>
	| cc |
	cc := CalorieCounting new data: self puzzle1Data.
	self assert: cc maxCalories > 0.
	self assert: cc top3CaloriesTotal > 0.
	^ cc
]

{ #category : #accessing }
RPSGameExample >> repo [
	^ IceRepository repositories detect: [:i | i name = 'advent2022']
]
