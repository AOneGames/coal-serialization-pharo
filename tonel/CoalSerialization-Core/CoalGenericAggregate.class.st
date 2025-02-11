"
I am a generic coal aggregate object. I am used for parsing coal that does not have a correspondance with in system classes.
"
Class {
	#name : #CoalGenericAggregate,
	#superclass : #Object,
	#instVars : [
		'type',
		'slots'
	],
	#category : #'CoalSerialization-Core-Materialization'
}

{ #category : #converting }
CoalGenericAggregate >> asFieldNameValueAssociationList [
	| result slotIndex |
	result := Array new: slots size.
	slotIndex := 1.
	type allFieldsDo: [ :fieldDescription |
		result at: slotIndex put: (Association key: fieldDescription name value: (slots at: slotIndex)).
		slotIndex := slotIndex + 1
	].
	^ result
]

{ #category : #converting }
CoalGenericAggregate >> asFieldNameValueAssociationListForPrinting [
	^ self asFieldNameValueAssociationList collect: [ :each |
		each key -> each value asCoalGenericObjectForPrinting
	]
]

{ #category : #accessing }
CoalGenericAggregate >> at: fieldName [
	^ slots at: (type slotOfFieldNamed: fieldName)
]

{ #category : #printing }
CoalGenericAggregate >> printOn: aStream [
	super printOn: aStream.
	(type isNil or: [slots isNil]) ifTrue: [ ^ self ].
	self asFieldNameValueAssociationListForPrinting printOn: aStream
]

{ #category : #accessing }
CoalGenericAggregate >> slots [

	^ slots
]

{ #category : #accessing }
CoalGenericAggregate >> slots: anObject [

	slots := anObject
]

{ #category : #accessing }
CoalGenericAggregate >> type [

	^ type
]

{ #category : #accessing }
CoalGenericAggregate >> type: anObject [

	type := anObject
]

{ #category : #accessing }
CoalGenericAggregate >> value [
	^ self at: #value
]
