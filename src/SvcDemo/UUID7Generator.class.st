"
I am UUID7Generator.

- https://uuid7.com
- https://www.ietf.org/archive/id/draft-peabody-dispatch-new-uuid-format-04.html#name-uuid-version-7
"
Class {
	#name : #UUID7Generator,
	#superclass : #Object,
	#category : #SvcDemo
}

{ #category : #accessing }
UUID7Generator >> clock [
	^ Time primUTCMillisecondsClock
]

{ #category : #accessing }
UUID7Generator >> next [
	<gtExample>
	
	| uuid random |
	uuid := UUID nilUUID.
	(self clock asByteArrayOfSize: 6) doWithIndex: [ :byte :index |
		uuid at: index put: byte ].
	random := UUIDGenerator default randomGenerator.
	7 to: 16 do: [ :index |
		uuid at: index put: (random nextInteger: 256) - 1 ].
	uuid at: 7 put: (((uuid at: 7) bitAnd: 16r0F) bitOr: 16r70).
	uuid at: 9 put: (((uuid at: 9) bitAnd: 16r3F) bitOr: 16r80).
	^ uuid
]
