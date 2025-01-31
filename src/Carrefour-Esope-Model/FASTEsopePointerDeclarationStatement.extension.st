Extension { #name : 'FASTEsopePointerDeclarationStatement' }

{ #category : '*Carrefour-Esope-Model-accessing' }
FASTEsopePointerDeclarationStatement >> famix [
	"Relation named: #famix type: #FamixEsopePointer opposite: #fast"

	<generated>
	<derived>
	<FMProperty: #famix type: #FamixEsopePointer opposite: #fast>
	<package: #'Carrefour-Esope-Model'>
	^ self attributeAt: #famix ifAbsent: [ nil ]
]

{ #category : '*Carrefour-Esope-Model-accessing' }
FASTEsopePointerDeclarationStatement >> famix: anObject [

	<generated>
	(self attributeAt: #famix ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self famix.
		self attributeAt: #famix put: anObject.
		otherSide fast: nil ]
	ifNotNil: [ 
		self attributeAt: #famix put: anObject.
		anObject fast: self ]
]

{ #category : '*Carrefour-Esope-Model-accessing' }
FASTEsopePointerDeclarationStatement >> famixDeclaration [
	"Relation named: #famixDeclaration type: #FamixF77Variable opposite: #fastDeclaration"

	<generated>
	<derived>
	<FMProperty: #famixDeclaration type: #FamixF77Variable opposite: #fastDeclaration>
	<package: #'Carrefour-Esope-Model'>
	^ self attributeAt: #famixDeclaration ifAbsent: [ nil ]
]

{ #category : '*Carrefour-Esope-Model-accessing' }
FASTEsopePointerDeclarationStatement >> famixDeclaration: anObject [

	<generated>
	(self attributeAt: #famixDeclaration ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self famixDeclaration.
		self attributeAt: #famixDeclaration put: anObject.
		otherSide fastDeclaration: nil ]
	ifNotNil: [ 
		self attributeAt: #famixDeclaration put: anObject.
		anObject fastDeclaration: self ]
]
