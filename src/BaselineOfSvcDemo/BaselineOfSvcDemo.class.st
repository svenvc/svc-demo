"
I am BaselineOfSvcDemo
"
Class {
	#name : #BaselineOfSvcDemo,
	#superclass : #BaselineOf,
	#category : #BaselineOfSvcDemo
}

{ #category : #baseline }
BaselineOfSvcDemo >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'SvcDemo'
		]
]
