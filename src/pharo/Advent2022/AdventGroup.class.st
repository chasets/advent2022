Class {
	#name : #AdventGroup,
	#superclass : #AdventObject,
	#traits : 'TGtGroup',
	#classTraits : 'TGtGroup classTrait',
	#instVars : [
		'items'
	],
	#category : #'Advent2022-Core'
}

{ #category : #accessing }
AdventGroup >> gtItemsFor: aView [
	<gtView>
	^ aView list 
		title: 'Items';
		priority: 10;
		items: [self items]
]

{ #category : #accessing }
AdventGroup >> gtRawDataFor: aView [
	<gtView>
	^ aView list
		title: 'Raw data';
		items: [ self rawData ]
]

{ #category : #accessing }
AdventGroup >> isEmptyOrNil [
	^ self isEmpty
]

{ #category : #accessing }
AdventGroup >> printOn: aStream [
	| itemCount |
	itemCount := self rawData isEmptyOrNil 
					ifTrue: [0] 
					ifFalse: [self items size] .
	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: itemCount asString.
	aStream nextPut: $)
]
