"
@@TODO

A simple playground would be defined as: 

[[[language=Smalltalk
SpCodeInteractionMode newForScripting.
]]]

A code editor on a method: 

[[[language=Smalltalk
SpCodeInteractionMode newForMethod: aMethod.
]]]l 
 
"
Class {
	#name : 'SpCodeInteractionModel',
	#superclass : 'Object',
	#instVars : [
		'owner'
	],
	#category : 'Spec2-Code-Base',
	#package : 'Spec2-Code',
	#tag : 'Base'
}

{ #category : 'accessing' }
SpCodeInteractionModel >> behavior [

	^ nil
]

{ #category : 'accessing' }
SpCodeInteractionModel >> bindings [

	"no additional bindings provided by the Requestor"

	^ #() asDictionary
]

{ #category : 'testing' }
SpCodeInteractionModel >> canAddBindingOf: name [
	^ false
]

{ #category : 'accessing' }
SpCodeInteractionModel >> compiler [
	"Provide a compiler set up on the current context/class/receiver"

	^ self doItReceiver class compiler
		context: self doItContext;
		receiver: self doItReceiver;
		isScripting: self isScripting;
		requestor: self;
		yourself
]

{ #category : 'accessing' }
SpCodeInteractionModel >> doItContext [

	^ nil
]

{ #category : 'accessing' }
SpCodeInteractionModel >> doItReceiver [

	^ nil
]

{ #category : 'testing' }
SpCodeInteractionModel >> hasBindingThatBeginsWith: aString [

	^ self variableBindingNames 
		anySatisfy: [ :each | each beginsWith: aString ]
]

{ #category : 'testing' }
SpCodeInteractionModel >> isScripting [

	^ false
]

{ #category : 'testing' }
SpCodeInteractionModel >> needRequestorScope [
	^false
]

{ #category : 'interactive error protocol' }
SpCodeInteractionModel >> notify: message at: location in: code [
	| currentSelection stripMessage |

	"self owner withAdapterDo: [ :anAdapter |
		anAdapter notify: message at: location in: code ]"

	stripMessage := (message endsWith: ' ->')
		ifTrue: [ message allButLast: 3 ]
		ifFalse: [ message ].

	currentSelection := self owner selectionInterval.
	self owner
		insertErrorPopover: (SpCodePopoverErrorPresenter
			newCode: self owner
			message: stripMessage)
		atIndex: (currentSelection isEmptyOrNil
			ifTrue: [ location ]
			ifFalse: [
				"both selection and location are 1-based, but position will be zero-based
				 (zero=first element), to actually arrive to the position I want I need to
				 substract two elements"
				currentSelection first + location - 2 ])
]

{ #category : 'accessing' }
SpCodeInteractionModel >> owner [

	^ owner
]

{ #category : 'accessing' }
SpCodeInteractionModel >> owner: aPresenter [

	owner := aPresenter
]

{ #category : 'accessing' }
SpCodeInteractionModel >> selectedBehavior [

	^ self behavior
]

{ #category : 'accessing' }
SpCodeInteractionModel >> selectedClass [

	^ self behavior
]

{ #category : 'accessing' }
SpCodeInteractionModel >> selectedClassOrMetaClass [

	^ self behavior
]

{ #category : 'accessing' }
SpCodeInteractionModel >> text [

	^ self owner text
]

{ #category : 'accessing' }
SpCodeInteractionModel >> variableBindingNames [
	
	^ self variableBindings keys
]

{ #category : 'accessing' }
SpCodeInteractionModel >> variableBindings [

	^ Dictionary new
]
