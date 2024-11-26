"
I inspect all pointers to the object returned by the evaluation of my context
"
Class {
	#name : 'StBrowsePointersToCommand',
	#superclass : 'StSystemDiscoveryCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowsePointersToCommand class >> defaultDescription [
	^ 'Browse all objects referencing the selected object'
]

{ #category : 'default' }
StBrowsePointersToCommand class >> shortName [

	^ 'pointers to'
]

{ #category : 'executing' }
StBrowsePointersToCommand >> execute [
	self target selectedItem value pointersTo inspect
]
