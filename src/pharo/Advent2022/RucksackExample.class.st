Class {
	#name : #RucksackExample,
	#superclass : #Advent2020Example,
	#category : #Advent2022
}

{ #category : #accessing }
RucksackExample >> dayNum [
	^ 3
]

{ #category : #accessing }
RucksackExample >> pageExample [
	<gtExample>
	| data rs |
	data := self pageExampleData.
	rs := Rucksacks new rawData: data.
	"self assert: rs totalPriorityScore = 157."
	^ rs
]

{ #category : #accessing }
RucksackExample >> puzzel1Example [
]

{ #category : #accessing }
RucksackExample >> singleExample [
	<gtExample>
	| data r |
	data := {#contents -> 'vJrwpWtwJgWrhcsFMMfFFhFp'} asDictionary.
	r := Rucksack new rawData: data.
	self assert: r priorityScore = 16.
	^ r
]
