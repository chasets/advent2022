Class {
	#name : #CleaningAssignment,
	#superclass : #AdventEntity,
	#category : #'Advent2022-Day 04'
}

{ #category : #accessing }
CleaningAssignment >> assignments [
	| rawIntervals |
	rawIntervals := (self rawData at: #contents) splitOn: ','.
	^ rawIntervals collect: [:i | self sectionsFrom: i]
]

{ #category : #accessing }
CleaningAssignment >> assignmentsString [
	^ (self assignments collect: [:i | i joinUsing: ',']) joinUsing: ' : '
]

{ #category : #accessing }
CleaningAssignment >> fullyContained [
	| overlap first second |
	overlap := self overlappingAssignments.
	first := self assignments first.
	second := self assignments second.
	^ overlap = first or: [overlap = second ]
]

{ #category : #accessing }
CleaningAssignment >> hasOverlaps [
	^ self overlappingAssignments size > 0
]

{ #category : #accessing }
CleaningAssignment >> metrics [
	| aDict |
	aDict := OrderedDictionary new.
	aDict at: 'Assignments' put: (self assignmentsString ).
	aDict at: 'Overlapping Assignments' put: (self overlappingAssignments).
	aDict at: 'Has Overlaps' put: (self hasOverlaps).
	^ aDict
]

{ #category : #accessing }
CleaningAssignment >> name [
	^ self overlappingAssignments size asString, ' overlaps - fullyContained: ', self fullyContained asString
]

{ #category : #accessing }
CleaningAssignment >> overlappingAssignments [
	"inject:into: keeps a running total. in this case it is the string that is continually reduced by the overlap with the previous string, seeded with the first one"
	| aCollection |
	aCollection := self assignments.
	"^ (aCollection inject: aCollection first into: [:prev :cur | prev select: [:i | cur includes: i]]) asSet asOrderedCollection first"
	^ aCollection first select: [:i | aCollection second includes: i]
	
]

{ #category : #accessing }
CleaningAssignment >> sectionsFrom: aRangeString [
	| coll |
	coll := aRangeString splitOn: '-'.
	^ (coll first asInteger to: coll second asInteger) asOrderedCollection
]
