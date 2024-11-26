"
I'm a ""print it"" command. 
I will evalute the selection (or line) of the playground and print the result as string
"
Class {
	#name : 'StCodePrintItCommand',
	#superclass : 'StCodeSelectionCommand',
	#category : 'Spec2-Code-Commands-Base',
	#package : 'Spec2-Code-Commands',
	#tag : 'Base'
}

{ #category : 'accessing' }
StCodePrintItCommand class >> defaultDescription [

	^ 'Evaluate selection and print the result.'
]

{ #category : 'default' }
StCodePrintItCommand class >> defaultIconName [

	^ #smallPrintIt
]

{ #category : 'default' }
StCodePrintItCommand class >> defaultName [

	^ 'Print it'
]

{ #category : 'default' }
StCodePrintItCommand class >> defaultShortcutKey [

	^ $p actionModifier
]

{ #category : 'execution' }
StCodePrintItCommand >> execute [
	"Treat the current text selection as an expression; evaluate it. Insert the 
	description of the result of evaluation after the selection and then make 
	this description the new text selection."

	self evaluateSelectionAndDo: [ :result | 
		self printObject: result ]
]

{ #category : 'private' }
StCodePrintItCommand >> printObject: anObject [

	self context insertPrintPopoverAfterCurrentSelection: anObject
]

{ #category : 'private' }
StCodePrintItCommand >> toPrintableString: printString [

	self flag: #TODO. "This is maybe not the best? 
	I think I need to add a popover, but that then means I need to 
	have a special way to handle this special 'insertion' (to transmit the correct insertion 
	to the presenter's adapter)."
	^ String streamContents: [ :stream |
		stream << ' ' << printString  ]
]
