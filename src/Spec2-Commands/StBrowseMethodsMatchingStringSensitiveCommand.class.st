"
Browse all methods matching the selected string (case-sensitive).
"
Class {
	#name : 'StBrowseMethodsMatchingStringSensitiveCommand',
	#superclass : 'StSystemSelectionCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseMethodsMatchingStringSensitiveCommand class >> defaultDescription [
	^ 'Browse all methods containing a string matchign the selected string (case-sensitive)'
]

{ #category : 'default' }
StBrowseMethodsMatchingStringSensitiveCommand class >> defaultName [

	^ 'Case sensitive method literal strings with it'
]

{ #category : 'defaults' }
StBrowseMethodsMatchingStringSensitiveCommand class >> defaultShortcutKey [

	^ $u command shift mac
		| $u control shift win
		| $u control shift unix
]

{ #category : 'default' }
StBrowseMethodsMatchingStringSensitiveCommand class >> shortName [

	^ 'methods literal strings (case-sensitive)'
]

{ #category : 'executing' }
StBrowseMethodsMatchingStringSensitiveCommand >> execute [

	self context doBrowseMethodsMatchingStringSensitive
]
