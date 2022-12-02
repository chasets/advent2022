Class {
	#name : #Advent2020Example,
	#superclass : #Object,
	#category : #Advent2022
}

{ #category : #accessing }
Advent2020Example >> dataDir [
	| dayPart |
	dayPart := self dayNum printPaddedWith: $0 to: 2.
	^ self repo location / 'data' / ('day_', dayPart).
]

{ #category : #accessing }
Advent2020Example >> dayNum [
	"the day of the advent"
	self subclassResponsibility
]

{ #category : #accessing }
Advent2020Example >> getDataFor: filenameString [
	| rawData |
	rawData := ((self dataDir / filenameString) contents) trimBoth.
	^ rawData lines collect: [:i | (i splitOn: '\s' asRegex)]
]

{ #category : #accessing }
Advent2020Example >> pageExampleData [
	^ self getDataFor: 'data_1.txt'
]

{ #category : #accessing }
Advent2020Example >> puzzle1Data [
	^ self getDataFor: 'puzzle_1.txt'
]

{ #category : #accessing }
Advent2020Example >> repo [
	^ IceRepository repositories detect: [:i | i name = 'advent2022']
]
