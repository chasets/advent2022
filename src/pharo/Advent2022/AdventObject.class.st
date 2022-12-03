Class {
	#name : #AdventObject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #Advent2022
}

{ #category : #accessing }
AdventObject >> gtMetricsFor: aView [
	<gtView>
	^ aView columnedList
		priority: 20;
		title: 'Metrics';
		items: [ self metrics associations];
		column: 'Metric' text: #key;
		column: 'Value' text: #value
]

{ #category : #accessing }
AdventObject >> metrics [
	"you probably want to override this"
	^ {#message -> 'no metrics yet'} asDictionary
]

{ #category : #accessing }
AdventObject >> rawData [
	^ rawData
]

{ #category : #accessing }
AdventObject >> rawData: anObject [
	rawData := anObject
]
