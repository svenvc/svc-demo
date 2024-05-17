"
I am UUID7Generator.
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
	| uuid timestamp |
	uuid := self next.
	self assert: uuid isNil not.
	self assert: uuid size = 16.
	timestamp := self timestampFrom: uuid.
	self assert: (timestamp between: ZTimestamp now - 1 minute and: ZTimestamp now + 1 minute).
	^ timestamp
]

{ #category : #example }
UUID7Generator >> exampleUUID [
	<gtExample>
	| uuid |
	uuid := self next.
	self assert: uuid isNil not.
	self assert: uuid size = 16.
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
	uuid at: 7 put: (((uuid at: 7) bitAnd: 16r0F) bitOr: 16r70).
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
