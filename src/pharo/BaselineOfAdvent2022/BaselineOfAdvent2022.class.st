" version of baseline: with dependencies
BaselineOfTscGhUtils >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'TscGtUtils'
			with: [ 
			spec repository: 'github://chasets/gt-utils:main/pharo-src' ].

		spec
			package: 'TscGhUtils'
			with: [ spec requires: #( 'TscGtUtils' ) ] ]
]
"
Class {
	#name : #BaselineOfAdvent2022,
	#superclass : #BaselineOf,
	#category : #BaselineOfAdvent2022
}

{ #category : 'accessing' }
BaselineOfAdvent2022 class >> loadLepiter [
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase properties.
	currentProperties
		addRegisteredDirectory: FileLocator imageDirectory
			/ 'pharo-local'
			/ 'iceberg'
			/ 'chasets'
			/ 'advent2022'
			/ 'lepiter'.
	
	LeDatabasesRegistry default defaultLogicalDatabase reload.
]

{ #category : #baseline }
BaselineOfAdvent2022 >> baseline: spec [
	<baseline>
	spec
		for: #common do: [
			spec
				package: 'Advent2022' ]
]
