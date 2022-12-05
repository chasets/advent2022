Class {
	#name : #CalorieCounting,
	#superclass : #Object,
	#instVars : [
		'data',
		'elfData'
	],
	#category : #'Advent2022-Day 01'
}

{ #category : #accessing }
CalorieCounting >> data [
	^ data
]

{ #category : #example }
CalorieCounting >> data: aCollection [
	data := aCollection 
]

{ #category : #accessing }
CalorieCounting >> elfData [
	elfData := (data collect: [:i | i sum]) sorted.
	^ elfData
]

{ #category : #accessing }
CalorieCounting >> gtDetailsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Details';
		items: [ self metrics associations];
		column: 'Metric' text: #key;
		column: 'Value' text: #value
]

{ #category : #accessing }
CalorieCounting >> maxCalories [
	^ self elfData max.
]

{ #category : #accessing }
CalorieCounting >> metrics [
	| aDict |
	aDict := Dictionary new.
	aDict at: 'top3CaloriesTotal' put: self top3CaloriesTotal.
	aDict at: 'maxCalories' put: self maxCalories.
	^ aDict
]

{ #category : #accessing }
CalorieCounting >> top3CaloriesTotal [
	^ (self elfData last: 3) sum.
]
