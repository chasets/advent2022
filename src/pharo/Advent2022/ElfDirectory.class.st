Class {
	#name : #ElfDirectory,
	#superclass : #AdventGroup,
	#instVars : [
		'parent'
	],
	#category : #'Advent2022-Day 07'
}

{ #category : #accessing }
ElfDirectory >> addDir: aElfDirectory [
	items add: aElfDirectory
]

{ #category : #accessing }
ElfDirectory >> addDir: aElfDirectory withParent: aDirectory [
	items add: aElfDirectory.
	parent := aDirectory.
]

{ #category : #accessing }
ElfDirectory >> addFile: aElfFile [
	items add: aElfFile
]

{ #category : #accessing }
ElfDirectory >> addFileFromString: aString [
	items add: (ElfFile new rawData: aString)
]

{ #category : #accessing }
ElfDirectory >> collectSmallTotal: aDir [
	^ (aDir items select: #isDir)  collect: [:d | d collectSmallTotal: d items]
]

{ #category : #accessing }
ElfDirectory >> data [
	^ self rawData splitOn: ' '
]

{ #category : #accessing }
ElfDirectory >> dirSize [
	| dirs |
	items ifEmpty: [^ 0].
	dirs := (items select: #isDir) collect: #fileSize.
	^ dirs ifEmpty: [0] ifNotEmpty: #sum .
]

{ #category : #accessing }
ElfDirectory >> fileSize [
	| files |
	items ifEmpty: [^ 0].
	files := (items select: #isFile) collect: #fileSize.
	^ files ifEmpty: [0] ifNotEmpty: #sum .
]

{ #category : #accessing }
ElfDirectory >> initialize [
	items := OrderedCollection new
]

{ #category : #accessing }
ElfDirectory >> isDir [
	^ true
]

{ #category : #accessing }
ElfDirectory >> isFile [
	^ false
]

{ #category : #accessing }
ElfDirectory >> isSmall [
	^ self totalFileSize < 100000
]

{ #category : #accessing }
ElfDirectory >> items [
	^ items
]

{ #category : #accessing }
ElfDirectory >> metrics [
	| aDict |
	aDict := OrderedDictionary new.
	aDict at: 'Total File Size' put: (self totalFileSize ).
	aDict at: 'Small File Size' put: (self smallTotal ).
	^ aDict
]

{ #category : #accessing }
ElfDirectory >> name [
	^ self data second
]

{ #category : #accessing }
ElfDirectory >> parent [
	^ parent
]

{ #category : #accessing }
ElfDirectory >> parent: aElfDirectory [
	parent := aElfDirectory
]

{ #category : #accessing }
ElfDirectory >> printOn: aStream [
	| itemCount |
	itemCount := self rawData isEmptyOrNil 
					ifTrue: [0] 
					ifFalse: [self items size] .
	aStream nextPutAll: self name.
	aStream nextPut: $(.
	aStream nextPutAll: itemCount asString.
	aStream nextPut: $)
]

{ #category : #accessing }
ElfDirectory >> smallTotal [
	self isSmall ifTrue: [^ self totalFileSize].
	^ 0
]

{ #category : #accessing }
ElfDirectory >> totalFileSize [
	^ self fileSize + self dirSize
]
