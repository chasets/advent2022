Class {
	#name : #CrateStackExample,
	#superclass : #Advent2020Example,
	#category : #'Advent2022-Example'
}

{ #category : #accessing }
CrateStackExample >> dayNum [
	^ 5
]

{ #category : #accessing }
CrateStackExample >> getDataFor: filenameString [
	| rawData chunks stacks moves |
	rawData := ((self dataDir / filenameString) contents).
	chunks := rawData splitOn: '\n\n' asRegex.
	stacks := chunks first.
	moves := chunks second.
	^ {stacks . moves} asOrderedCollection
]

{ #category : #accessing }
CrateStackExample >> moveItemExample [
	<gtExample>
	| data css data1Stack data2Stack actual1 actual2 |
	data := self pageExampleData.
	css := CrateStacks new rawData: data.
	data1Stack := Stack new push: $Z; push: $N; push: $D; yourself.
	data2Stack := Stack new push: $M; push: $C; yourself.
	actual1 := css stacks at: 1.
	actual2 := css stacks at: 2.
	css moveFrom: 2 to: 1.
	self assert: actual1 = data1Stack.
	self assert: actual2 = data2Stack.
	^ css
]

{ #category : #accessing }
CrateStackExample >> pageExample [
	<gtExample>
	| data css |
	data := self pageExampleData.
	css := CrateStacks new rawData: data.
	"self assert: rps totalScore = 15."
	^ css
]

{ #category : #accessing }
CrateStackExample >> puzzle1Example [
	<gtExample>
	| data css |
	data := self puzzle1Data.
	css := CrateStacks new rawData: data.
	"self assert: rps totalScore = 14827."
	^ css
]

{ #category : #accessing }
CrateStackExample >> stackParserExample1 [
	<gtExample>
	| data css |
	data := '[Z] [M] [P] [X] [Y]'.
	css := CrateStacks new.
	self assert: (css stackElement: 1 forLine: data) = $Z.
	self assert: (css stackElement: 5 forLine: data) = $Y.
	^ css
]

{ #category : #accessing }
CrateStackExample >> stackParserExample2 [
	<gtExample>
	| data css data1Stack data2Stack actual1 actual2 |
	data := '    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 '.
 	data1Stack := Stack new push: $Z; push: $N; yourself.
 	data2Stack := Stack new push: $M; push: $C; push: $D; yourself.
 	
 	css := CrateStacks new.
 	actual1 := css makeStack: 1 fromLines: data lines allButLast.
 	actual2 := css makeStack: 2 fromLines: data lines allButLast.
	 self assert: actual1 = data1Stack.
	 self assert: actual2 = data2Stack.
	 ^ css

]
