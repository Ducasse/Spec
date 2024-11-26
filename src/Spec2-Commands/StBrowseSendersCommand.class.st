"
Browse all senders.

"
Class {
	#name : 'StBrowseSendersCommand',
	#superclass : 'StSystemSelectionCommand',
	#category : 'Spec2-Commands-Navigation',
	#package : 'Spec2-Commands',
	#tag : 'Navigation'
}

{ #category : 'default' }
StBrowseSendersCommand class >> defaultDescription [
	^ 'Browse all senders of the selected method or message'
]

{ #category : 'default' }
StBrowseSendersCommand class >> defaultName [

	^ 'Senders of it'
]

{ #category : 'default' }
StBrowseSendersCommand class >> defaultShortcutKey [

	^ $n command mac 
		| $n control win
		| $n control unix
]

{ #category : 'default' }
StBrowseSendersCommand class >> shortName [

	^ 'senders'
]

{ #category : 'executing' }
StBrowseSendersCommand >> execute [
	
	self context doBrowseSenders
]
