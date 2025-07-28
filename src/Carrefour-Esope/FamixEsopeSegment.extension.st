Extension { #name : 'FamixEsopeSegment' }

{ #category : '*Carrefour-Esope' }
FamixEsopeSegment >> bindFASTModel [

	| fastModel |
	self assert: self sourceAnchor isNotNil.

	fastModel := self importFASTModel
		setMetamodelToCarrefour ;
		yourself.

	self bindFastModel: fastModel.

	^ fastModel
]

{ #category : '*Carrefour-Esope' }
FamixEsopeSegment >> bindFastModel: fastModel [

	fastModel carrefourBinderVisitor
		bindFastModel: fastModel
		toFamixEntity: self
]

{ #category : '*Carrefour-Esope' }
FamixEsopeSegment >> importFASTModel [

	| fortranCode tempFastModel fakeSubroutine |
	self assert: self sourceAnchor isNotNil.

	sourceAnchor endLine: sourceAnchor endLine + 1.

	fortranCode := String streamContents:  [  :aStream | 
		FamixFortranImporter new 
			writeFakeEsopeProgramUnit: self name 
			from: self sourceAnchor sourceText
			on: aStream
	].

	tempFastModel := self mooseModel fastImporter onSourceString: fortranCode.

	fakeSubroutine := (tempFastModel allWithType: FASTFortranSubroutine) first.
	fakeSubroutine statementBlock: nil.
	fakeSubroutine programFile: nil.

	tempFastModel remove: fakeSubroutine.

	^tempFastModel

]
