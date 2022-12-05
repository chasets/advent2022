Class {
	#name : #CrateStack,
	#superclass : #AdventEntity,
	#instVars : [
		'stack'
	],
	#category : #'Advent2022-Day 05'
}

{ #category : #accessing }
CrateStack >> metrics [
	| aDict |
	aDict := OrderedDictionary new.
	aDict at: 'Current Stack' put: (self stack ).
	^ aDict
]

{ #category : #accessing }
CrateStack >> name [
	^ self stack asString
]

{ #category : #accessing }
CrateStack >> stack [
	^ self rawData at: #contents
]
