Class {
	#name : #Rucksacks,
	#superclass : #AdventGroup,
	#category : #Advent2022
}

{ #category : #accessing }
Rucksacks >> items [
	items ifNil: [items := self rawData collect: [:each | Rucksack new rawData: each]].
	^ items
]

{ #category : #accessing }
Rucksacks >> metrics [
	| aDict |
	aDict := OrderedDictionary new.
	aDict at: 'Priority Score' put: self totalPriorityScore.
	^ aDict
]

{ #category : #accessing }
Rucksacks >> totalPriorityScore [
	^ (self items collect: #priorityScore) sum
]
