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
	
	^ 1
]

{ #category : #accessing }
InterestingIntegers >> zero [
	<gtExample>

	| zero |

	zero := 0.

	self assert: zero isZero.

	^ zero
]
