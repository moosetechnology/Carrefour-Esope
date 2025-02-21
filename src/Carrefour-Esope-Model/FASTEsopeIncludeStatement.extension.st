Extension { #name : 'FASTEsopeIncludeStatement' }

{ #category : '*Carrefour-Esope-Model-accessing' }
FASTEsopeIncludeStatement >> famixInclude [
	"Relation named: #famixInclude type: #FamixF77Include opposite: #fastInclude"

	<generated>
	<derived>
	<FMProperty: #famixInclude type: #FamixF77Include opposite: #fastInclude>
	<package: #'Carrefour-Esope-Model'>
	^ self attributeAt: #famixInclude ifAbsent: [ nil ]
]

{ #category : '*Carrefour-Esope-Model-accessing' }
FASTEsopeIncludeStatement >> famixInclude: anObject [

	<generated>
	(self attributeAt: #famixInclude ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self famixInclude.
		self attributeAt: #famixInclude put: anObject.
		otherSide fastInclude: nil ]
	ifNotNil: [ 
		self attributeAt: #famixInclude put: anObject.
		anObject fastInclude: self ]
]
