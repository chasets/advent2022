Class {
	#name : #CalorieCountingExample,
	#superclass : #Object,
	#category : #Advent2022
}

{ #category : #setup }
CalorieCountingExample >> dataDir [
	^ self repo location / 'data' / 'day_01'
]

{ #category : #example }
CalorieCountingExample >> pageExample [
	<gtExample>
	| cc |
	cc := CalorieCounting new data: self pageExampleData.
	self assert: cc maxCalories = 24000.
	^ cc
	
	
]

{ #category : #setup }
CalorieCountingExample >> pageExampleData [
	| rawData |
	rawData := ((self dataDir / 'data_1.txt') contents) trimBoth.
	^ (rawData splitOn: '\n\n' asRegex) 
	collect: [:i | (i splitOn: '\s' asRegex) collect: #asInteger]
]

{ #category : #accessing }
CalorieCountingExample >> puzzle1Example [
	<gtExample>
	| cc |
	cc := CalorieCounting new data: self puzzle1Data.
	self assert: cc maxCalories = 24000.
	^ cc
]

{ #category : #setup }
CalorieCountingExample >> repo [
	^ IceRepository repositories detect: [:i | i name = 'advent2022']
]
