Class {
	#name : #CalorieCounting,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #Advent2022
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
CalorieCounting >> maxCalories [
	^ (data collect: [:i | i sum]) max
]
