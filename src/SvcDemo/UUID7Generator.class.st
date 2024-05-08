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

{ #category : #private }
UUID7Generator >> clock [
	^ Time primUTCMillisecondsClock - 2177452800000
]

{ #category : #accessing }
UUID7Generator >> next [
	<gtExample>
	| uuid |
	uuid := UUID nilUUID.
	self putClockOn: uuid.
	self putRandomOn: uuid.
	self setVersionAndVariant: uuid.
	^ uuid
]

{ #category : #private }
UUID7Generator >> putClockOn: uuid [
	| now |
	now := self clock.
	1 to: 6 do: [ :index | 
		uuid at: index put: (now byteAt: 7 - index) ]
]

{ #category : #private }
UUID7Generator >> putRandomOn: uuid [
	| random |
	random := self randomGenerator.
	7 to: 16 do: [ :index | uuid at: index put: (random nextInteger: 256) - 1 ]
]

{ #category : #private }
UUID7Generator >> randomGenerator [
	^ UUIDGenerator default randomGenerator
]

{ #category : #accessing }
UUID7Generator >> setVersionAndVariant: uuid [
	uuid at: 7 put: (((uuid at: 7) bitAnd: 16r0F) bitOr: 16r70).
	uuid at: 9 put: (((uuid at: 9) bitAnd: 16r3F) bitOr: 16r80)
]
