Class {
	#name : 'SpDropListPresenterTest',
	#superclass : 'SpSmokeTest',
	#category : 'Spec2-Tests-Core-Widgets',
	#package : 'Spec2-Tests',
	#tag : 'Core-Widgets'
}

{ #category : 'accessing' }
SpDropListPresenterTest >> classToTest [
	^ SpDropListPresenter
]

{ #category : 'tests' }
SpDropListPresenterTest >> testDisableSelectionDuring [ 
	| changed |

	changed := false.
	presenter items: #($a $b $c).
	presenter selectItem: $a.
	presenter whenSelectionChangedDo: [ changed := true ].
	
	self deny: changed.
	presenter disableSelectionDuring: [ presenter selectItem: $b ].
	self deny: changed. "still not change"
	self assert: presenter selectedItem equals: $b "but the selection changed!"
]

{ #category : 'tests' }
SpDropListPresenterTest >> testEmptyList [

	| changed |
	changed := false.
	presenter items: #( $a $b $c ).
	presenter selectItem: $a.

	[ presenter open ] ensure: [ presenter withWindowDo: #close ].
	presenter emptyList.

	self assert: presenter items isEmpty.
	self assert: presenter selectedIndex equals: 0
]

{ #category : 'tests' }
SpDropListPresenterTest >> testSelectItemAfterOpen [

	presenter items: #( $a $b $c ).
	presenter selectItem: $c.

	[ 
		presenter open. 
		self assert: presenter selectedItem equals: $c.
		presenter selectItem: $b.
		self assert: presenter selectedItem equals: $b.
	] 
	ensure: [ presenter withWindowDo: #close ]	
]

{ #category : 'tests' }
SpDropListPresenterTest >> testSelectionOfObjectsWithSamePrintOn [

	| first second |
	presenter items: { first := Object new. second := Object new }.
	presenter selectItem: second.

	[ 
		presenter open. 
		self assert: presenter selectedItem equals: second.
		presenter selectItem: first.
		self assert: presenter selectedItem equals: first.
	] 
	ensure: [ presenter withWindowDo: #close ]	
]

{ #category : 'tests' }
SpDropListPresenterTest >> testSelectionOfObjectsWithSamePrintOnBeforeOpen [

	| first second |
	
	presenter items: { first := Object new. second := Object new }.
	presenter selectItem: second.
	[ 
		self assert: presenter selectedItem equals: second.
		presenter selectItem: first.
		self assert: presenter selectedItem equals: first.
	] 
	ensure: [ presenter withWindowDo: #close ]	
]

{ #category : 'tests' }
SpDropListPresenterTest >> testSetItemsWithCollectionSmallerThanSelection [

	| changed |
	changed := false.
	presenter items: #( $a $b $c ).
	presenter selectItem: $c.

	[ presenter open ] ensure: [ presenter withWindowDo: #close ].
	presenter items: #( $a ).

	self assert: presenter selectedIndex equals: 1
]

{ #category : 'tests' }
SpDropListPresenterTest >> testSetItemsWithEmptyCollection [

	| changed |
	changed := false.
	presenter items: #( $a $b $c ).
	presenter selectItem: $a.

	[ presenter open ] ensure: [ presenter withWindowDo: #close ].
	presenter items: #(  ).

	self assert: presenter items isEmpty.
	self assert: presenter selectedIndex equals: 0
]

{ #category : 'tests' }
SpDropListPresenterTest >> testSortingBlock [
	| count |
	count := 0.
	presenter
		whenSortingBlockChangedDo: [ :sortFunction | count := count + 1 ].
	presenter items: #(3 8 1 0).
	presenter sortingBlock: [ :a :b | a model < b model ].
	self assert: count equals: 1.
	self assert: (presenter model at: 1) model equals: 0
]

{ #category : 'tests' }
SpDropListPresenterTest >> testUpdateItemsKeepingSelection [ 

	presenter items: #($a $b $c).
	presenter selectItem: $c.
	presenter updateItemsKeepingSelection: #($c $d $e $f).
	self assert: presenter selectedItem equals: $c
]
