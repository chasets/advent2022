Class {
	#name : #CrateStacks,
	#superclass : #AdventGroup,
	#category : #'Advent2022-Day 05'
}

{ #category : #accessing }
CrateStacks >> items [
	^ rawData
]

{ #category : #accessing }
CrateStacks >> moves [
	| rawMoves |
	rawMoves := self rawData second.
	^ rawMoves lines 
	collect: [:line |
		| d lineColl|
		d := Dictionary new.
		lineColl := line splitOn: '\s' asRegex.
		d at: #moveNumber put: lineColl second.
		d at: #sourceStack put: lineColl fourth.
		d at: #targetStack put: lineColl sixth.
		d]
]

{ #category : #accessing }
CrateStacks >> stacks [
	| rawStacks |
	rawStacks := self rawData first.
	^ rawStacks lines allButLast 
		collect: [:line | 
			(line splitOn: '] [') collect: [:i | ((i trim) removePrefix: '[') removeSuffix: ']']]
]
