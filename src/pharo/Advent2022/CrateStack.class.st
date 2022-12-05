Class {
	#name : #CrateStack,
	#superclass : #AdventEntity,
	#instVars : [
		'stack',
		'moves'
	],
	#category : #'Advent2022-Day 05'
}

{ #category : #accessing }
CrateStack >> name [
	^ self stack asString
]

{ #category : #accessing }
CrateStack >> stack [
	^ self rawData at: #contents
]
