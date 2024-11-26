"
I browse all references to the computed context that is transformed to a symbol.
"
Class {
	#name : 'StBrowseMethodReferencesCommand',
	#superclass : 'StSystemSelectionCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseMethodReferencesCommand class >> defaultDescription [

	^ 'Browse all references to the selected method or selector'
]

{ #category : 'default' }
StBrowseMethodReferencesCommand class >> defaultName [ 

	^ 'References to it'
]

{ #category : 'default' }
StBrowseMethodReferencesCommand class >> defaultShortcutKey [

	^ $n command shift mac 
		| $n control shift win
		| $n control shift unix
]

{ #category : 'default' }
StBrowseMethodReferencesCommand class >> shortName [

	^ 'references'
]

{ #category : 'executing' }
StBrowseMethodReferencesCommand >> execute [

	self context doBrowseMethodReferences
]
