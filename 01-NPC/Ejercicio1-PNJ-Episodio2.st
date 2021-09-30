!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:00'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:06'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/25/2021 12:41:48'!
carolinaLaCurandera
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/22/2021 00:09:00'!
hamilton
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/22/2021 00:09:16'!
tirion
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/22/2021 00:09:33'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/21/2021 21:01:46'!
hacerQueLaCuranderaOlvideSusInteracciones
	"Implementar cuando sea necesario"! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/21/2021 21:02:50'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	"Implementar cuando sea necesario"! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/22/2021 00:09:48'!
hacerQueRiverwoodVeaPrometedorAHamilton
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'F 9/27/2021 21:21:23'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:25'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidar.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'F 9/27/2021 22:12:14'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'F 9/27/2021 21:18:38'!
hamilton
	^#Hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'F 9/27/2021 21:19:21'!
tirion
	^#Tirion.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/21/2021 20:49:11'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'F 9/30/2021 00:26:42'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	^TreborElGuardiaDeSkyrim olvidar ! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'F 9/30/2021 00:01:47'!
hacerQueRiverwoodVeaPrometedorAHamilton
	"Agregamos a Hamilton al diccionarios de personajesYSuInfoPersonal"
	TreborElGuardiaDeSkyrim agregarInformacionPersonalDelJugadorPersonaje: self hamilton.
	TreborElGuardiaDeSkyrim opinionDelPuebloDe: self hamilton opinion: 'Prometedor'! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'frases personajesYSuInformacionPersonal'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'F 9/27/2021 21:56:09'!
interactuarCon: jugadorPersonajeAInteracturar
	self recordarInteraccionDe: jugadorPersonajeAInteracturar.
	^ self responderSegunCantidadDeInteraccionesDe: jugadorPersonajeAInteracturar.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'F 9/29/2021 23:08:54'!
olvidar
	personajesYSuInformacionPersonal keys do: [:jugadorPersonaje | self olvidarInteraccionDe: jugadorPersonaje].! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'F 9/29/2021 23:42:42'!
agregarInformacionPersonalDelJugadorPersonaje: jugadorPersonajeAInteractuar
	|informacionDelJugadorPersonaje|
	"informacionDelJugadorPersonaje  := self InformacionIncial"
	informacionDelJugadorPersonaje  := Dictionary new.
	informacionDelJugadorPersonaje at: #opinion put: 'Forastero'.
	informacionDelJugadorPersonaje at: #cantidadDeInteracciones put: 0.
	
	personajesYSuInformacionPersonal at: jugadorPersonajeAInteractuar put: informacionDelJugadorPersonaje.
	
	^personajesYSuInformacionPersonal. ! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'F 9/29/2021 23:52:23'!
aumentarCantidadDeInteraccionesDe: infoPersonalDelJugadorPersonaje
	|cantidadDeInteraccionesDelJugadorPersonaje|
	cantidadDeInteraccionesDelJugadorPersonaje  :=  infoPersonalDelJugadorPersonaje at: #cantidadDeInteracciones.
	infoPersonalDelJugadorPersonaje at: #cantidadDeInteracciones put: cantidadDeInteraccionesDelJugadorPersonaje  + 1.
	^ infoPersonalDelJugadorPersonaje.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'F 9/30/2021 00:26:21'!
olvidarInteraccionDe: jugadorPersonaje
	|informacionPersonalDelJugadorPersonaje|
	informacionPersonalDelJugadorPersonaje := personajesYSuInformacionPersonal at: jugadorPersonaje.
	informacionPersonalDelJugadorPersonaje at: #cantidadDeInteracciones put: 0.
	informacionPersonalDelJugadorPersonaje at: #opinion put: 'Forastero'.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'F 9/30/2021 00:00:07'!
opinionDelPuebloDe: personajeJugadorADarleUnaOpinion opinion: opinionDelPueblo
	|infoPersonalDelJugadorPersonaje|
	infoPersonalDelJugadorPersonaje := personajesYSuInformacionPersonal at: personajeJugadorADarleUnaOpinion.
	infoPersonalDelJugadorPersonaje at: #opinion put: opinionDelPueblo.
	^infoPersonalDelJugadorPersonaje	.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'F 9/29/2021 23:51:27'!
recordarInteraccionDe: jugadorPersonajeAInteractuar
	"Si no existe, lo agregamos"
	|infoPersonalDelJugadorPersonaje|

	infoPersonalDelJugadorPersonaje := personajesYSuInformacionPersonal at: jugadorPersonajeAInteractuar ifAbsent: [false].
	
	infoPersonalDelJugadorPersonaje  = false ifTrue: 
	[	
		self agregarInformacionPersonalDelJugadorPersonaje: jugadorPersonajeAInteractuar.
	].
	
	^ self aumentarCantidadDeInteraccionesDe: infoPersonalDelJugadorPersonaje.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'F 9/30/2021 00:23:56'!
responderSegunCantidadDeInteraccionesDe: jugadorPersonajeAInteractuar
	|infoPersonalDelJugadorPersonaje frasesSegunLaOpinionDelPueblo|
	
	infoPersonalDelJugadorPersonaje := personajesYSuInformacionPersonal at: jugadorPersonajeAInteractuar.
	frasesSegunLaOpinionDelPueblo := frases at: (infoPersonalDelJugadorPersonaje at: #opinion).
	
	^frasesSegunLaOpinionDelPueblo at: ((infoPersonalDelJugadorPersonaje at:#cantidadDeInteracciones) min: frasesSegunLaOpinionDelPueblo size)! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'F 9/30/2021 00:29:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frases := ((Dictionary new) add: ('Forastero'->#('Hola forastero' '¿Todo bien?' '¿Algún problema?' )); add: ('Prometedor'->#('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' )); yourself).
	personajesYSuInformacionPersonal := ((Dictionary new) add: (#Hamilton->((Dictionary new) add: (#cantidadDeInteracciones->2); add: (#opinion->'Prometedor'); yourself)); add: (#Tirion->((Dictionary new) add: (#cantidadDeInteracciones->0); add: (#opinion->'Forastero'); yourself)); yourself).! !

TreborElGuardiaDeSkyrim initializeAfterFileIn!