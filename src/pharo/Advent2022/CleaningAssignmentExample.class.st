Class {
	#name : #CleaningAssignmentExample,
	#superclass : #Advent2020Example,
	#category : #'Advent2022-Example'
}

{ #category : #accessing }
CleaningAssignmentExample >> dayNum [
	^ 1
]

{ #category : #accessing }
CleaningAssignmentExample >> pageExample [
	<gtExample>
	| cas |
	cas := CleaningAssignments new rawData: self pageExampleData.
	"self assert: cc maxCalories = 24000."
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
	data := 'vJrwpWtwJgWrhcsFMMfFFhFp'.
	ca := CleaningAssignment new rawData: data.
	"self assert: r priorityScore = 16."
	^ ca
]

{ #category : #accessing }
CleaningAssignmentExample >> singleExample2 [
		<gtExample>
	| data ca |
	data := 'vJrwpWtwJgWrhcsFMMfFFhFp'.
	ca := CleaningAssignment new rawData: data.
	"self assert: r priorityScore = 16."
	^ ca
]
