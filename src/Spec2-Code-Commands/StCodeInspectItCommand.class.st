"
I'm an ""inspect it"" command. 
I will execute the selection (or line) of the playground and inspect the result.
"
Class {
	#name : 'StCodeInspectItCommand',
	#superclass : 'StCodeSelectionCommand',
	#category : 'Spec2-Code-Commands-Base',
	#package : 'Spec2-Code-Commands',
	#tag : 'Base'
}

{ #category : 'accessing' }
StCodeInspectItCommand class >> defaultDescription [

	^ 'Evaluate selection and inspect the result.'
]

{ #category : 'defaults' }
StCodeInspectItCommand class >> defaultIconName [

	^ #smallInspectIt
]

{ #category : 'default' }
StCodeInspectItCommand class >> defaultName [

	^ 'Inspect it'
]

{ #category : 'default' }
StCodeInspectItCommand class >> defaultShortcutKey [

	^ $i actionModifier
]

{ #category : 'documentation' }
StCodeInspectItCommand class >> documentContextRequiredSelectors [

	^ super documentContextRequiredSelectors, #(systemNavigation)
]

{ #category : 'execution' }
StCodeInspectItCommand >> execute [
	"Treat the current text selection as an expression; evaluate it."
	
	self evaluateSelectionAndDo: [ :result | 
		self inspectObject: result ]
]

{ #category : 'private - actions' }
StCodeInspectItCommand >> inspectObject: anObject [

	self context systemNavigation inspect: anObject
]
