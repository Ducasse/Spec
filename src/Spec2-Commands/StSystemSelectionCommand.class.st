"
A base for commands working on current text selection.
"
Class {
	#name : 'StSystemSelectionCommand',
	#superclass : 'StSystemNavigationCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'documentation' }
StSystemSelectionCommand class >> documentContextRequiredSelectors [

	^ super documentContextRequiredSelectors, #(selectedTextOrLine)
]

{ #category : 'private' }
StSystemSelectionCommand >> evaluate: aString ifError: aBlock [

	^ [
		self class compilerClass new
			environment: self environment;
			class: UndefinedObject;
			source: self selectedTextOrLine;
			evaluate ]
		on: Error 
		do: aBlock
	
]

{ #category : 'private' }
StSystemSelectionCommand >> selectedSelector [
	| node selection |
	
	selection := self selectedTextOrLine.
	node := RBParser parseFaultyExpression: selection.
	node nodesDo: [ :n | 
		n isMessage ifTrue: [ ^ n selector ].
		n isVariable ifTrue: [ ^ n name ].
		n isLiteralNode ifTrue: [ ^ n value ] ].
	"fall back"
	^ selection trimmed asSymbol
]

{ #category : 'accessing' }
StSystemSelectionCommand >> selectedTextOrLine [

	^ self context selectedTextOrLine
]
