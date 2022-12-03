Class {
	#name : #AdventObject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #Advent2022
}

{ #category : #accessing }
AdventObject >> rawData [
	^ rawData
]

{ #category : #accessing }
AdventObject >> rawData: anObject [
	rawData := anObject
]
