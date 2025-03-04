Class {
	#name : 'SpAbstractTextPresenterTest',
	#superclass : 'SpSmokeTest',
	#category : 'Spec2-Tests-Core-Widgets',
	#package : 'Spec2-Tests',
	#tag : 'Core-Widgets'
}

{ #category : 'testing' }
SpAbstractTextPresenterTest class >> isAbstract [
	^ self = SpAbstractTextPresenterTest
]

{ #category : 'accessing' }
SpAbstractTextPresenterTest >> classToTest [
	^ self subclassResponsibility
]

{ #category : 'initialization' }
SpAbstractTextPresenterTest >> initializationText [
	presenter text: 'Text for tests.'
]

{ #category : 'tests - actions' }
SpAbstractTextPresenterTest >> testAddAction [

	presenter addAction: (SpAction new
		name: 'test menu';
		action: [ ];
		yourself).

	self assert: presenter actions notNil.
	self assert: presenter actions allCommands isNotEmpty.
	self assert: (presenter actions allCommands anySatisfy: [ :each | each name = 'test menu' ]).
]

{ #category : 'tests - actions' }
SpAbstractTextPresenterTest >> testAddActionWith [

	presenter addActionWith: [ :action | action
		name: 'test menu';
		action: [ ] ].

	self assert: presenter actions notNil.
	self assert: presenter actions allCommands isNotEmpty.
	self assert: (presenter actions allCommands anySatisfy: [ :each | each name = 'test menu' ]).
]

{ #category : 'tests - actions' }
SpAbstractTextPresenterTest >> testAddShortcut [

	presenter addAction: (SpAction new
		beShortcutOnly;
		shortcutKey: $x ctrl;
		action: [ ];
		yourself).

	self assert: presenter actions notNil.
	self assert: presenter actions allCommands isNotEmpty.
	self assert: (presenter actions allCommands anySatisfy: [ :each | 
		each shortcutKey = $x ctrl ])
]

{ #category : 'tests - actions' }
SpAbstractTextPresenterTest >> testAddShortcutWith [

	presenter addShortcutWith: [ :action | action
		shortcutKey: $x ctrl;
		action: [ ] ].

	self assert: presenter actions notNil.
	self assert: presenter actions allCommands isNotEmpty.
	self assert: (presenter actions allCommands anySatisfy: [ :each | 
		each shortcutKey = $x ctrl ]).
]

{ #category : 'tests' }
SpAbstractTextPresenterTest >> testClearContent [
	self initializationText.
	self denyEmpty: presenter text.
	presenter clearContent.
	self assertEmpty: presenter text
]

{ #category : 'tests' }
SpAbstractTextPresenterTest >> testClearSelection [
	self initializationText.
	self openInstance.
	presenter selectionInterval: (1 to: 10).
	self assert: presenter selectionInterval equals: (1 to: 10).
	presenter clearSelection.
	self assert: presenter selectionInterval isEmpty
]

{ #category : 'tests' }
SpAbstractTextPresenterTest >> testContextMenu [
	| menu changed |
	
	self assert: presenter contextMenu isNil.
	menu := SpMenuPresenter new.
	changed := false.
	presenter whenMenuChangedDo: [ 
		changed := true. ].
	presenter contextMenu: menu.
	self assert: presenter contextMenu equals: menu.
	self assert: changed
]

{ #category : 'tests' }
SpAbstractTextPresenterTest >> testCursorPositionIndex [

	presenter text: (String loremIpsum: 80).
	self openInstance. "cursor position does not works if instance is not opened"
	"If not defined, cursor is at the end of a "	
	self assert: presenter cursorPositionIndex equals: 81.
	"middle"
	presenter cursorPositionIndex: 20.
	self assert: presenter cursorPositionIndex equals: 20.
	"end"
	presenter cursorPositionIndex: 81.
	self assert: presenter cursorPositionIndex equals: 81
]

{ #category : 'tests' }
SpAbstractTextPresenterTest >> testPlaceholderIsSet [

	presenter placeholder: 'enter something...'.
	
	self assert: presenter placeholder equals: 'enter something...'
]

{ #category : 'tests' }
SpAbstractTextPresenterTest >> testSelectAll [

	self initializationText.
	"We should try to do the selectAll before opening the instance to be sure it will be taken into account."

	presenter selectAll.
	self openInstance.
	
	self assert: presenter selectionInterval equals: (1 to: 15)
]

{ #category : 'tests' }
SpAbstractTextPresenterTest >> testSelectAllAfterOpening [

	self initializationText.
	self openInstance.
	
	presenter selectAll.
	
	self assert: presenter selectionInterval equals: (1 to: 15)
]

{ #category : 'tests' }
SpAbstractTextPresenterTest >> testSelectAllWithoutOpening [

	self initializationText.
	presenter selectAll.
	
	self assert: presenter selectionInterval equals: (1 to: 15)
]

{ #category : 'tests' }
SpAbstractTextPresenterTest >> testTextIsSetAndCursorPositionedCorrectly [

	presenter text: 'aText'.
	"no cursor position before is open"
	self assert: presenter cursorPositionIndex equals: nil.	
	self openInstance.
	"now it has to be placed at the end"
	self assert: presenter cursorPositionIndex equals: 6.
	"now change it already opened"
	presenter text: 'aTextAText'. 
	self assert: presenter cursorPositionIndex equals: 11
]

{ #category : 'tests' }
SpAbstractTextPresenterTest >> testWhenResetDo [
	| reseted |

	reseted := false.
	presenter whenResetDo: [ :aString | reseted := true ].
	
	self openInstance.
	
	self textInputAdapter
		keyDown: $l 
		shift: false
		meta: true 
		control: false 
		option: false.
		
	self assert: reseted
]

{ #category : 'tests' }
SpAbstractTextPresenterTest >> testWhenSubmitDo [
	| submitted |

	submitted := false.
	presenter whenSubmitDo: [ :aString | submitted := true ].
	
	self openInstance.
	
	self textInputAdapter
		keyDown: $s 
		shift: false
		meta: true 
		control: false 
		option: false.
		
	self assert: submitted
]

{ #category : 'tests' }
SpAbstractTextPresenterTest >> testWhenSubmitDoReceivesAString [
	| submitted |

	submitted := false.
	presenter whenSubmitDo: [ :aString | submitted := aString ].
	
	self openInstance.
	
	presenter type: 'abc'.
	
	self textInputAdapter
		keyDown: $s 
		shift: false
		meta: true 
		control: false 
		option: false.
		
	self assert: submitted equals: 'abc'
]

{ #category : 'private' }
SpAbstractTextPresenterTest >> textInputAdapter [
	
	^ presenter adapter
]
