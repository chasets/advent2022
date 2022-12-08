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
	(cpl at: 3) = '/' ifTrue: [items add: (ElfDirectory new rawData: 'dir /'). 
							   self currentDir: (items at: 1). ^ self incr].
	(cpl at: 3) = '..' ifTrue: [self currentDir: (self currentDir parent). ^ self incr].
	self currentDir: (self getDirNamed: (cpl at: 3)).
	self incr
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
	currentLineNum := anInteger.
	anInteger >= self rawData size ifTrue: [finished := true].
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
ElfFileSystem >> incr [
	self currentLineNum: (self currentLineNum + 1)
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
	lines := self rawData copyFrom: (self currentLineNum + 1) to: nextCommandLineNumber - 1.
	lines do: [:line | ((line splitOn: ' ') at: 1) = 'dir'
		ifTrue: [self currentDir addDir: (ElfDirectory new rawData: line)]
		ifFalse: [self currentDir addFile: (ElfFile new rawData: line)]].
	self currentLineNum: nextCommandLineNumber.
]

{ #category : #accessing }
ElfFileSystem >> metrics [
	| aDict |
	aDict := OrderedDictionary new.
	aDict at: 'Total File Size' put: (self totalFileSize ).
	^ aDict
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
	| parsedLine |
	self currentLineNum >= self rawData size ifTrue: [finished := true].
	parsedLine := self currentParsedLine.
	(parsedLine at: 1) = '$' ifFalse: [self error: 'Current line does not begin with dollar sign'].
	self perform: (parsedLine at: 2) asSymbol.
]

{ #category : #accessing }
ElfFileSystem >> totalFileSize [
	^ (items collect: #totalFileSize) sum
]
