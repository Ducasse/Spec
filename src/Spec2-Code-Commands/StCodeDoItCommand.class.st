"
I'm a ""do it"" command. 
I will execute the selection (or line) of the playground.
"
Class {
	#name : 'StCodeDoItCommand',
	#superclass : 'StCodeSelectionCommand',
	#category : 'Spec2-Code-Commands-Base',
	#package : 'Spec2-Code-Commands',
	#tag : 'Base'
}

{ #category : 'accessing' }
StCodeDoItCommand class >> defaultDescription [ 

	^ 'Evaluate selection.'
]

{ #category : 'default' }
StCodeDoItCommand class >> defaultIconName [

	^ #smallDoIt
]

{ #category : 'default' }
StCodeDoItCommand class >> defaultName [

	^ 'Do it'
]

{ #category : 'default' }
StCodeDoItCommand class >> defaultShortcutKey [

	^ $d actionModifier
]

{ #category : 'accessing' }
StCodeDoItCommand class >> order [

	^ 10
]

{ #category : 'execution' }
StCodeDoItCommand >> execute [
	"Treat the current text selection as an expression; evaluate it."
	
	self evaluateSelectionAndDo: [ :result | ]
]
