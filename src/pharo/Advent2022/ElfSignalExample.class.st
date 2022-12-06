Class {
	#name : #ElfSignalExample,
	#superclass : #Advent2020Example,
	#category : #'Advent2022-Example'
}

{ #category : #accessing }
ElfSignalExample >> dayNum [
	^ 6
]

{ #category : #accessing }
ElfSignalExample >> example1 [
	<gtExample>
	| data es |
	data := #('mjqjpqmgbljsphdztnvjfqwrcgsmlb').
	es := ElfSignal new rawData: data.
	self assert: es signalStart = 7.
	^ es
]

{ #category : #accessing }
ElfSignalExample >> example2 [
	<gtExample>
	| data es |
	data := #('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw').
	es := ElfSignal new rawData: data.
	self assert: es signalStart = 11.
	^ es
]

{ #category : #accessing }
ElfSignalExample >> page2Example [
	<gtExample>
	| data es |
	data := #('mjqjpqmgbljsphdztnvjfqwrcgsmlb').
	es := ElfSignal2 new rawData: data.
	self assert: es signalStart = 19.
	^ es



]

{ #category : #accessing }
ElfSignalExample >> pageExample [
	<gtExample>
	| data es |
	data := self pageExampleData.
	es := ElfSignal new rawData: data.
	self assert: es signalStart = 10.
	^ es
]

{ #category : #accessing }
ElfSignalExample >> puzzle1Example [
	<gtExample>
	| data es |
	data := self puzzle1Data.
	es := ElfSignal new rawData: data.
	self assert: es signalStart = 1198.
	^ es
]

{ #category : #accessing }
ElfSignalExample >> puzzle2Example [
	<gtExample>
	| data es |
	data := self puzzle1Data.
	es := ElfSignal2 new rawData: data.
	self assert: es signalStart = 3120.
	^ es
]
