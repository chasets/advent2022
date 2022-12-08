Class {
	#name : #ElfFileSystem,
	#superclass : #AdventGroup,
	#instVars : [
		'currentDir',
		'currentLineNum',
		'finished'
	],
	#category : #'Advent2022-Day 07'
}

{ #category : #accessing }
ElfFileSystem >> cd [
	"cd is going to change currentDir"
	| cpl |
	cpl := self currentParsedLine. 
	(cpl at: 3) = '/' ifTrue: [^ items add: (ElfDirectory new rawData: 'dir /')].
	(cpl at: 3) = '..' ifTrue: [^ self currentDir: (self currentDir parent)].
	self currentDir: (self getDirNamed: (cpl at: 3)).
]

{ #category : #accessing }
ElfFileSystem >> currentDir [
	^ currentDir
]

{ #category : #accessing }
ElfFileSystem >> currentDir: aString [
	currentDir := aString
]

{ #category : #accessing }
ElfFileSystem >> currentLineNum [
	^ currentLineNum
]

{ #category : #accessing }
ElfFileSystem >> currentLineNum: anInteger [
	currentLineNum := anInteger
]

{ #category : #accessing }
ElfFileSystem >> currentParsedLine [
	| line |
	line := rawData at: currentLineNum.
	^ line splitOn: ' '.
]

{ #category : #accessing }
ElfFileSystem >> findNextCommandLine [
	| nextCommandText |
	nextCommandText := (self rawData allButFirst: self currentLineNum) detect: [:line | self isCommand: line]
	ifNone: [^ self rawData size + 1].
	^ self rawData indexOf: nextCommandText startingAt:  currentLineNum + 1.

]

{ #category : #accessing }
ElfFileSystem >> fsFrom: aPath [
	| path current |
	path := aPath asOrderedCollection.
	current := self fs.
	path do: [:k | current := current at: k].
	^ current
]

{ #category : #accessing }
ElfFileSystem >> getDirNamed: aString [
	^ self currentDir items detect: [:aDir | aDir name = aString]  
]

{ #category : #accessing }
ElfFileSystem >> initialize [
"	| data |"
	items := OrderedCollection new.
	finished := false.
	"
	data := {#contents -> 'dir /'} asDictionary.
	items add: (ElfDirectory new rawData: data).
	self currentDir: (items at: 1)"
]

{ #category : #accessing }
ElfFileSystem >> isCommand: aLine [
	^ (aLine splitOn: ' ' )= '$'
]

{ #category : #accessing }
ElfFileSystem >> items [
	^ items
]

{ #category : #accessing }
ElfFileSystem >> ls [
	| lines nextCommandLineNumber |
	nextCommandLineNumber := self findNextCommandLine.
	lines := self rawData copyFrom: (self currentLineNum) to: nextCommandLineNumber - 1.
	lines do: [:line | ((line splitOn: ' ') at: 1) = 'dir'
		ifTrue: [items add: (ElfDirectory new rawData: line)].
		items add: (ElfFile new rawData: line)].
	self currentLineNum: nextCommandLineNumber.
]

{ #category : #accessing }
ElfFileSystem >> parse [
	self currentLineNum:  1.
	[finished] whileFalse: [
		self processCurrentLine
	]
]

{ #category : #accessing }
ElfFileSystem >> processCurrentLine [
	| parsedLine n |
	n := self currentLineNum.
	n = self rawData size ifTrue: [finished := true].
	parsedLine := self currentParsedLine.
	(parsedLine at: 1) = '$' ifFalse: [self error: 'Current line does not begin with dollar sign'].
	self perform: (parsedLine at: 2) asSymbol.
	self currentLineNum: n + 1
]
