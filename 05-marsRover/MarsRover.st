!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'F 11/17/2021 21:54:18'!
test01
	|marsRover|
	marsRover _ MarsRover new.
	marsRover executeComands: 'f'.
	self assert: 1 @ 1  equals: marsRover position.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'moving' stamp: 'F 11/17/2021 21:55:28'!
executeComands: aString 
	! !


!MarsRover methodsFor: 'accesing' stamp: 'F 11/17/2021 21:56:14'!
position
	^ 1 @ 1.! !
