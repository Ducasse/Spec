"
I browse all methods containing a string returned by the computed context.
"
Class {
	#name : 'StBrowseMethodsContainingStringCommand',
	#superclass : 'StSystemSelectionCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseMethodsContainingStringCommand class >> defaultDescription [

	^ 'Browse all methods containing the selected string'
]

{ #category : 'default' }
StBrowseMethodsContainingStringCommand class >> defaultName [

	^ 'Method source with it'
]

{ #category : 'default' }
StBrowseMethodsContainingStringCommand class >> shortName [

	^ 'methods containing string'
]

{ #category : 'executing' }
StBrowseMethodsContainingStringCommand >> execute [

	self context doBrowseMethodsContainingString
]
