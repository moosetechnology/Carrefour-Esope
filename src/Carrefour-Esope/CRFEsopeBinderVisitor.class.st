Class {
	#name : 'CRFEsopeBinderVisitor',
	#superclass : 'CRFFortranProgramUnitBinderVisitor',
	#category : 'Carrefour-Esope',
	#package : 'Carrefour-Esope'
}

{ #category : 'api' }
CRFEsopeBinderVisitor >> bindFastModel: fastModel toFamixEntity: aFamixEntity [
	
	self famixEntity: aFamixEntity.
	fastModel metamodel: self fastMetamodel.

	(fastModel allWithSubTypesOf: FASTEsopeSegment)
		do: [ :rootEntity | rootEntity accept: self ].

]

{ #category : 'accessing' }
CRFEsopeBinderVisitor >> fastMetamodel [

	^CRFEsopeModel metamodel
]

{ #category : 'search famix' }
CRFEsopeBinderVisitor >> rootEntitiesIn: fastModel [

	^fastModel allWithSubTypesOf: FASTEsopeSegment
]

{ #category : 'visiting' }
CRFEsopeBinderVisitor >> visitFASTEsopeSegment: aFASTEsopeSegment [

	| famix |

	famix := self childrenEntities: FamixEsopeSegment named: aFASTEsopeSegment name.

	self assert: (famix size = 1).
	famix anyOne fast: aFASTEsopeSegment.

	aFASTEsopeSegment statements do: [ :each | each accept: self ].

]
