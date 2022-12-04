Class {
	#name : #RucksackExample,
	#superclass : #Advent2020Example,
	#category : #'Advent2022-Example'
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
	self assert: rs totalPriorityScore = 157.
	self assert: rs totalBadgeScore = 70.
	^ rs
]

{ #category : #accessing }
RucksackExample >> puzzel1Example [
	<gtExample>
	| data rs |
	data := self puzzle1Data.
	rs := Rucksacks new rawData: data.
	self assert: rs totalPriorityScore = 7742.
	self assert: rs totalBadgeScore = 2276.
	^ rs
]

{ #category : #accessing }
RucksackExample >> singleExample [
	<gtExample>
	| data r |
	data := 'vJrwpWtwJgWrhcsFMMfFFhFp'.
	r := Rucksack new rawData: data.
	self assert: r priorityScore = 16.
	^ r
]
