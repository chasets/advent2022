Class {
	#name : #RPSGameExample,
	#superclass : #Advent2020Example,
	#category : #'Advent2022-Example'
}

{ #category : #accessing }
RPSGameExample >> dayNum [
	^ 2
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
RPSGameExample >> pageExample2 [
	<gtExample>
	| data rps |
	data := self pageExampleData.
	rps := RPSGames2 new rawGames: data; games.
	self assert: rps totalScore = 12.
	^ rps
]

{ #category : #accessing }
RPSGameExample >> puzzle1Example [
	<gtExample>
	| data rps |
	data := self puzzle1Data.
	rps := RPSGames new rawGames: data; games.
	self assert: rps totalScore = 14827.
	^ rps
]

{ #category : #accessing }
RPSGameExample >> puzzle1Example2 [
	<gtExample>
	| data rps |
	data := self puzzle1Data.
	rps := RPSGames2 new rawGames: data; games.
	self assert: rps totalScore = 13889.
	^ rps
]
