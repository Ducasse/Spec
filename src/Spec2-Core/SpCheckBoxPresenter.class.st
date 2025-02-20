"
A Checkbox Button that can be activated/deactivated.

"
Class {
	#name : 'SpCheckBoxPresenter',
	#superclass : 'SpAbstractFormButtonPresenter',
	#category : 'Spec2-Core-Widgets',
	#package : 'Spec2-Core',
	#tag : 'Widgets'
}

{ #category : 'specs' }
SpCheckBoxPresenter class >> adapterName [

	^ #CheckBoxAdapter
]

{ #category : 'documentation' }
SpCheckBoxPresenter class >> documentFactoryMethodSelector [

	^ #newCheckBox
]

{ #category : 'TOREMOVE' }
SpCheckBoxPresenter >> labelOnLeft [

	^ self changed: #labelOnLeft with: #()
]

{ #category : 'TOREMOVE' }
SpCheckBoxPresenter >> labelOnRight [

	^ self changed: #labelOnRight with: #()
]

{ #category : 'accessing' }
SpCheckBoxPresenter >> windowTitle [

	^ 'Checkbox Button'
]
