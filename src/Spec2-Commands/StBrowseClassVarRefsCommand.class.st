"
My context is a class, I browse the class var refs of that class.
The system navigation is in charge of executing, and will ask the user to select a variable.
"
Class {
	#name : 'StBrowseClassVarRefsCommand',
	#superclass : 'StSystemNavigationCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseClassVarRefsCommand class >> defaultDescription [
	^ 'Browse the references to class variables'
]

{ #category : 'default' }
StBrowseClassVarRefsCommand class >> shortName [

	^ 'class variables reference'
]

{ #category : 'executing' }
StBrowseClassVarRefsCommand >> execute [	
	
	self systemNavigation browseClassVarRefs: self target
]
