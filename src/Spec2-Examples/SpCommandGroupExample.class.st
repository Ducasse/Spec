"
I am an example presenter to show how commands can be used as the basis for adding a menubar and a toolbar.
"
Class {
	#name : 'SpCommandGroupExample',
	#superclass : 'SpPresenter',
	#instVars : [
		'menuBar',
		'toolBar',
		'list'
	],
	#category : 'Spec2-Examples-Demo-CommandGroup',
	#package : 'Spec2-Examples',
	#tag : 'Demo-CommandGroup'
}

{ #category : 'commands' }
SpCommandGroupExample class >> buildCommandsGroupWith: presenter forRoot: rootCommandGroup [

	rootCommandGroup
		register: (self buildMenuBarGroupWith: presenter);
		register: (self buildToolBarGroupWith: presenter);
		register: (self buildListMenuWith: presenter)
]

{ #category : 'commands' }
SpCommandGroupExample class >> buildListMenuWith: presenter [

	^ (CmCommandGroup named: 'List') asSpecGroup
		beRoot;
		register: (SpExampleNewCommand forSpec context: presenter);
		yourself
]

{ #category : 'commands' }
SpCommandGroupExample class >> buildMenuBarGroupWith: presenter [

	^ (CmCommandGroup named: 'MenuBar') asSpecGroup
		beRoot;
		register: (self buildMenuWith: presenter);
		yourself
]

{ #category : 'commands' }
SpCommandGroupExample class >> buildMenuWith: presenter [

	^ (CmCommandGroup named: 'Menu') asSpecGroup
		register: (SpExampleNewCommand forSpec context: presenter);
		yourself
]

{ #category : 'commands' }
SpCommandGroupExample class >> buildToolBarGroupWith: presenter [

	^ (CmCommandGroup named: 'ToolBar') asSpecGroup
		beRoot;
		register: (SpExampleNewCommand forSpec context: presenter);
		yourself
]

{ #category : 'accessing' }
SpCommandGroupExample class >> defaultPreferredExtent [

	^ 600@300
]

{ #category : 'examples' }
SpCommandGroupExample class >> example [
	"This example opens a presenter with a menubar and a toolbar created from commands."

	^ self new open
]

{ #category : 'layout' }
SpCommandGroupExample >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: list;
		yourself
]

{ #category : 'initialization' }
SpCommandGroupExample >> initializeList [

	| contextMenu |
	list := self newList.
	contextMenu := self newMenu.
	contextMenu fillWith: self rootCommandsGroup / 'List'.
	list contextMenu: contextMenu
]

{ #category : 'initialization' }
SpCommandGroupExample >> initializeMenuBar [

	menuBar := self newMenuBar.
	menuBar fillWith: self rootCommandsGroup / 'MenuBar'
]

{ #category : 'initialization' }
SpCommandGroupExample >> initializePresenters [

	super initializePresenters.
	self initializeList.
	self initializeMenuBar.
	self initializeToolBar
]

{ #category : 'initialization' }
SpCommandGroupExample >> initializeToolBar [

	toolBar := self newToolbar.
	toolBar fillWith: self rootCommandsGroup / 'ToolBar'
]

{ #category : 'initialization' }
SpCommandGroupExample >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		menu: menuBar;
		toolbar: toolBar
]

{ #category : 'initialization' }
SpCommandGroupExample >> windowTitle [ 
	^ 'Example with context menu, menubar and toolbar based on commands'
]
