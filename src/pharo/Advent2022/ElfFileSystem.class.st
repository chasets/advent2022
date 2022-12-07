Class {
	#name : #ElfFileSystem,
	#superclass : #AdventGroup,
	#instVars : [
		'currentDir'
	],
	#category : #'Advent2022-Day 07'
}

{ #category : #accessing }
ElfFileSystem >> addDir: aElfDirectory at: aPath [
	| dir |
	dir := self fsFrom: aPath.
	dir add: aElfDirectory
]

{ #category : #accessing }
ElfFileSystem >> cd: aString [
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
ElfFileSystem >> fs [
	^ items first
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
ElfFileSystem >> initialize [
	items := OrderedCollection new.
	items add: (Dictionary new at: '/' put: (ElfDirectory new)).
	self currentDir: '/'.
]

{ #category : #accessing }
ElfFileSystem >> items [
	^ items
]
