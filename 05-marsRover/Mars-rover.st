!classDefinition: #MarsRoverTest category: 'Mars-rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-rover'!

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:50:08'!
test01WhenTheRoverIsInitalizedWithoutAPositionWillBeInitializedInOrigin
	| marsRover |
	marsRover := MarsRover new.
	self assert: 0@0 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:48:39'!
test02WhenTheRoverIsInitializedWithoutADirectionWillBeFacingNorth
	| marsRover |
	marsRover := MarsRover new.
	self assert: North new equals: marsRover cardinalPoint.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:41:38'!
test03RoverMovedForward
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeInstructions: 'f'.
	self assert: 0@1 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:48:47'!
test04RoverMovedBackwards
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeInstructions: 'b'.
	self assert: 0@-1 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:48:51'!
test05RoverMovedBackwardsAndForward
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeInstructions: 'fb'.
	self assert: 0@0 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:48:57'!
test06TurnsLeftAndFacesWest
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeInstructions: 'l'.
	self assert: West new equals: marsRover cardinalPoint .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:49:02'!
test07TurnsRightAndFacesEast
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeInstructions: 'r'.
	self assert: East new equals: marsRover cardinalPoint .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:49:07'!
test08TurnsTwiceRightAndFacesSouth
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeInstructions: 'rr'.
	self assert: South new equals: marsRover cardinalPoint .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:49:13'!
test09TurnsTwiceAndFacesNorth
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeInstructions: 'lr'.
	self assert: North new equals: marsRover cardinalPoint .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:49:19'!
test10TurnRightAndMoveForward
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeInstructions: 'rf'.
	self assert: East new equals: marsRover cardinalPoint .
	self assert: 1@0 equals: marsRover position .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:49:25'!
test11TurnLeftAndMoveForward
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeInstructions: 'lf'.
	self assert: West new equals: marsRover cardinalPoint .
	self assert: -1@0 equals: marsRover position .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:49:36'!
test12TurnLeftTwiceAndMoveForward
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeInstructions: 'llf'.
	self assert: South new equals: marsRover cardinalPoint .
	self assert: 0@-1 equals: marsRover position .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:49:42'!
test13TurnLeftAndMoveBackward
	| marsRover |
	marsRover := MarsRover new.
	marsRover executeInstructions: 'lb'.
	self assert: West new equals: marsRover cardinalPoint .
	self assert: 1@0 equals: marsRover position .! !

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:49:46'!
test14RoverInitializedWithAnSpecificPosition 
	| marsRover |
	marsRover := MarsRover withPosition: (0 @ 1).
	self assert: 0@1 equals: marsRover position.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:49:53'!
test15RoverInitializedWithAnSpecificPositionAndCardinalPoint
	| marsRover |
	marsRover := MarsRover withPosition: (1 @ 1) andCardinalPoint: South new.
	self assert: 1@1 equals: marsRover position.
	self assert: South new equals: marsRover cardinalPoint.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'F 11/18/2021 05:49:58'!
test16GivenAInvalidInstructionShowAnInvalidInstructionError
	| marsRover |
	marsRover := MarsRover withPosition: (1 @ 1) andCardinalPoint: East new.
	self
		should: [ marsRover executeInstructions: 'ffrblbx'. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = InvalidInstruction errorTheInstructionIsInvalid].! !


!classDefinition: #CardinalPoints category: 'Mars-rover'!
Object subclass: #CardinalPoints
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-rover'!

!CardinalPoints methodsFor: 'orientation' stamp: 'F 11/18/2021 04:24:48'!
direction
	self subclassResponsibility .! !

!CardinalPoints methodsFor: 'orientation' stamp: 'iv 11/18/2021 02:52:53'!
leftOfDirection
	self subclassResponsibility ! !

!CardinalPoints methodsFor: 'orientation' stamp: 'F 11/18/2021 04:12:03'!
rightOfDirection
	self subclassResponsibility ! !


!CardinalPoints methodsFor: 'comparing' stamp: 'F 11/18/2021 04:15:26'!
= aCardinalPoint
	self subclassResponsibility.! !


!classDefinition: #East category: 'Mars-rover'!
CardinalPoints subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-rover'!

