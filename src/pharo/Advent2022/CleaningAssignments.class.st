Class {
	#name : #CleaningAssignments,
	#superclass : #AdventGroup,
	#category : #Advent2022
}

{ #category : #accessing }
CleaningAssignments >> fullyContainedCount [
	^ (self items select: #fullyContained) size
]

{ #category : #accessing }
CleaningAssignments >> items [
	items ifNil: [items := self rawData collect: [:each | CleaningAssignment new rawData: each]].
	^ items
]

{ #category : #accessing }
CleaningAssignments >> metrics [
	| aDict |
	aDict := OrderedDictionary new.
	aDict at: 'Overlap Count' put: self overlapCount.
	aDict at: 'Fully Contained Count' put: self fullyContainedCount.
	^ aDict
	
]

{ #category : #accessing }
CleaningAssignments >> overlapCount [
	^ (self items select: #hasOverlaps) size
]
