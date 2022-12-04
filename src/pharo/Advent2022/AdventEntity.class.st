Class {
	#name : #AdventEntity,
	#superclass : #AdventObject,
	#category : #Advent2022
}

{ #category : #accessing }
AdventEntity >> <= other [
	^ self name <= other name
]

{ #category : #accessing }
AdventEntity >> gtDetailsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Details';
		priority: 10;
		items: [self rawData associations];
		column: 'Key' text: #key;
		column: 'Value' text: #value.
]

{ #category : #accessing }
AdventEntity >> gtRawDataFor: aView [
	<gtView>
	^ aView columnedList 
		title: 'Raw data';
		priority: 60;
		items: [ self rawData isDictionary 
			ifTrue: [ self rawData associations sorted: [:a :b | a key < b key ] ]
			ifFalse: [ self rawData ] ];
		column: 'Property' text: #key; 
		column: 'Value' text: #value
]

{ #category : #accessing }
AdventEntity >> name [
	^ self subclassResponsibility
]

{ #category : #accessing }
AdventEntity >> printOn: aStream [
	aStream nextPutAll: self name.
]

{ #category : #accessing }
AdventEntity >> rawData: anObject [
	rawData := {#contents -> anObject} asDictionary
]
