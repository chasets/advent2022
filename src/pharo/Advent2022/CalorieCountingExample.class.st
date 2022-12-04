Class {
	#name : #CalorieCountingExample,
	#superclass : #Advent2020Example,
	#category : #'Advent2022-Example'
}

{ #category : #accessing }
CalorieCountingExample >> dayNum [
	^ 1
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

{ #category : #accessing }
CalorieCountingExample >> puzzle1Example [
	<gtExample>
	| cc |
	cc := CalorieCounting new data: self puzzle1Data.
	self assert: cc maxCalories = 70296.
	self assert: cc top3CaloriesTotal = 205381.
	^ cc
]
