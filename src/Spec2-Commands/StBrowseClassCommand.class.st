"
I browse a class that is returned from the evaluation of my context.
My context must be a block that returns a class.
"
Class {
	#name : 'StBrowseClassCommand',
	#superclass : 'StSystemSelectionCommand',
	#instVars : [
		'selector'
	],
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseClassCommand class >> defaultDescription [
	^ 'Browse the selected class'
]

{ #category : 'default' }
StBrowseClassCommand class >> defaultShortcutKey [

	^ $b command mac 
		| $b control win
		| $b control unix
]

{ #category : 'default' }
StBrowseClassCommand class >> shortName [

	^ 'full class'
]

{ #category : 'execution' }
StBrowseClassCommand >> execute [

	self context perform: self selector
]

{ #category : 'accessing' }
StBrowseClassCommand >> selector [

	^ selector ifNil: [ #doBrowseClass ]
]

{ #category : 'accessing' }
StBrowseClassCommand >> selector: aSelector [

	selector := aSelector
]
