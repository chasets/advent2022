Class {
	#name : #Rucksacks,
	#superclass : #AdventGroup,
	#category : #'Advent2022-Day 03'
}

{ #category : #accessing }
Rucksacks >> allBadges [
	^ (self split: (self items) by: 3) collect: [:i | self findBadgeInGroup: i]
]

{ #category : #accessing }
Rucksacks >> findBadgeInGroup: aCollection [
	"inject:into: keeps a running total. in this case it is the string that is continually reduced by the overlap with the previous string, seeded with the first one"
	^ (aCollection inject: aCollection first name into: [:prev :cur | prev select: [:i | cur name includes: i]]) asSet asOrderedCollection first
]

{ #category : #accessing }
Rucksacks >> items [
	items ifNil: [items := self rawData collect: [:each | Rucksack new rawData: each]].
	^ items
]

{ #category : #accessing }
Rucksacks >> metrics [
	| aDict |
	aDict := OrderedDictionary new.
	aDict at: 'Total Priority Score' put: self totalPriorityScore.
	aDict at: 'Total Badge Score' put: self totalBadgeScore.
	^ aDict
]

{ #category : #accessing }
Rucksacks >> scoreDict [
	| d |
	d := Dictionary new.
	($a to: $z) with: (1 to: 26) do: [:a :b | d at: a put: b].
	($A to: $Z) with: (27 to: 52) do: [:a :b | d at: a put: b].
	^ d
]

{ #category : #accessing }
Rucksacks >> split: aCollection by: anInteger [
	| indexString repeats groups d |
	repeats := anInteger.
	groups := (aCollection size // anInteger).
	"will be 111222333444"
	"when there were more than 9 groups, it didn't line up correctly, so I used asCharacterDigit. This would still overflow at some point"
	indexString := ((1 to: groups) collect: [:i | i asCharacterDigit asString repeat: repeats]) joinUsing: ''.
	d := OrderedDictionary new. 
	aCollection with: indexString do: [:element :index | 
	d at: index ifAbsentPut: OrderedCollection new.
	(d at: index) add: element].
	^ d asOrderedCollection
]

{ #category : #accessing }
Rucksacks >> totalBadgeScore [
	^ (self allBadges collect: [:i | self scoreDict at: i]) sum
]

{ #category : #accessing }
Rucksacks >> totalPriorityScore [
	^ (self items collect: #priorityScore) sum
]
