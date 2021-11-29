!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'iv 11/29/2021 02:41:22'!
test01WhenCreatedAPortfolioBalanceIsCero
	|portfolio|
	portfolio := Portfolio new.
	self assert: portfolio portfolioBalance equals: 0*peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'iv 11/29/2021 03:05:21'!
test02WhenAddingAnAccountPortfolioSizeIsNotCero
	|portfolio account|
	portfolio := Portfolio new.
	account  := ReceptiveAccount new.
	portfolio addToThePortfolioAnAccount: account.
	
	self assert: portfolio accountSize equals: 1.! !

!PortfolioTest methodsFor: 'tests' stamp: 'iv 11/29/2021 03:09:27'!
test03BalanceOfAPortfolioIsTheBalanceOfTheAccount
	|portfolio account|
	portfolio := Portfolio new.
	account  := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio addToThePortfolioAnAccount: account.
	
	self assert: portfolio portfolioBalance equals: 100 * peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'iv 11/29/2021 03:13:38'!
test04BalanceOfAPortfolioIsTheBalanceOfTheSumOfTheAccounts
	|portfolio account1 account2|
	portfolio := Portfolio new.
	account1  := ReceptiveAccount new.
	account2  := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	Deposit register: 100 * peso on: account2.

	portfolio addToThePortfolioAnAccount: account1.
	portfolio addToThePortfolioAnAccount: account2.
	
	self assert: portfolio portfolioBalance equals: 200 * peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'iv 11/29/2021 03:37:17'!
