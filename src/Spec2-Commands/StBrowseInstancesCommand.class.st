"
I browse all instances of the class returned by the evaluation of my context
"
Class {
	#name : 'StBrowseInstancesCommand',
	#superclass : 'StSystemDiscoveryCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseInstancesCommand class >> defaultDescription [
	^ 'Browse all instances of the selected class'
]

{ #category : 'accessing' }
StBrowseInstancesCommand class >> shortName [

	^ 'all instances'
]

{ #category : 'executing' }
StBrowseInstancesCommand >> execute [

	self target instanceSide allInstances inspect
]
