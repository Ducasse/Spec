"
My context is a class, I browse the inst var refs of that class.
The system navigation is in charge of executing, and will ask the user to select a variable.
"
Class {
	#name : 'StBrowseInstVarRefsCommand',
	#superclass : 'StSystemNavigationCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseInstVarRefsCommand class >> defaultDescription [
	^ 'Browse the references to instance variables'
]

{ #category : 'default' }
StBrowseInstVarRefsCommand class >> shortName [

	^ 'instance variables reference'
]

{ #category : 'executing' }
StBrowseInstVarRefsCommand >> execute [	
	self systemNavigation browseInstVarRefs: self target
]