test06PortfolioHasTheTransactionsOfAnAccount
	|portfolio account deposit accountTransactions|
	portfolio := Portfolio new.
	account  := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio addToThePortfolioAnAccount: account.
	accountTransactions := portfolio transactionsOfAccount: account.
	
	self assert: 1 equals: accountTransactions size.
	self assert: (accountTransactions includes: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'iv 11/29/2021 03:47:08'!
test07PortfolioHasAnEmptyPortfolioInsideAndItsBalanceIsCero
	|portfolio insidePortfolio|
	portfolio := Portfolio new.
	insidePortfolio := Portfolio new.
	portfolio addToThePortfolioAnAccount: insidePortfolio .
	
	self assert: portfolio portfolioBalance equals: 0*peso.
	self assert: portfolio accountSize equals: 1.! !

!PortfolioTest methodsFor: 'tests' stamp: 'iv 11/29/2021 03:55:28'!
test08PortfolioBalanceIncludesPortfoliosInsideOfIt
	|portfolio insidePortfolio account|
	portfolio := Portfolio new.
	insidePortfolio := Portfolio new.
	
	account  := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	insidePortfolio  addToThePortfolioAnAccount: account.
	portfolio addToThePortfolioAnAccount: insidePortfolio .
	
	self assert: portfolio portfolioBalance equals: 100*peso.
	self assert: portfolio accountSize equals: 1.! !

!PortfolioTest methodsFor: 'tests' stamp: 'F 11/29/2021 12:30:35'!
test09PortfolioBalanceIncludesPortfoliosInsideOfItAndAccounts
	|portfolio insidePortfolio account1 account2|
	portfolio := Portfolio new.
	insidePortfolio := Portfolio new.
	
	account1  := ReceptiveAccount new.
	account2  := ReceptiveAccount new.

	Deposit register: 100 * peso on: account1.
	Deposit register: 200 * peso on: account2.

	insidePortfolio  addToThePortfolioAnAccount: account1.
	portfolio addToThePortfolioAnAccount: insidePortfolio.
	portfolio addToThePortfolioAnAccount: account2.
	
	
	self assert: portfolio portfolioBalance equals: 300 * peso.
	self assert: portfolio accountSize equals: 2.! !

!PortfolioTest methodsFor: 'tests' stamp: 'iv 11/29/2021 11:57:51'!
test12PortfolioRegistersTransactionsInsideOfIt
	|portfolio  account deposit|
	portfolio := Portfolio new.

	account  := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio addToThePortfolioAnAccount: account.
	
	self assert: (self portfolioTransactions: portfolio transactionsOfPortfolio includes: deposit).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'iv 11/29/2021 12:08:45'!
test13CanNotAddTwiceTheSameAccount
	|portfolio  account|
	portfolio := Portfolio new.
	account  := ReceptiveAccount new.
	portfolio addToThePortfolioAnAccount: account.
	
	self
        should: [ portfolio addToThePortfolioAnAccount: account. ]
        raise: Error
        withExceptionDo: [ :anError |
            self assert: anError messageText = Portfolio errorDuplicateAccount ].
	
	
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'iv 11/29/2021 12:10:37'!
test14CanNotAddTheSamePortfolioTwice
	|portfolio  insidePortfolio|
	portfolio := Portfolio new.
	insidePortfolio  := Portfolio new.
	portfolio addToThePortfolioAnAccount: insidePortfolio .
	
	self
        should: [ portfolio addToThePortfolioAnAccount: insidePortfolio . ]
        raise: Error
        withExceptionDo: [ :anError |
            self assert: anError messageText = Portfolio errorDuplicateAccount ].
	
	
	
! !

!PortfolioTest methodsFor: 'tests' stamp: 'iv 11/29/2021 12:15:34'!
test15CanNotAddItselfToThePortfolio
	|portfolio  insidePortfolio |
	portfolio := Portfolio new.
	
	self
        should: [ portfolio addToThePortfolioAnAccount: portfolio . ]
        raise: Error
        withExceptionDo: [ :anError |
            self assert: anError messageText = Portfolio errorCanNotAddItselfToPortfolio ].
	
	
	
! !


!PortfolioTest methodsFor: 'test - private' stamp: 'iv 11/29/2021 11:56:19'!
portfolioTransactions: aPortfolioTransactions includes: aTransaction 
	|aTransactionIsPresent|
	aPortfolioTransactions do:[:accountTransactions|
		aTransactionIsPresent := accountTransactions includes: aTransaction .
		aTransactionIsPresent ifTrue: [^aTransactionIsPresent ]
		].
	^false
	
! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'iv 11/29/2021 02:15:14'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 150 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iv 11/29/2021 03:05:00'!
accountSize
	^accounts size! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'F 11/29/2021 17:13:58'!
addToThePortfolioAnAccount: anAccount
	(accounts includes: anAccount) ifTrue: [self error: Portfolio errorDuplicateAccount ].
	(anAccount == self) ifTrue: [self error: Portfolio errorCanNotAddItselfToPortfolio ].
	accounts add: anAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iv 11/29/2021 02:34:41'!
initialize
	accounts := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iv 11/29/2021 03:52:25'!
portfolioBalance
	|totalBalance|
	totalBalance := 0.
	accounts size = 0 ifTrue: [^totalBalance]
	ifFalse: [accounts do:[:account |
			(account isKindOf: Portfolio) ifTrue: [totalBalance := totalBalance + account portfolioBalance ] 
			ifFalse: [totalBalance := totalBalance + account balance] 
			]
		].
	^totalBalance 
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iv 11/29/2021 03:38:40'!
transactionsOfAccount: anAccount
	^anAccount  transactions ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iv 11/29/2021 11:40:02'!
transactionsOfPortfolio
	|transactions|
	transactions  := OrderedCollection new.
	
	accounts do:[:account |
			(account isKindOf: Portfolio) ifTrue: [account transactionsOfPortfolio] 
			ifFalse: [transactions add: account transactions].
			].
	^transactions 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'iv 11/29/2021 12:15:16'!
errorCanNotAddItselfToPortfolio
	^'Can not add the portfolio as an account of itself'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'iv 11/29/2021 12:02:18'!
errorDuplicateAccount
	^'Account is already in Portfolio'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HAW 5/23/2019 15:19:32'!
balance

	^transactions sum: [ :aTransaction | aTransaction value ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !
