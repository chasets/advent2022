Class {
	#name : #CrateStack,
	#superclass : #AdventEntity,
	#category : #'Advent2022-Day 05'
}

{ #category : #accessing }
CrateStack >> name [
	^ self stack asString
]

{ #category : #accessing }
CrateStack >> stack [
	^ rawData at: #contents
]
