Extension { #name : 'FASTEsopeSegment' }

{ #category : '*Carrefour-Esope-Model-accessing' }
FASTEsopeSegment >> famix [
	"Relation named: #famix type: #FamixEsopeSegment opposite: #fast"

	<generated>
	<derived>
	<FMProperty: #famix type: #FamixEsopeSegment opposite: #fast>
	<package: #'Carrefour-Esope-Model'>
	^ self attributeAt: #famix ifAbsent: [ nil ]
]

{ #category : '*Carrefour-Esope-Model-accessing' }
FASTEsopeSegment >> famix: anObject [

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
