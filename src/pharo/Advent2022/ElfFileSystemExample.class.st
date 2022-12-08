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
ElfFileSystemExample >> dirExample3 [
	<gtExample>
	| data ed |
	data := 'dir /'.
	ed := ElfDirectory new rawData: data.
	ed addDir: self dirExample1.
"	self assert: ed totalFileSize = 24933642."
	^ ed
]

{ #category : #accessing }
ElfFileSystemExample >> fileExample1 [
	<gtExample>
	| data ef |
	data := '4060174 j'.
	ef := ElfFile new rawData: data.
	self assert: ef name = 'j'.
	self assert: ef fileSize = 4060174.
	^ ef
]

{ #category : #accessing }
ElfFileSystemExample >> fileExample2 [
	<gtExample>
	| data ef |
	data := '8033020 d.log'.
	ef := ElfFile new rawData: data.
	self assert: ef name = 'd.log'.
	self assert: ef fileSize = 8033020.
	^ ef
]

{ #category : #accessing }
ElfFileSystemExample >> fileSystemExample1 [
	<gtExample>
	| efs data |
	data := '$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d' lines.
	efs := ElfFileSystem new rawData: data; parse.
	"efs addDir: self dirExample1 at: '/'."
	"self assert: es signalStart = 7."
	^ efs
]
