"
My context is a class, I browse the class variables of that class.
"
Class {
	#name : 'StBrowseClassVariablesCommand',
	#superclass : 'StSystemNavigationCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseClassVariablesCommand class >> defaultDescription [
	^ 'Browse the class variables'
]

{ #category : 'default' }
StBrowseClassVariablesCommand class >> shortName [

	^ 'class variables'
]

{ #category : 'executing' }
StBrowseClassVariablesCommand >> execute [

	self systemNavigation browseClassVariables: self target
]
