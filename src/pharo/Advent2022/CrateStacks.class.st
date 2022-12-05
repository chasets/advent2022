Class {
	#name : #CrateStacks,
	#superclass : #AdventGroup,
	#instVars : [
		'stacks'
	],
	#category : #'Advent2022-Day 05'
}

{ #category : #accessing }
CrateStacks >> items [
	items ifNil: [items := self stacks collect: [:each | CrateStack new rawData: each ]].
	^ items
]

{ #category : #accessing }
CrateStacks >> makeStack: anInteger fromLines: listOfStrings [
	| stackLines rawStack stack |
	stackLines := listOfStrings. 
	rawStack := stackLines collect: [:line | self stackElement: anInteger forLine: line].
	stack := Stack new. 
	(rawStack reject: [:item | item = Character space]) 			
	reverse do: [:item | stack push: item].
	^ stack
]

{ #category : #accessing }
CrateStacks >> moveFrom: sourceStack to: targetStack [
	| item |
	item := (self stacks at: sourceStack) pop.
	(self stacks at: targetStack) push: item.
	
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
CrateStacks >> stackElement: anInteger forLine: aString [
	^ aString at: (  (anInteger - 1) * 4 + 2 )  
]

{ #category : #accessing }
CrateStacks >> stackTops [
	^ (self stacks collect: #first) joinUsing: ''
]

{ #category : #accessing }
CrateStacks >> stacks [
	stacks ifNil: [stacks := self stacksFromData].
	^ stacks
]

{ #category : #accessing }
CrateStacks >> stacksFromData [
	| rawStackLines stackLines stackNames maxStack rawStacks |
	rawStackLines := self rawData first lines.
	stackLines := rawStackLines allButLast.
	stackNames := rawStackLines last.
	maxStack := stackNames trim last asString asInteger.

	rawStacks := (1 to: maxStack) collect: [:i | 
		self makeStack: i fromLines: stackLines].

	^ rawStacks collect: [:rs | 
		| stack |
		stack := Stack new. 
		(rs reject: [:item | item = Character space])
		reverseDo: [:item | stack push: item].
		stack]
]
