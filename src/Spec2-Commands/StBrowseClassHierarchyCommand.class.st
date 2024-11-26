"
My context must evaluate to a Behavior. I then browse the hierarchy of that behavior.
"
Class {
	#name : 'StBrowseClassHierarchyCommand',
	#superclass : 'StSystemSelectionCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseClassHierarchyCommand class >> defaultDescription [
	^ 'Browse the class hierarchy of the selected class'
]

{ #category : 'default' }
StBrowseClassHierarchyCommand class >> shortName [

	^ 'class hierarchy'
]

{ #category : 'executing' }
StBrowseClassHierarchyCommand >> execute [

	self context doBrowseHierarchy
]
