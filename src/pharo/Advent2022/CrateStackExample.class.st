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
	rawData := ((self dataDir / filenameString) contents) trimBoth.
	chunks := rawData splitOn: '\n\n' asRegex.
	stacks := chunks first.
	moves := chunks second.
	^ {stacks . moves} asOrderedCollection
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
