"
I am InterestingIntegers, example methods that return interesting numbers.
"
Class {
	#name : #InterestingIntegers,
	#superclass : #Object,
	#category : #SvcDemo
}

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
