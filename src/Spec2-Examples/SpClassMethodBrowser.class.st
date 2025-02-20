"
A ClassMethodBrowser is a simple browser using spec and reusing MethodBrowser to browse classes>>methods>>sourceCode.

self example
"
Class {
	#name : 'SpClassMethodBrowser',
	#superclass : 'SpPresenter',
	#instVars : [
		'methodListPresenter',
		'textPresenter',
		'classListPresenter'
	],
	#category : 'Spec2-Examples-Standalone',
	#package : 'Spec2-Examples',
	#tag : 'Standalone'
}

{ #category : 'examples' }
SpClassMethodBrowser class >> example [

	<sampleInstance>
	| example |
	example := SpClassMethodBrowser new.
	example
		classes: self environment allClasses;
		open.
	^ example
]

{ #category : 'api' }
SpClassMethodBrowser >> classes: aList [
	classListPresenter items = aList ifTrue: [ ^ self ].

	classListPresenter
		items: aList;
		selectIndex: 1
]

{ #category : 'initialization' }
SpClassMethodBrowser >> connectPresenters [
	classListPresenter
		transmitTo: methodListPresenter
		transform: [ :class | class ifNil: [ #() ] ifNotNil: [ class methods sort: #selector descending ] ]
		postTransmission: [ :destination | destination selectIndex: 1 ].
		
	methodListPresenter
		transmitTo: textPresenter
		transform: [ :method | method ifNil: [ '' ] ifNotNil: #sourceCode ]
		postTransmission: [ :destination :origin :transmited | 
			transmited ifNotNil: [ destination beForMethod: transmited ] ]
]

{ #category : 'layout' }
SpClassMethodBrowser >> defaultLayout [

	^ SpPanedLayout newTopToBottom
		add: (SpPanedLayout newLeftToRight
			add: classListPresenter;
			add: methodListPresenter;
			yourself);
		add: textPresenter;
		yourself
]

{ #category : 'initialization' }
SpClassMethodBrowser >> initializePresenters [
	classListPresenter := self newList.
	methodListPresenter := self newList.
	textPresenter := self newCode.
	textPresenter whenSubmitDo: [ :text | self systemNavigation inspect: methodListPresenter selectedItem ].
	methodListPresenter display: #selector.
	self focusOrder
		add: classListPresenter;
		add: methodListPresenter;
		add: textPresenter
]

{ #category : 'initialization' }
SpClassMethodBrowser >> windowTitle [ 

	^ 'Class Method Browser'
]
