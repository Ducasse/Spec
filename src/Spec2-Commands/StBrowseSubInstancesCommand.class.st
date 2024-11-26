"
I browse all instances of the class (and all its subclasses) returned by the evaluation of my context 
"
Class {
	#name : 'StBrowseSubInstancesCommand',
	#superclass : 'StSystemDiscoveryCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseSubInstancesCommand class >> defaultDescription [
	^ 'Browse all instances of the selected class and all its subclasses'
]

{ #category : 'default' }
StBrowseSubInstancesCommand class >> shortName [

	^ 'all subinstances'
]

{ #category : 'executing' }
StBrowseSubInstancesCommand >> execute [

	self target instanceSide allSubInstances inspect
]
