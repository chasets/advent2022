Class {
	#name : #ElfDirectory,
	#superclass : #AdventGroup,
	#category : #'Advent2022-Day 07'
}

{ #category : #accessing }
ElfDirectory >> addDir: aElfDirectory [
	items add: aElfDirectory
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
ElfDirectory >> data [
	^ (self rawData at: #contents) splitOn: ' '
]

{ #category : #accessing }
ElfDirectory >> initialize [
	items := OrderedCollection new
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
	^ aDict
]

{ #category : #accessing }
ElfDirectory >> name [
	^ self data second
]

{ #category : #accessing }
ElfDirectory >> totalFileSize [
	^ (items collect: #size) sum
]
