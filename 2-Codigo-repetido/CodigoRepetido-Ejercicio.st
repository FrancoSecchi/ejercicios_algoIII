!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/14/2021 17:18:39'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	self assert: (self ejecutionTimeIsSmallerThan: [ self createCustomerBookWith: 'John Lennon' ] milliseconds: 50).
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/14/2021 17:18:39'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	
	| customerBook paulMcCartney |
	paulMcCartney := 'paulMcCartney'.
	customerBook := self createCustomerBookWith: paulMcCartney.
	self assert: (self ejecutionTimeIsSmallerThan:[ customerBook removeCustomerNamed: paulMcCartney ]  milliseconds: 100). ! !

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/13/2021 02:34:04'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook error |
			
	customerBook := CustomerBook new.
	error := [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].
		
	self try: [customerBook addCustomerNamed: ''.] catchError: Error do: error.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/14/2021 18:03:21'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon error |
	johnLennon := 'John Lennon'.			
	customerBook := self createCustomerBookWith: johnLennon.
	error := [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)].
	
	self try: [customerBook removeCustomerNamed: 'Paul McCartney'.]  catchError: NotFound  do: error.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/14/2021 17:26:48'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWith: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self verificarQueLaCantidadDeActivosEs: 0 ySuspendidos: 1 en: customerBook.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/14/2021 18:37:35'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	paulMcCartney := 'Paul McCartney'.	
	customerBook := self createCustomerBookWith: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	self verificarQueLaCantidadDeActivosEs: 0 ySuspendidos: 0 en: customerBook.
	self deny: (customerBook includesCustomerNamed: paulMcCartney ).
	
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/14/2021 18:18:48'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon error |
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWith: johnLennon.
	
	error := [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
	
	self try: [customerBook suspendCustomerNamed: 'Ringo Starr'.]  catchError: CantSuspend  do: error.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'F 10/14/2021 18:21:28'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon error |
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWith: johnLennon .
	customerBook suspendCustomerNamed: johnLennon.
	
	error := [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
	
	self try: [customerBook suspendCustomerNamed: johnLennon.] catchError: CantSuspend  do: error.
! !


!CustomerBookTest methodsFor: 'ejecution function times' stamp: 'F 10/13/2021 03:38:24'!
ejecutionTimeIsSmallerThan: ejecution milliseconds: time
	| stopWatch |
	stopWatch := self stopWatchOfEjecution: ejecution.
	^ stopWatch < (time * millisecond)! !

!CustomerBookTest methodsFor: 'ejecution function times' stamp: 'F 10/13/2021 01:47:19'!
stopWatchOfEjecution: ejecution
	| millisecondsAfterRunning millisecondsBeforeRunning |
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.	
	ejecution .
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	^millisecondsAfterRunning  - millisecondsBeforeRunning.! !


!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'F 10/14/2021 17:18:39'!
createCustomerBookWith: name
	|customerBook |
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: name.
	^customerBook.
	! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'F 10/13/2021 02:34:04'!
try: ejecution catchError: typeError do: error
	[
		ejecution value.
		self fail
	]
		on: typeError 
		do: [:anError | error value: anError].! !


!CustomerBookTest methodsFor: 'customer functions at a customerBook' stamp: 'iv 10/13/2021 18:32:59'!
verificarQueLaCantidadDeActivosEs: cantidadActivos ySuspendidos: cantidadSuspendidos en: customerBook
	
	self assert: cantidadActivos equals: customerBook numberOfActiveCustomers.
	self assert: cantidadSuspendidos equals: customerBook numberOfSuspendedCustomers.
	self assert: cantidadActivos+cantidadSuspendidos equals: customerBook numberOfCustomers.
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'F 10/14/2021 18:44:42'!
removeCustomerNamed: aName 
	
	| customerDeleted |
	
	customerDeleted := self customerDeleted: aName.

	(customerDeleted isEmpty) not  ifTrue:
		[
			^ customerDeleted.
		].

	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !


!CustomerBook methodsFor: 'customer book - private' stamp: 'F 10/14/2021 18:41:26'!
customerDeleted: aName
	| nameRemovedFromActiveList nameRemovedInSuspendedList |
	
	nameRemovedFromActiveList := self removeCustomer: aName in: active.
	(nameRemovedFromActiveList isEmpty not) ifTrue:
		[
			^nameRemovedFromActiveList .
		].
	
	nameRemovedInSuspendedList := self removeCustomer: aName in: suspended.

	(nameRemovedInSuspendedList isEmpty not) ifTrue: 
		[
			^nameRemovedInSuspendedList
		].
	
	^''.! !

!CustomerBook methodsFor: 'customer book - private' stamp: 'F 10/14/2021 17:45:31'!
removeCustomer: aName in: list
	1 to: list size do: 
		[ :index |
			aName = (list at: index)
				ifTrue: [
					list removeAt: index.
					^ aName 
				] 
		].
	^''.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
