Extension { #name : 'FamixEsopeCommand' }

{ #category : '*Carrefour-Esope-Model-accessing' }
FamixEsopeCommand >> fastDeclaration [
	"Relation named: #fastDeclaration type: #FASTEsopePointerDeclarationStatement opposite: #famixDeclaration"

	<generated>
	<FMProperty: #fastDeclaration type: #FASTEsopePointerDeclarationStatement opposite: #famixDeclaration>
	<package: #'Carrefour-Esope-Model'>
	^ self attributeAt: #fastDeclaration ifAbsent: [ nil ]
]

{ #category : '*Carrefour-Esope-Model-accessing' }
FamixEsopeCommand >> fastDeclaration: anObject [

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
