"
I browse the inheritance of a method - my context must evaluate to a method.
"
Class {
	#name : 'StBrowseMethodInheritanceCommand',
	#superclass : 'StSystemNavigationCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseMethodInheritanceCommand class >> defaultDescription [
	^ 'Browse the hierarchy implementors of the selected method'
]

{ #category : 'default' }
StBrowseMethodInheritanceCommand class >> shortName [

	^ 'method inheritance'
]

{ #category : 'executing' }
StBrowseMethodInheritanceCommand >> execute [
	self systemNavigation
		methodHierarchyBrowserForClass: self target methodClass
		selector: self target selector
]
