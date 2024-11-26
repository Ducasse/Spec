"
Browse all references to the class returned by the evaluation of the context.
"
Class {
	#name : 'StBrowseClassReferencesCommand',
	#superclass : 'StSystemSelectionCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseClassReferencesCommand class >> defaultDescription [
	^ 'Browse all references to the receiver''s class'
]

{ #category : 'default' }
StBrowseClassReferencesCommand class >> shortName [

	^ 'class references'
]

{ #category : 'execution' }
StBrowseClassReferencesCommand >> execute [

	self context doBrowseClassReferences
]
