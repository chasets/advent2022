Class {
	#name : #CalorieCountingExample,
	#superclass : #Object,
	#category : #Advent2022
}

{ #category : #setup }
CalorieCountingExample >> dataDir [
	^ self repo location / 'data' / 'day_01'
]

{ #category : #accessing }
CalorieCountingExample >> getDataFor: filenameString [
	| rawData |
	rawData := ((self dataDir / filenameString) contents) trimBoth.
	^ (rawData splitOn: '\n\n' asRegex) 
	collect: [:i | (i splitOn: '\s' asRegex) collect: #asInteger]
]

{ #category : #example }
CalorieCountingExample >> pageExample [
	<gtExample>
	| cc |
	cc := CalorieCounting new data: self pageExampleData.
	self assert: cc maxCalories = 24000.
	self assert: cc top3CaloriesTotal = 45000.
	^ cc
	
	
]

{ #category : #setup }
CalorieCountingExample >> pageExampleData [
	^ self getDataFor: 'data_1.txt'
]

{ #category : #accessing }
CalorieCountingExample >> puzzle1Data [
	^ self getDataFor: 'puzzle_1.txt'
]

{ #category : #accessing }
CalorieCountingExample >> puzzle1Example [
	<gtExample>
	| cc |
	cc := CalorieCounting new data: self puzzle1Data.
	self assert: cc maxCalories > 0.
	self assert: cc top3CaloriesTotal > 0.
	^ cc
]

{ #category : #setup }
CalorieCountingExample >> repo [
	^ IceRepository repositories detect: [:i | i name = 'advent2022']
]
