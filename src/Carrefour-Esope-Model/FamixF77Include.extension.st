Extension { #name : 'FamixF77Include' }

{ #category : '*Carrefour-Esope-Model-accessing' }
FamixF77Include >> fastInclude [
	"Relation named: #fastInclude type: #FASTEsopeIncludeStatement opposite: #famixInclude"

	<generated>
	<FMProperty: #fastInclude type: #FASTEsopeIncludeStatement opposite: #famixInclude>
	<package: #'Carrefour-Esope-Model'>
	^ self attributeAt: #fastInclude ifAbsent: [ nil ]
]

{ #category : '*Carrefour-Esope-Model-accessing' }
FamixF77Include >> fastInclude: anObject [

	<generated>
	(self attributeAt: #fastInclude ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self fastInclude.
		self attributeAt: #fastInclude put: anObject.
		otherSide famixInclude: nil ]
	ifNotNil: [ 
		self attributeAt: #fastInclude put: anObject.
		anObject famixInclude: self ]
]
