Class {
	#name : #Rucksack,
	#superclass : #AdventEntity,
	#category : #Advent2022
}

{ #category : #accessing }
Rucksack >> commonItems [
	| first second |
	first := self compartments first.
	second := self compartments second.
	^ (first select: [:i | second includes: i]) asOrderedCollection
]

{ #category : #accessing }
Rucksack >> compartments [
	| contents halfSize firstHalf |
	contents := rawData at: #contents.
	halfSize := contents size / 2. "what if it isn't even?"
	firstHalf := contents first: halfSize.
	^ {firstHalf . contents removePrefix: firstHalf}
]

{ #category : #accessing }
Rucksack >> metrics [
	| aDict |
	aDict := OrderedDictionary new.
	aDict at: 'Compartments' put: (self compartments joinUsing: ' - ').
	aDict at: 'Priority Score' put: self priorityScore.
	aDict at: 'Common Items' put: (self commonItems joinUsing: '').
	^ aDict
]

{ #category : #accessing }
Rucksack >> name [
	^ rawData at: #contents
]

{ #category : #accessing }
Rucksack >> priorityScore [
	^ (self commonItems collect: [:i | self scoreItem: i]) sum
]

{ #category : #accessing }
Rucksack >> scoreDict [
	| d |
	d := Dictionary new.
	($a to: $z) with: (1 to: 26) do: [:a :b | d at: a put: b].
	($A to: $Z) with: (27 to: 52) do: [:a :b | d at: a put: b].
	^ d
]

{ #category : #accessing }
Rucksack >> scoreItem: aCharacter [
	^ self scoreDict at: aCharacter
]