!East methodsFor: 'comparing' stamp: 'F 11/18/2021 04:15:59'!
= aCardinalPoint
	^ aCardinalPoint isMemberOf: East.! !


!East methodsFor: 'orientation' stamp: 'F 11/18/2021 04:24:57'!
direction
	^1@0! !

!East methodsFor: 'orientation' stamp: 'F 11/18/2021 04:20:13'!
leftOfDirection
	^North new! !

!East methodsFor: 'orientation' stamp: 'F 11/18/2021 04:20:16'!
rightOfDirection
	^South new! !


!classDefinition: #North category: 'Mars-rover'!
CardinalPoints subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-rover'!

!North methodsFor: 'comparing' stamp: 'F 11/18/2021 04:16:09'!
= aCardinalPoint
	^ aCardinalPoint isMemberOf: North .! !


!North methodsFor: 'orientation' stamp: 'F 11/18/2021 04:25:03'!
direction
	^0@1! !

!North methodsFor: 'orientation' stamp: 'F 11/18/2021 04:20:06'!
leftOfDirection
	^West new! !

!North methodsFor: 'orientation' stamp: 'F 11/18/2021 04:20:09'!
rightOfDirection
	^East new! !


!classDefinition: #South category: 'Mars-rover'!
CardinalPoints subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-rover'!

!South methodsFor: 'comparing' stamp: 'F 11/18/2021 04:16:17'!
= aCardinalPoint
	^ aCardinalPoint isMemberOf: South.! !


!South methodsFor: 'orientation' stamp: 'F 11/18/2021 04:25:09'!
direction
	^0@-1! !

!South methodsFor: 'orientation' stamp: 'F 11/18/2021 04:20:21'!
leftOfDirection
	^East new! !

!South methodsFor: 'orientation' stamp: 'F 11/18/2021 04:20:24'!
rightOfDirection
	^West new! !


!classDefinition: #West category: 'Mars-rover'!
CardinalPoints subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-rover'!

!West methodsFor: 'comparing' stamp: 'F 11/18/2021 04:16:24'!
= aCardinalPoint
	^ aCardinalPoint isMemberOf: West.! !


!West methodsFor: 'orientation' stamp: 'F 11/18/2021 04:25:17'!
direction
	^-1@0! !

!West methodsFor: 'orientation' stamp: 'F 11/18/2021 04:20:28'!
leftOfDirection
	^South new! !

!West methodsFor: 'orientation' stamp: 'F 11/18/2021 04:20:32'!
rightOfDirection
	^North new! !


!classDefinition: #Instructions category: 'Mars-rover'!
Object subclass: #Instructions
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-rover'!

!Instructions methodsFor: 'actions' stamp: 'F 11/18/2021 05:46:59'!
followInstructionWith: aRover
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Instructions class' category: 'Mars-rover'!
Instructions class
	instanceVariableNames: ''!

!Instructions class methodsFor: 'as yet unclassified' stamp: 'F 11/18/2021 04:47:52'!
validInstructions
	^'fbrl'.! !


!classDefinition: #Backward category: 'Mars-rover'!
Instructions subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-rover'!

!Backward methodsFor: 'actions' stamp: 'F 11/18/2021 05:46:50'!
followInstructionWith: aRover
	^aRover moveBackward.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: 'Mars-rover'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'as yet unclassified' stamp: 'iv 11/18/2021 02:26:24'!
canInstanceWith: anInstruction
	^anInstruction =$b! !


!classDefinition: #Forward category: 'Mars-rover'!
Instructions subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-rover'!

!Forward methodsFor: 'actions' stamp: 'F 11/18/2021 05:46:50'!
followInstructionWith: aRover
	^aRover moveForward ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'Mars-rover'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'as yet unclassified' stamp: 'iv 11/18/2021 02:26:39'!
canInstanceWith: anInstruction
	^anInstruction =$f! !


!classDefinition: #InvalidInstruction category: 'Mars-rover'!
Instructions subclass: #InvalidInstruction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-rover'!

!InvalidInstruction methodsFor: 'as yet unclassified' stamp: 'F 11/18/2021 05:46:50'!
followInstructionWith: aRover
	^self error: self class errorTheInstructionIsInvalid.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidInstruction class' category: 'Mars-rover'!
InvalidInstruction class
	instanceVariableNames: ''!

