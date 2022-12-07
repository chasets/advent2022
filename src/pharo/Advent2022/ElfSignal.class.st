Class {
	#name : #ElfSignal,
	#superclass : #AdventEntity,
	#category : #'Advent2022-Day 06'
}

{ #category : #accessing }
ElfSignal >> firstUnique [
]

{ #category : #accessing }
ElfSignal >> firstUniqueWindow [
	^ self windows detect: [:item | self isAllUnique: item].
]

{ #category : #accessing }
ElfSignal >> firstUniqueWindowStart [
	^ (self inputString) findString: (self firstUniqueWindow)
]

{ #category : #accessing }
ElfSignal >> inputString [
	^ (self rawData at: #contents) first
]

{ #category : #accessing }
ElfSignal >> isAllUnique: aString [
	| original unique |
	original := aString asOrderedCollection sorted.
	unique := original asSet asOrderedCollection sorted.
	^ original = unique
]

{ #category : #accessing }
ElfSignal >> metrics [
	| aDict |
	aDict := OrderedDictionary new.
	aDict at: 'Signal Start' put: (self signalStart ).
	^ aDict
]

{ #category : #accessing }
ElfSignal >> name [
	^ self inputString
]

{ #category : #accessing }
ElfSignal >> signalStart [
	^ self firstUniqueWindowStart + self windowSize - 1
]

{ #category : #accessing }
ElfSignal >> windowSize [
	^ 4
]

{ #category : #accessing }
ElfSignal >> windows [
	^ self windowsOn: (self inputString) withSize: (self windowSize)
]

{ #category : #accessing }
ElfSignal >> windowsOn: aString withSize: anInteger [
	| s windowSize starts |
	s := aString.
	windowSize := anInteger.
	starts := 1 to: s size - windowSize.

	^ starts collect: [:start | s copyFrom: start to: start + windowSize - 1]
]
