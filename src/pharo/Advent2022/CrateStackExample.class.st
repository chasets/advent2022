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
	css moveAll.
	self assert: css stackTops = 'CMZ'.
	^ css
]

{ #category : #accessing }
CrateStackExample >> pageExample2 [
	<gtExample>
	| data css |
	data := self pageExampleData.
	css := CrateStacks new rawData: data.
	css moveAll2.
	self assert: css stackTops = 'MCD'.
	^ css
]

{ #category : #accessing }
CrateStackExample >> puzzle1Example [
	<gtExample>
	| data css |
	data := self puzzle1Data.
	css := CrateStacks new rawData: data.
	css moveAll.
	self assert: css stackTops = 'SPFMVDTZT'.
	^ css
]

{ #category : #accessing }
CrateStackExample >> puzzle1Example2 [
	<gtExample>
	| data css |
	data := self puzzle1Data.
	css := CrateStacks new rawData: data.
	css moveAll2.
	self assert: css stackTops = 'ZFSJBPRFP'.
	^ css
]

{ #category : #accessing }
CrateStackExample >> stackMove2a [
	<gtExample>
	| css data1Stack data2Stack actual1 result1Stack moveDict data |
 	data1Stack := Stack new push: $Z; push: $N; yourself.
 	data2Stack := Stack new push: $M; push: $C; push: $D; yourself.
 	result1Stack := Stack new push: $Z; push: $N; push: $D; yourself.
 	
 	data := self pageExampleData.
	 css := CrateStacks new rawData: data.
 	moveDict := {#moveNumber -> 1. #sourceStack -> 2. #targetStack -> 1} asDictionary.
 	css movesFromDict2: moveDict.
 	actual1 := css stacks at: (moveDict at: #targetStack).
	 self assert: actual1 = result1Stack.
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
