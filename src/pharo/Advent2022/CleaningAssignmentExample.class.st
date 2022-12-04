Class {
	#name : #CleaningAssignmentExample,
	#superclass : #Advent2020Example,
	#category : #'Advent2022-Example'
}

{ #category : #accessing }
CleaningAssignmentExample >> dayNum [
	^ 4
]

{ #category : #accessing }
CleaningAssignmentExample >> pageExample [
	<gtExample>
	| cas |
	cas := CleaningAssignments new rawData: self pageExampleData.
	"self assert: cas overlapCount = 2."
	^ cas
]

{ #category : #accessing }
CleaningAssignmentExample >> puzzle1Example [
	<gtExample>
	| cas |
	cas := CleaningAssignments new rawData: self puzzle1Data.
	"self assert: cc top3CaloriesTotal = 205381."
	^ cas
]

{ #category : #accessing }
CleaningAssignmentExample >> singleExample1 [
	<gtExample>
	| data ca |
	data := '5-7,7-9'.
	ca := CleaningAssignment new rawData: data.
	self assert: (ca sectionsFrom: '5-7') = (5 to: 7) asOrderedCollection.
	self assert: ca overlappingAssignments = #(7) asOrderedCollection.
	"self assert: r priorityScore = 16."
	^ ca
]

{ #category : #accessing }
CleaningAssignmentExample >> singleExample2 [
	<gtExample>
	| data ca |
	data := '2-8,3-7'.
	ca := CleaningAssignment new rawData: data.
	self assert: (ca sectionsFrom: '2-8') = (2 to: 8) asOrderedCollection.
	self assert: ca overlappingAssignments = #(3 4 5 6 7) asOrderedCollection.
	"self assert: r priorityScore = 16."
	^ ca
]

{ #category : #accessing }
CleaningAssignmentExample >> singleExample3 [
	<gtExample>
	| data ca |
	data := '2-4,6-8'.
	ca := CleaningAssignment new rawData: data.
	self assert: ca overlappingAssignments = #() asOrderedCollection.
	"self assert: r priorityScore = 16."
	^ ca
]
