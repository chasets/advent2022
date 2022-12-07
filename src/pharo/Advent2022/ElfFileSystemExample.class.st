Class {
	#name : #ElfFileSystemExample,
	#superclass : #Advent2020Example,
	#category : #'Advent2022-Example'
}

{ #category : #accessing }
ElfFileSystemExample >> dayNum [
	^ 7
]

{ #category : #accessing }
ElfFileSystemExample >> dirExample1 [
	<gtExample>
	| data ed |
	data := 'dir d'.
	ed := ElfDirectory new rawData: data.
	ed addFile: (self fileExample1).
	ed addFile: (self fileExample2).
	ed addFileFromString: '5626152 d.ext'.
	ed addFileFromString: '7214296 k'.
	self assert: ed totalFileSize = 24933642.
	^ ed
]

{ #category : #accessing }
ElfFileSystemExample >> fileExample1 [
	<gtExample>
	| data ef |
	data := '4060174 j'.
	ef := ElfFile new rawData: data.
	self assert: ef name = 'j'.
	self assert: ef size = 4060174.
	^ ef
]

{ #category : #accessing }
ElfFileSystemExample >> fileExample2 [
	<gtExample>
	| data ef |
	data := '8033020 d.log'.
	ef := ElfFile new rawData: data.
	self assert: ef name = 'd.log'.
	self assert: ef size = 8033020.
	^ ef
]

{ #category : #accessing }
ElfFileSystemExample >> fileSustemExample1 [
	<gtExample>
	| data es |
	data := #('mjqjpqmgbljsphdztnvjfqwrcgsmlb').
	es := ElfSignal new rawData: data.
	self assert: es signalStart = 7.
	^ es
]
