Extension { #name : 'FASTEsopeModel' }

{ #category : '*Carrefour-Esope' }
FASTEsopeModel >> carrefourBinderCleaner [

	^ CRFEsopeBindingCleaner new
]

{ #category : '*Carrefour-Esope' }
FASTEsopeModel >> carrefourBinderVisitor [

	^CRFEsopeBinderVisitor new
]

{ #category : '*Carrefour-Esope' }
FASTEsopeModel >> cleanupFakeIncludeSubroutine [

	| fakeSubrtn includedFile |
	fakeSubrtn := (self allWithType: FASTFortranSubroutine) first.
	includedFile := self newIncludedFile.

	includedFile name: fakeSubrtn name.
	includedFile statementBlock: fakeSubrtn statementBlock.
	fakeSubrtn declarations copy do: [ :decl | includedFile addDeclaration: decl ].

	fakeSubrtn statementBlock: nil.
	fakeSubrtn programFile: nil.

	self remove: fakeSubrtn.

]

{ #category : '*Carrefour-Esope' }
FASTEsopeModel >> setMetamodelToCarrefour [

	self metamodel: CRFEsopeModel metamodel
]
