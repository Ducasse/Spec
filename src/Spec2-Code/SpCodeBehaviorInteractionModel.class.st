Class {
	#name : 'SpCodeBehaviorInteractionModel',
	#superclass : 'SpCodeInteractionModel',
	#instVars : [
		'behavior'
	],
	#category : 'Spec2-Code-Base',
	#package : 'Spec2-Code',
	#tag : 'Base'
}

{ #category : 'instance creation' }
SpCodeBehaviorInteractionModel class >> on: aBehavior [

	^ self new behavior: aBehavior
]

{ #category : 'accessing' }
SpCodeBehaviorInteractionModel >> behavior [

	^ behavior
]

{ #category : 'accessing' }
SpCodeBehaviorInteractionModel >> behavior: anObject [
	behavior := anObject
]

{ #category : 'binding' }
SpCodeBehaviorInteractionModel >> bindingOf: aString [

	^ self behavior bindingOf: aString
]

{ #category : 'accessing' }
SpCodeBehaviorInteractionModel >> compiler [

	^ super compiler
		class: self behavior;
		yourself
]

{ #category : 'testing' }
SpCodeBehaviorInteractionModel >> hasBindingOf: aString [

	^ self behavior hasBindingOf: aString
]
