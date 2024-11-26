"
Browse all implementors of the selector found in context.
"
Class {
	#name : 'StBrowseImplementorsCommand',
	#superclass : 'StSystemSelectionCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseImplementorsCommand class >> defaultDescription [
	^ 'Browse all implementors of the selected method or message'
]

{ #category : 'accessing' }
StBrowseImplementorsCommand class >> defaultName [

	^ 'Implementors of it'
]

{ #category : 'default' }
StBrowseImplementorsCommand class >> defaultShortcutKey [

	^ $m command mac 
		| $m control win
		| $m control unix
]

{ #category : 'default' }
StBrowseImplementorsCommand class >> shortName [

	^ 'implementors'
]

{ #category : 'executing' }
StBrowseImplementorsCommand >> execute [

	self context doBrowseImplementors
]
