"
I'm a code presenter command who's actions depends on the selected text.
In case no text is selected, the commands will take the text from cursor position to begining of line as an ""ad hoc"" selection.

""context"" needs to conform a certain api to be used here: 

- selectedText
- selectedTextOrLine
- doItReceiver
- doItContext
"
Class {
	#name : 'StCodeSelectionCommand',
	#superclass : 'StToolCommand',
	#category : 'Spec2-Code-Commands-Base',
	#package : 'Spec2-Code-Commands',
	#tag : 'Base'
}

{ #category : 'accessing' }
StCodeSelectionCommand class >> allOrdered [

	^ self allSubclasses sorted: #order ascending
]

{ #category : 'documentation' }
StCodeSelectionCommand class >> documentContextRequiredSelectors [

	^ super documentContextRequiredSelectors, #(selectedTextOrLine)
]

{ #category : 'accessing' }
StCodeSelectionCommand class >> order [
	"At last by default"
	^ 999
]

{ #category : 'converting' }
StCodeSelectionCommand >> asSpecCommand [

	^ SpToolCurrentApplicationCommand decorate: super asSpecCommand
]

{ #category : 'private' }
StCodeSelectionCommand >> compile: aStream for: anObject in: evalContext [

	| methodClass |
	methodClass := evalContext
		               ifNil: [ anObject class ]
		               ifNotNil: [ evalContext methodClass ].

	^ context class compiler
		  source: aStream;
		  class: methodClass;
		  context: evalContext;
		  requestor: context; "it should enable a visibility of current tool variables in new debugger"
		  isScripting: true;
		  failBlock: [ ^ nil ];
		  compile
]

{ #category : 'private' }
StCodeSelectionCommand >> evaluate: aString andDo: aBlock [
	"Treat the current selection as an expression; evaluate it and invoke 
	 aBlock with the result."

	aBlock value: (self context 
		evaluate: aString
		onCompileError: [ ^ self ]
		onError: [ :e | e pass ]).
]

{ #category : 'private' }
StCodeSelectionCommand >> evaluateSelectionAndDo: aBlock [
	"Treat the current selection as an expression; evaluate it and invoke aBlock with the result.
	If no selection is present select the current line."
	| selection |
	
	selection := self selectedTextOrLine.
	selection ifEmpty: [ ^ '' ].
	
	^ self 
		evaluate: selection 
		andDo: aBlock
]

{ #category : 'accessing' }
StCodeSelectionCommand >> selectedTextOrLine [

	^ self context selectedTextOrLine
]
