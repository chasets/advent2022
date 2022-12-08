Class {
	#name : #ElfFile,
	#superclass : #AdventEntity,
	#category : #'Advent2022-Day 07'
}

{ #category : #accessing }
ElfFile >> data [
	^ (self rawData at: #contents) splitOn: ' '
]

{ #category : #accessing }
ElfFile >> fileSize [
	^ self data first asNumber
]

{ #category : #accessing }
ElfFile >> isDir [
	^false
]

{ #category : #accessing }
ElfFile >> isFile [
	^ true
]

{ #category : #accessing }
ElfFile >> metrics [
	| aDict |
	aDict := OrderedDictionary new.
	aDict at: 'File Size' put: (self fileSize ).
	^ aDict
]

{ #category : #accessing }
ElfFile >> name [
	^ self data second
]
