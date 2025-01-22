Extension { #name : 'FamixEsopeSegment' }

{ #category : '*Carrefour-Esope-Model-accessing' }
FamixEsopeSegment >> fast [
	"Relation named: #fast type: #FASTEsopeSegment opposite: #famix"

	<generated>
	<FMProperty: #fast type: #FASTEsopeSegment opposite: #famix>
	<package: #'Carrefour-Esope-Model'>
	^ self attributeAt: #fast ifAbsent: [ nil ]
]

{ #category : '*Carrefour-Esope-Model-accessing' }
FamixEsopeSegment >> fast: anObject [

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
