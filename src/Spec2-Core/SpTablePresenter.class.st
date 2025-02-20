"
A presenter for a table.
A table has columns with a type (See column types section).
 
**IMPORTANT:** A table presenter does not contain other presenters. Instead, it maps the model provided (See `SpAbstractListPresenter>>#items:`) with the columns defined. If you need this behavior, you will need to use `SpComponentListPresenter`.

"
Class {
	#name : 'SpTablePresenter',
	#superclass : 'SpAbstractListPresenter',
	#instVars : [
		'#columns => ObservableSlot',
		'#showColumnHeaders => ObservableSlot',
		'#isResizable => ObservableSlot'
	],
	#category : 'Spec2-Core-Widgets-Table',
	#package : 'Spec2-Core',
	#tag : 'Widgets-Table'
}

{ #category : 'specs' }
SpTablePresenter class >> adapterName [

	^ #TableAdapter
]

{ #category : 'documentation' }
SpTablePresenter class >> addDocumentExtraSections: aBuilder [

	aBuilder newLine.
	aBuilder header: [ :builder | builder text: 'Column types' ] withLevel: 2.
	aBuilder unorderedListDuring: [ 
		(SpTableColumn allSubclasses sorted: #name ascending) do: [ :eachType | 
			aBuilder item: [
				aBuilder monospace: eachType name ] ] ]
]

{ #category : 'documentation' }
SpTablePresenter class >> documentFactoryMethodSelector [

	^ #newTable
]

{ #category : 'api' }
SpTablePresenter >> addColumn: aColumn [
	"Add a column to the table. A column should be an instance of `SpTableColumn`"

	columns := columns copyWith: aColumn
]

{ #category : 'api' }
SpTablePresenter >> addColumns: aCollection [
	"Add a list of columns.
	 `aCollection` is a list of instances of `SpTableColumn`"

	aCollection do: [ :each | self addColumn: each ]
]

{ #category : 'api' }
SpTablePresenter >> alternateRowsColor [
	" Will alternate Rows color for a better reading: one row lighter, the next row darker"
	self withAdapterPerformOrDefer: [ :tableAdapter | tableAdapter alternateRowsColor ].
]

{ #category : 'api' }
SpTablePresenter >> beNotResizable [
	"Mark the table as 'not resizable', which means there will be not possibility to resize the 
	 columns of it."
	
	self isResizable: false
]

{ #category : 'api' }
SpTablePresenter >> beResizable [
	"Mark the table as 'resizable', which means there will be a slider to resize the columns."

	self isResizable: true
]

{ #category : 'simulation' }
SpTablePresenter >> clickOnColumnHeaderAt: anIndex [
	self withAdapterDo: [ :tableAdapter | tableAdapter clickOnColumnHeaderAt: anIndex ]
]

{ #category : 'api' }
SpTablePresenter >> columns [
	"Answer the columns composing this table."

	^ columns
]

{ #category : 'api' }
SpTablePresenter >> columns: aCollection [
	"Set all columns at once. 
	 `aCollection` is a list of instances of `SpTableColumn`"

	columns := aCollection
]

{ #category : 'api' }
SpTablePresenter >> hideColumnHeaders [
	"Hide the column headers"

	showColumnHeaders := false
]

{ #category : 'initialization' }
SpTablePresenter >> initialize [ 

	super initialize.
	self enableSearch.
	showColumnHeaders := true.
	columns := #().
	isResizable := false
]

{ #category : 'testing' }
SpTablePresenter >> isResizable [
	"Answer true if table allows resizing of its columns."

	^ isResizable
]

{ #category : 'private' }
SpTablePresenter >> isResizable: aBoolean [
	isResizable := aBoolean
]

{ #category : 'testing' }
SpTablePresenter >> isShowingColumnHeaders [
	"Answer true if the table is configured to show column headers."

	^ showColumnHeaders
]

{ #category : 'api' }
SpTablePresenter >> removeColumn: aColumn [
	"Remove a column from the table. A column should be an instance of `SpTableColumn`"

	columns := columns copyWithout: aColumn
]

{ #category : 'api' }
SpTablePresenter >> showColumnHeaders [
	"Show column headers"

	showColumnHeaders := true
]

{ #category : 'private' }
SpTablePresenter >> valueAtColumn: aColumn row: aRow [

	^ (columns at: aColumn) readObject: (self model items at: aRow)
]

{ #category : 'api - events' }
SpTablePresenter >> whenColumnsChangedDo: aBlock [
	"Inform when columns have changed. 
	 `aBlock` has three optional arguments: 
	 - new value
	 - old value
	 - the announcement triggering this action"	
	
	self property: #columns whenChangedDo: aBlock
]

{ #category : 'api - events' }
SpTablePresenter >> whenIsResizableChangedDo: aBlock [
	"Inform when resizable property has changed. 
	 `aBlock` has three optional arguments: 
	 - new value
	 - old value
	 - the announcement triggering this action"
	
	self property: #isResizable whenChangedDo: aBlock
]

{ #category : 'api - events' }
SpTablePresenter >> whenShowColumnHeadersChangedDo: aBlock [
	"Inform when showColumnHeaders property has changed. 
	 `aBlock` has three optional arguments: 
	 - new value
	 - old value
	 - the announcement triggering this action"
		
	self property: #showColumnHeaders whenChangedDo: aBlock
]
