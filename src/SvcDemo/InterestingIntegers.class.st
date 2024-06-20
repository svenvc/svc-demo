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

	^ one
]

{ #category : #accessing }
InterestingIntegers >> zero [
	<gtExample>

	| zero |

	zero := 0.

	self assert: zero isZero.

	^ zero
]