!InvalidInstruction class methodsFor: 'as yet unclassified' stamp: 'F 11/18/2021 04:48:04'!
canInstanceWith: anInstruction
	^ (self validInstructions includes: anInstruction) not. ! !

!InvalidInstruction class methodsFor: 'as yet unclassified' stamp: 'F 11/18/2021 04:49:39'!
errorTheInstructionIsInvalid
	^ 'The instruction is invalid'.! !


!classDefinition: #TurnLeft category: 'Mars-rover'!
Instructions subclass: #TurnLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-rover'!

!TurnLeft methodsFor: 'actions' stamp: 'F 11/18/2021 05:46:50'!
followInstructionWith: aRover
	^aRover turnLeft! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnLeft class' category: 'Mars-rover'!
TurnLeft class
	instanceVariableNames: ''!

!TurnLeft class methodsFor: 'as yet unclassified' stamp: 'iv 11/18/2021 02:26:49'!
canInstanceWith: anInstruction
	^anInstruction =$l! !


!classDefinition: #TurnRight category: 'Mars-rover'!
Instructions subclass: #TurnRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-rover'!

!TurnRight methodsFor: 'actions' stamp: 'F 11/18/2021 05:46:50'!
followInstructionWith: aRover
	^aRover turnRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnRight class' category: 'Mars-rover'!
TurnRight class
	instanceVariableNames: ''!

!TurnRight class methodsFor: 'as yet unclassified' stamp: 'iv 11/18/2021 02:26:59'!
canInstanceWith: anInstruction
	^anInstruction =$r! !


!classDefinition: #MarsRover category: 'Mars-rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-rover'!

!MarsRover methodsFor: 'initialization' stamp: 'F 11/18/2021 04:39:55'!
initialize
	position := 0@0.
	cardinalPoint := North new.
	! !

!MarsRover methodsFor: 'initialization' stamp: 'F 11/18/2021 04:34:42'!
initializeWithPosition: aPosition 
	position := aPosition.! !

!MarsRover methodsFor: 'initialization' stamp: 'F 11/18/2021 04:39:55'!
initializeWithPosition: aPoint andACardinalPoint: aCardinalPoint 
	position _ aPoint.
	cardinalPoint _ aCardinalPoint.! !


!MarsRover methodsFor: 'actions' stamp: 'F 11/18/2021 05:50:16'!
executeInstructions: anInstructions
	
	anInstructions do:[:anInstruction | | currentInstruction | 
		currentInstruction := Instructions subclasses detect:[:aClass | aClass canInstanceWith: anInstruction].
		currentInstruction new followInstructionWith: self.
		].
! !

!MarsRover methodsFor: 'actions' stamp: 'F 11/18/2021 05:52:15'!
moveBackward 
	position _  (self position) + ((self cardinalPoint direction)*(-1))! !

!MarsRover methodsFor: 'actions' stamp: 'F 11/18/2021 05:52:21'!
moveForward 
	position _  (self position) + ((self cardinalPoint direction))! !

!MarsRover methodsFor: 'actions' stamp: 'F 11/18/2021 04:08:28'!
turnLeft
	self turnToDirection: #leftOfDirection.! !

!MarsRover methodsFor: 'actions' stamp: 'F 11/18/2021 04:20:42'!
turnRight
	self turnToDirection: #rightOfDirection.! !


!MarsRover methodsFor: 'actions - private' stamp: 'F 11/18/2021 04:39:55'!
turnToDirection: aDirection
	cardinalPoint _ aDirection sendTo: self cardinalPoint.! !


!MarsRover methodsFor: 'localization' stamp: 'F 11/18/2021 04:39:55'!
cardinalPoint
	^cardinalPoint! !

!MarsRover methodsFor: 'localization' stamp: 'iv 11/18/2021 00:57:52'!
position
	^position! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars-rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'F 11/18/2021 04:34:12'!
withPosition: aPosition
	^ self new initializeWithPosition: aPosition.! !


!MarsRover class methodsFor: 'class initialization' stamp: 'F 11/18/2021 04:38:38'!
withPosition: aPoint andCardinalPoint: aCardinalPoint
	^self new initializeWithPosition:aPoint andACardinalPoint: aCardinalPoint.! !
