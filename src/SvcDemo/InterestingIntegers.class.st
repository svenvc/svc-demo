"
I am InterestingIntegers, example methods that return interesting numbers.
"
Class {
	#name : #InterestingIntegers,
	#superclass : #Object,
	#category : #SvcDemo
}

{ #category : #private }
InterestingIntegers >> dummy [
	<gtExample>

	"time tag = 2024-10-17T09:54:42.692216Z"

	^ ZTimestamp now
]

{ #category : #accessing }
InterestingIntegers >> one [
	<gtExample>

	| one |

	one := 1.

	self assert: one + self zero = one.
	self assert: one - self zero = one.
	self assert: one odd.

	^ one
]

{ #category : #accessing }
InterestingIntegers >> seven [
	<gtExample>

	| seven |

	seven := 7.

	self assert: seven odd.
	self assert: seven isPrime.
	self assert: seven equals: self two * self two + self one + self two.

	^ seven
]

{ #category : #accessing }
InterestingIntegers >> three [
	<gtExample>
	
	| three |
	
	three := 3.
	
	self assert: three = (self two + self one).
	self assert: three odd.
	self assert: three isPrime.
	
	^ three
]

{ #category : #accessing }
InterestingIntegers >> two [
	<gtExample>
	
	| two |
	
	two := 2.
	
	self assert: two = (self one + self one).
	self assert: two even.
	self assert: two isPrime.
	
	^ two
]

{ #category : #accessing }
InterestingIntegers >> zero [
	<gtExample>

	| zero |

	zero := 0.

	self assert: zero isZero.
	self assert: zero + zero = zero.
	self assert: zero - zero = zero.

	^ zero
]
