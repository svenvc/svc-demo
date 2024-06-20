"
I am UUID7Generator.
I generate UUIDs (universally unique identifiers) of type/version 7.
A universally unique identifier that is sortable when generated at least one millisecond apart.
Contrary to the name universal uniqueness is not guaranteed, but very likely.

Usage

```
UUID7Generator new next
```

References

- https://uuid7.com
- https://www.ietf.org/archive/id/draft-peabody-dispatch-new-uuid-format-04.html#name-uuid-version-7
"
Class {
	#name : #UUID7Generator,
	#superclass : #Object,
	#instVars : [
		'clockEpochDelta'
	],
	#category : #SvcDemo
}

{ #category : #private }
UUID7Generator >> clock [
	"Return Unix time in milliseconds"
	
	^ Time primUTCMillisecondsClock - self clockEpochDelta
]

{ #category : #private }
UUID7Generator >> clockEpochDelta [
	"Return the delta in milliseconds between the Unix epoch and our clock epoch"

	^ clockEpochDelta
		ifNil: [ 
			clockEpochDelta := (ZTimestamp unixEpoch - ZTimestamp clockEpoch) asSeconds * 1e3 ]
]

{ #category : #example }
UUID7Generator >> exampleTimestamp [
	<gtExample>
	| uuid timestamp now |
	uuid := self exampleUUID.
	timestamp := self timestampFrom: uuid.
	now := ZTimestamp now.
	self assert: (timestamp between: now - 1 minute and: now + 1 minute).
	^ timestamp
]

{ #category : #example }
UUID7Generator >> exampleUUID [
	<gtExample>
	| uuid |
	uuid := self next.
	self assert: uuid isNil not.
	self assert: uuid size = 16.
	self assert: uuid seventh >> 4 = 2r111.
	self assert: uuid ninth >> 6 = 2r10.
	^ uuid
]

{ #category : #accessing }
UUID7Generator >> next [
	"Return the next UUID"
	
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
	"Use the shared generator"
	
	^ UUIDGenerator default randomGenerator
]

{ #category : #private }
UUID7Generator >> setVersionAndVariant: uuid [
	"top nibble version 0111 or 7"
	uuid at: 7 put: (((uuid at: 7) bitAnd: 16r0F) bitOr: 16r70).
	"top two bits variant 10"
	uuid at: 9 put: (((uuid at: 9) bitAnd: 16r3F) bitOr: 16r80)
]

{ #category : #accessing }
UUID7Generator >> timestampFrom: aUUID [
	"Assuming aUUID is of version 7, extract the timestamp"

	| unixTimestampMilliceonds |
	unixTimestampMilliceonds := ((aUUID as: ByteArray) copyFrom: 1 to: 6) asInteger.
	^ ZTimestamp
		fromClockNanoseconds: (unixTimestampMilliceonds + self clockEpochDelta) * 1e6
]
