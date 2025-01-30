Extension { #name : 'FamixF77Variable' }

{ #category : '*Carrefour-Esope-Model-accessing' }
FamixF77Variable >> fast [
	"Relation named: #fast type: #FASTEsopePointerDeclarationStatement opposite: #famix"

	<generated>
	<FMProperty: #fast type: #FASTEsopePointerDeclarationStatement opposite: #famix>
	<package: #'Carrefour-Esope-Model'>
	^ self attributeAt: #fast ifAbsent: [ nil ]
]

{ #category : '*Carrefour-Esope-Model-accessing' }
FamixF77Variable >> fast: anObject [

	<generated>
	(self attributeAt: #fast ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self fast.
		self attributeAt: #fast put: anObject.
		otherSide famix: nil ]
	ifNotNil: [ 
		self attributeAt: #fast put: anObject.
		anObject famix: self ]
]

{ #category : '*Carrefour-Esope-Model-accessing' }
FamixF77Variable >> fastDeclaration [
	"Relation named: #fastDeclaration type: #FASTEsopePointerDeclarationStatement opposite: #famixDeclaration"

	<generated>
	<FMProperty: #fastDeclaration type: #FASTEsopePointerDeclarationStatement opposite: #famixDeclaration>
	<package: #'Carrefour-Esope-Model'>
	^ self attributeAt: #fastDeclaration ifAbsent: [ nil ]
]

{ #category : '*Carrefour-Esope-Model-accessing' }
FamixF77Variable >> fastDeclaration: anObject [

	<generated>
	(self attributeAt: #fastDeclaration ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self fastDeclaration.
		self attributeAt: #fastDeclaration put: anObject.
		otherSide famixDeclaration: nil ]
	ifNotNil: [ 
		self attributeAt: #fastDeclaration put: anObject.
		anObject famixDeclaration: self ]
]
