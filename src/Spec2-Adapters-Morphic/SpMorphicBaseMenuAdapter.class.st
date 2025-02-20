"
I am the adapter used to build a MenuMorph from a MenuPresenter
"
Class {
	#name : 'SpMorphicBaseMenuAdapter',
	#superclass : 'SpAbstractMorphicAdapter',
	#category : 'Spec2-Adapters-Morphic-Base',
	#package : 'Spec2-Adapters-Morphic',
	#tag : 'Base'
}

{ #category : 'testing' }
SpMorphicBaseMenuAdapter class >> isAbstract [

	^ self name = #SpMorphicBaseMenuAdapter
]

{ #category : 'private' }
SpMorphicBaseMenuAdapter >> getTitleText [

	^ self presenter title ifNotNil: [ :aString | aString localizedForPresenter: self presenter ]
]

{ #category : 'protocol' }
SpMorphicBaseMenuAdapter >> icon [

	^ self model icon
]

{ #category : 'protocol' }
SpMorphicBaseMenuAdapter >> menuGroups [

	^ self model menuGroups reject: [ :e | e isEmpty ]
]

{ #category : 'spec protocol' }
SpMorphicBaseMenuAdapter >> openAt: aPoint [ 

	self widgetDo: [ :w | w invokeAt: (aPoint + (2@7)) in: self currentWorld allowKeyboard: true ]
]

{ #category : 'spec protocol' }
SpMorphicBaseMenuAdapter >> openAtPointer [

	self openAt: self currentHand position
]

{ #category : 'protocol' }
SpMorphicBaseMenuAdapter >> title [

	^ self getTitleText
]
