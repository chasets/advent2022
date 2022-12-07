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
ElfFile >> metrics [
	| aDict |
	aDict := OrderedDictionary new.
	aDict at: 'File Size' put: (self size ).
	^ aDict
]

{ #category : #accessing }
ElfFile >> name [
	^ self data second
]

{ #category : #accessing }
ElfFile >> size [
	^ self data first asNumber
]
