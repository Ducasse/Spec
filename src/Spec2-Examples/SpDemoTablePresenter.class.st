"
Description
--------------------

I show demos of tables
"
Class {
	#name : 'SpDemoTablePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'table1',
		'label',
		'selectedClasses'
	],
	#category : 'Spec2-Examples-Demo-Tables',
	#package : 'Spec2-Examples',
	#tag : 'Demo-Tables'
}

{ #category : 'layout' }
SpDemoTablePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: table1;
		add: label expand: false;
		yourself
]

{ #category : 'initialization' }
SpDemoTablePresenter >> initialize [

	selectedClasses := OrderedCollection
		                   with: SpDemoTablePage
		                   with: SpPresenter
		                   with: Abort.
	super initialize
]

{ #category : 'initialization' }
SpDemoTablePresenter >> initializePresenters [
	table1 := self newTable.
	label := self newLabel.

	self resetLabel.

	table1
		addColumn:
			((SpCheckBoxTableColumn title: ' ' evaluated: [ :class | selectedClasses includes: class ])
				onActivation: [ :class | 
					selectedClasses add: class.
					self resetLabel ];
				onDeactivation: [ :class | 
					selectedClasses remove: class.
					self resetLabel ];
				width: 20;
				yourself);
		addColumn:
			((SpImageTableColumn 
				title: 'Icon' 
				evaluated: [ :aClass | self iconNamed: aClass systemIconName ])
				width: 50;
				yourself);
		addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		addColumn: (SpStringTableColumn 
			title: 'Number of subclasses' 
			evaluated: [ :class | class subclasses size asString ]);
		items: self class environment allClasses;
		beResizable
]

{ #category : 'initialization' }
SpDemoTablePresenter >> resetLabel [
	label label: (selectedClasses ifEmpty: [ 'No class checked' ] ifNotEmpty: [ (selectedClasses collect: #printString) joinUsing: ' - '])
]
