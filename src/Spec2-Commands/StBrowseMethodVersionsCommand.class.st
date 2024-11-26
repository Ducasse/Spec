"
Create and schedule a message set browser on all versions of the method returned by the evaluation of the context.
"
Class {
	#name : 'StBrowseMethodVersionsCommand',
	#superclass : 'StSystemNavigationCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseMethodVersionsCommand class >> defaultDescription [ 
	^'Browse history of the method' 
]

{ #category : 'default' }
StBrowseMethodVersionsCommand class >> shortName [

	^ 'method versions'
]

{ #category : 'executing' }
StBrowseMethodVersionsCommand >> execute [
	| target |

	target := self target.
	self application tools versionBrowser
		browseVersionsForClass: target methodClass
		selector: target selector
]
