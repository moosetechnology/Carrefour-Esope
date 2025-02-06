Extension { #name : 'FASTEsopePointerDeclarator' }

{ #category : '*Carrefour-Esope-Model-accessing' }
FASTEsopePointerDeclarator >> famix [
	"Relation named: #famix type: #FamixEsopePointer opposite: #fast"

	<generated>
	<derived>
	<FMProperty: #famix type: #FamixEsopePointer opposite: #fast>
	<package: #'Carrefour-Esope-Model'>
	^ self attributeAt: #famix ifAbsent: [ nil ]
]

{ #category : '*Carrefour-Esope-Model-accessing' }
FASTEsopePointerDeclarator >> famix: anObject [

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
