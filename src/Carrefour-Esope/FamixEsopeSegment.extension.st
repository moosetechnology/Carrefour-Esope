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

	| fortranCode tempModel |
	self assert: self sourceAnchor isNotNil.
	
	sourceAnchor endLine: sourceAnchor endLine + 1.

	fortranCode := String streamContents:  [  :aStream | 
		FortranProjectImporter new 
			writeFakeEsopeProgramUnit: self name 
			from: self sourceAnchor sourceText
			on: aStream
	].

	tempModel := self mooseModel fastImporter onSourceString: fortranCode.

	tempModel remove: (tempModel allWithType: FASTFortranSubroutine) first.
	
	^tempModel

]
