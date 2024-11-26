"
Browse all methods matching the selected string (case-insensitive).
"
Class {
	#name : 'StBrowseMethodsMatchingStringInsensitiveCommand',
	#superclass : 'StSystemSelectionCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseMethodsMatchingStringInsensitiveCommand class >> defaultDescription [

	^ 'Browse all methods containing a string matchign the selected string (case-sensitive)'
]

{ #category : 'default' }
StBrowseMethodsMatchingStringInsensitiveCommand class >> defaultName [

	^ 'Case insensitive method literal strings with it'
]

{ #category : 'defaults' }
StBrowseMethodsMatchingStringInsensitiveCommand class >> defaultShortcutKey [

	^ $e command shift mac
		| $e control shift win
		| $e control shift unix
]

{ #category : 'default' }
StBrowseMethodsMatchingStringInsensitiveCommand class >> shortName [

	^ nil "Do not use"
]

{ #category : 'executing' }
StBrowseMethodsMatchingStringInsensitiveCommand >> execute [

	self context doBrowseMethodsMatchingStringInsensitive
]
