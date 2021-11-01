!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'F 10/31/2021 20:56:28'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'F 11/1/2021 02:19:30'!
setUp
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack currentStatus'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
!OOStack commentStamp: '<historical>' prior: 0!
StatusStack subclasses #(EmptyStack NotEmptyStack).
!


!OOStack methodsFor: 'testing' stamp: 'F 10/31/2021 20:12:41'!
isEmpty
	^self size = 0.! !


!OOStack methodsFor: 'initialization' stamp: 'F 10/31/2021 19:50:59'!
initialize
	stack _ OrderedCollection new.
	currentStatus  := EmptyStack new.
	! !


!OOStack methodsFor: 'primitive actions' stamp: 'F 10/31/2021 22:42:25'!
pop
	
	| newCurrentStackStatus |
	newCurrentStackStatus _ StatusStack subclasses detect: [:status | (status availableToPop: self size)].
	currentStatus := newCurrentStackStatus new.
	^ currentStatus popFrom: stack.
	! !

!OOStack methodsFor: 'primitive actions' stamp: 'F 10/31/2021 19:53:57'!
push: aString 
	stack addFirst: aString.
	currentStatus := NotEmptyStack new.! !

!OOStack methodsFor: 'primitive actions' stamp: 'F 10/29/2021 21:42:14'!
size
	^stack size ! !

!OOStack methodsFor: 'primitive actions' stamp: 'F 10/31/2021 22:42:41'!
top
	| newCurrentStackStatus |
	newCurrentStackStatus _ StatusStack subclasses detect: [:status | (status availableToGetTopStack: self size)].
	^ newCurrentStackStatus new topFrom: stack.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #StatusStack category: 'Stack-Exercise'!
Object subclass: #StatusStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StatusStack methodsFor: 'as yet unclassified' stamp: 'F 10/31/2021 22:42:25'!
popFrom: aStack
	self subclassResponsibility.! !

!StatusStack methodsFor: 'as yet unclassified' stamp: 'F 10/31/2021 22:42:41'!
topFrom: aStack
	self subclassResponsibility.! !


!classDefinition: #EmptyStack category: 'Stack-Exercise'!
StatusStack subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStack methodsFor: 'primitive actions' stamp: 'F 10/31/2021 22:42:25'!
popFrom: aStack
	^self error: OOStack stackEmptyErrorDescription.
! !

!EmptyStack methodsFor: 'primitive actions' stamp: 'F 10/31/2021 22:42:41'!
topFrom: aStack
	^self error: OOStack stackEmptyErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStack class' category: 'Stack-Exercise'!
EmptyStack class
	instanceVariableNames: ''!

!EmptyStack class methodsFor: 'as yet unclassified' stamp: 'F 10/31/2021 20:52:22'!
availableToGetTopStack: aStackSize
	^aStackSize = 0! !

!EmptyStack class methodsFor: 'as yet unclassified' stamp: 'F 10/31/2021 20:06:17'!
availableToPop: aStackSize
	^aStackSize = 0! !


!classDefinition: #NotEmptyStack category: 'Stack-Exercise'!
StatusStack subclass: #NotEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStack methodsFor: 'primitive actions' stamp: 'F 10/31/2021 22:42:25'!
popFrom: aStack
	^aStack removeFirst. 
! !

!NotEmptyStack methodsFor: 'primitive actions' stamp: 'F 10/31/2021 22:42:41'!
topFrom: aStack
	^aStack first.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyStack class' category: 'Stack-Exercise'!
NotEmptyStack class
	instanceVariableNames: ''!

!NotEmptyStack class methodsFor: 'as yet unclassified' stamp: 'F 10/31/2021 20:52:14'!
availableToGetTopStack: aStackSize
	^aStackSize ~= 0! !

!NotEmptyStack class methodsFor: 'as yet unclassified' stamp: 'F 10/31/2021 20:06:31'!
availableToPop: aStackSize
	^aStackSize ~= 0! !
