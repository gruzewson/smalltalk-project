Object subclass: #Wielokat
	instanceVariableNames: 'wierzcholki nazwa circle'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!

!Wielokat methodsFor: 'initialize-release'!

	initialize: liczbaWierzcholkow name: nowaNazwa
		"konstruktor obiektu - wielokata"
		nazwa:=nowaNazwa.
		wierzcholki:=Array new: liczbaWierzcholkow.
		"0@0 to klasa point"
		wierzcholki at: 1 put: 0@0.
		circle := Circle new initialize: 0 center: 0@0.
	!
!

!Wielokat methodsFor: 'accessing'! ""

	nazwa
		"podaje nazwe wielokata - getteer"
		^nazwa
	!

	nazwa: nowa_nazwa
		"ustawia nowa nazwe wielokata - setter"
		nazwa:=nowa_nazwa
	! 

	wierzcholki

	^wierzcholki
	!

	circle

        ^circle
    !
!

!Wielokat methodsFor: 'actions'!
	drukuj
		Transcript
			show: 'Dana jest figura:',nazwa; cr.
			1 to: wierzcholki size do: 
			[  :index | (wierzcholki at: index) ifNotNil: 
				[Transcript show: 'p', index printString,': ' , (wierzcholki at: index) printString; cr.].
			].
			Transcript show: 'pole: ', (self pole) printString; cr; cr.
			Transcript show: 'Circle - Center: ', (circle center) printString, ' Radius: ', (circle radius) printString; cr.
    !
	!
!


Wielokat subclass: #Kwadrat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Kwadrat methodsFor: 'arithmetic'!

	+ figura
		"dodaj 2 figury w sensie pola"

		| p |

		p:=self pole + figura pole.
		^(Kwadrat new) initialize: p sqrt
	!

	skaluj: z
		"z - o ile skalowac"
		| a |
		
		a := (wierzcholki at: 2) x.
        circle := Circle new initialize: a / 2 center: (a / 2) @ (a / 2).
		^(Kwadrat new) initialize: a*z.
	! 
!

!Kwadrat methodsFor: 'actions'!

	pole
		"licz pole kwadratu"

		^(wierzcholki at: 2) x squared
	!

!

!Kwadrat methodsFor: 'initialize-release'!

	initialize: bok
	"tworz kwadrat o podanym boku"

	super initialize: 4 name: 'Kwadrat'.
	wierzcholki at: 2 put: bok@0. 
	wierzcholki at: 3 put: bok@bok.
	wierzcholki at: 4 put: 0@bok.
	circle := Circle new initialize: bok / 2 center: (bok / 2) @ (bok / 2).
	!
	 
    

!


Wielokat subclass: #TrojkatRownoramienny
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'JezykiProgramowania'!

!TrojkatRownoramienny methodsFor: 'arithmetic'!

	+ figura
	"dodaj 2 figury w sensie pola"

	| a h x y|
	
	a:= (wierzcholki at: 2) x.
	h:=(wierzcholki at: 3) y.
	x:= h* ((1+((2*figura pole)/(a*h))) sqrt).
	y:= a* ((1+((2*figura pole)/(a*h))) sqrt).
    ^(TrojkatRownoramienny new) initialize: x wysokosc: y.

	! 

   skaluj: scale
    
    | a h |
	
    a := (wierzcholki at: 2) x.
    h := (wierzcholki at: 3) y.
    circle := Circle new initialize: a / 2 center: (a / 2) @ (a / 2).
    ^(TrojkatRownoramienny new) initialize: (a*scale) wysokosc: (h*scale).
	! 
!



!TrojkatRownoramienny methodsFor: 'actions'!

	pole
		| p |
		p := (wierzcholki at: 2) x abs * (wierzcholki at: 3) y abs * 0.5.
		^ p
	!
!

!TrojkatRownoramienny methodsFor: 'initialize-release'!
    initialize: podstawa wysokosc: wysokosc
        "tworz trojkat rownoramienny o podanej podstawie i wysokosci"

        super initialize: 3 name: 'TrojkatRownoramienny'.
        wierzcholki at: 2 put: podstawa@0. 
        wierzcholki at: 3 put: (podstawa / 2) asFloat@wysokosc.
        radius := podstawa squared / (4 * podstawa squared - (podstawa squared + wysokosc squared) squared) sqrt.
		circle := Circle new initialize: radius center: podstawa / 2 @ (radius squared - (podstawa/2) squared).
		! 
!

"MODYFIKACJA"
Object subclass: #Circle
    instanceVariableNames: 'radius center'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Geometry'

!Circle methodsFor: 'initialize-release'!

initialize: aRadius center: aCenter
    "Constructor for the Circle object"
    radius := aRadius.
    center := aCenter.
!

!Circle methodsFor: 'accessing'!

radius
    "Getter for the radius"
    ^ radius
!

center
    "Getter for the center"
    ^ center
!

!Circle methodsFor: 'actions'!

print
    "Prints the center and radius of the circle"
    Transcript show: 'Circle - Center: ', center printString, ' Radius: ', radius printString; cr.
!

!Circle methodsFor: 'testing'!

area
    "Calculates and returns the area of the circle"
    ^ (radius squared * Float pi) rounded
!

!Circle methodsFor: 'private'!

radiusSquared
    "Returns the square of the radius"
    ^ radius squared
!

!

"Example usage:"
| myCircle |
myCircle := Circle new initialize: 5 center: 0@0.
myCircle print.
Transcript show: 'Area: ', myCircle area printString; cr.

        

"edytor online JDoodle: https://www.jdoodle.com/execute-smalltalk-online/"
"Olaf Jedlinski 193145 - student 1, z indeksu mamy trójkąt równoramienny, Marcel Grużewski 193589 - student 2, z indeksu mamy skalowanie figury"
"tutaj są polecenia"
k := (Kwadrat new) initialize:2.
t := (TrojkatRownoramienny new) initialize: 2 wysokosc: 2.

Transcript show: 'Dane sa wielokaty: '; cr; cr.
k drukuj.

k2 := k skaluj: 2.
k2 drukuj.

