Class {
	#name : 'CRFEsopeBinderVisitor',
	#superclass : 'CRFFortranProgramUnitBinderVisitor',
	#category : 'Carrefour-Esope',
	#package : 'Carrefour-Esope'
}

{ #category : 'accessing' }
CRFEsopeBinderVisitor >> fastMetamodel [

	^CRFEsopeModel metamodel
]

{ #category : 'visiting' }
CRFEsopeBinderVisitor >> visitFASTEsopeSegment: aFASTEsopeSegment [

	| famix |

	famix := self childrenEntities: FamixEsopeSegment named: aFASTEsopeSegment name.

	self assert: (famix size = 1).
	famix anyOne fast: aFASTEsopeSegment.

	aFASTEsopeSegment statements do: [ :each | each accept: self ].

]
