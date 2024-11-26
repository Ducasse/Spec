"
My subclasses implement commands related to system navigation.
I give a selector from a context that must:
- be a block
- evaluate to a string or symbol
"
Class {
	#name : 'StSystemNavigationCommand',
	#superclass : 'StToolCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StSystemNavigationCommand class >> defaultIconName [
	^#smallSystemBrowser 
]

{ #category : 'default' }
StSystemNavigationCommand class >> defaultName [
	^'Browse ', self shortName 
]

{ #category : 'documentation' }
StSystemNavigationCommand class >> documentContextRequiredSelectors [
	"Using a String and not a Symbol because `RBBrowserEnvironmentTest>>#testMatches` fails 
	 if answering a symbol (because it detects the referenced selector)"

	^ #('environment')
]

{ #category : 'default' }
StSystemNavigationCommand class >> shortName [
	^self subclassResponsibility 
]

{ #category : 'accessing' }
StSystemNavigationCommand >> environment [

	^ self context environment
]

{ #category : 'accessing' }
StSystemNavigationCommand >> selector [

	^ self target trimBoth asSymbol
]

{ #category : 'accessing' }
StSystemNavigationCommand >> systemNavigation [

	^ self context systemNavigation
		environment: self environment;
		yourself
]
