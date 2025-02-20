Class {
	#name : 'CRFEsopeBinderVisitor',
	#superclass : 'CRFFortranProgramUnitBinderVisitor',
	#category : 'Carrefour-Esope',
	#package : 'Carrefour-Esope'
}

{ #category : 'visiting' }
CRFEsopeBinderVisitor >> visitFASTEsopeIncludeStatement: aFASTEsopeIncludeStatement [ 

]

{ #category : 'visiting' }
CRFEsopeBinderVisitor >> visitFASTEsopePointerDeclarationStatement: aFASTEsopePointerDeclarationStatement [

	aFASTEsopePointerDeclarationStatement pointerDeclarators
		do: [ :decl |
			(decl attributeAt: #variableDeclarator ifAbsent: [ nil ]) 
				ifNotNil: [ :variableDeclarator | variableDeclarator accept: self ]
		]
]

{ #category : 'visiting' }
CRFEsopeBinderVisitor >> visitFASTEsopeSegCommand: aFASTEsopeSegCommand [

	aFASTEsopeSegCommand variables do: [ :variable | variable accept: self ]
]

{ #category : 'visiting' }
CRFEsopeBinderVisitor >> visitFASTEsopeSegact: aFASTEsopeSegact [ 

		self visitFASTEsopeSegCommand: aFASTEsopeSegact 
]

{ #category : 'visiting' }
CRFEsopeBinderVisitor >> visitFASTEsopeSegadj: aFASTEsopeSegadj [ 

		self visitFASTEsopeSegCommand: aFASTEsopeSegadj
]

{ #category : 'visiting' }
CRFEsopeBinderVisitor >> visitFASTEsopeSegdes: aFASTEsopeSegdes [ 

		self visitFASTEsopeSegCommand: aFASTEsopeSegdes 
]

{ #category : 'visiting' }
CRFEsopeBinderVisitor >> visitFASTEsopeSegment: aFASTEsopeSegment [

	| famix |

	famix := self childrenEntities: FamixEsopeSegment named: aFASTEsopeSegment name.

	self assert: (famix size = 1).
	famix anyOne fast: aFASTEsopeSegment.

	aFASTEsopeSegment statements do: [ :each | each accept: self ].

]
