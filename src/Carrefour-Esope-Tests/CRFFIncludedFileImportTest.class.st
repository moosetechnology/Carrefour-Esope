Class {
	#name : 'CRFFIncludedFileImportTest',
	#superclass : 'CRFFAbstractBindTest',
	#category : 'Carrefour-Esope-Tests',
	#package : 'Carrefour-Esope-Tests'
}

{ #category : 'running' }
CRFFIncludedFileImportTest >> createModels: jsonSource forCode: fortranCode [

	super createModels: jsonSource forCode: fortranCode.

	(famixModel allWithType: FamixF77ProgramFile) anyOne filename asFileReference  ensureDelete
		writeStreamDo: [ : str | str << fortranCode ].
]

{ #category : 'running' }
CRFFIncludedFileImportTest >> jsonImporterClass [

	^FASTEsopeJsonVisitor
]

{ #category : 'running' }
CRFFIncludedFileImportTest >> newFamixModel [

	^FamixEsopeModel new
]

{ #category : 'tests' }
CRFFIncludedFileImportTest >> testOneSegment [

	| tempFastModel includedFile |
	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"comment":" this is an included file","span":"(2:1)-(2:26)","tag":"comment"},{"anno":[],"comment":"@_   segment, truc","span":"(3:1)-(3:19)","tag":"comment"},{"anno":[],"comment":"@_   endsegment","span":"(4:1)-(4:16)","tag":"comment"}],"name":"_$somefile_inc","options":[null,null],"span":"(1:7)-(5:9)","subprograms":null,"tag":"subroutine"}]}'
		forCode:
'      subroutine _$somefile_inc
* this is an included file
c@_   segment, truc
c@_   endsegment
      end
'.

	tempFastModel := (famixModel entityNamed: '_$somefile_inc') importFASTModel.

	self assert: (tempFastModel allWithType: FASTFortranSubroutine) isEmpty.
	self assert: (tempFastModel allWithType: FASTFortranIncludedFile) size equals: 1.

	includedFile := (tempFastModel allWithType: FASTFortranIncludedFile) anyOne.
	
	self assert: includedFile declarations size equals: 1
]

{ #category : 'tests' }
CRFFIncludedFileImportTest >> testVariableDeclarations [

	| tempFastModel includedFile |
	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"srcCodeOrigin.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"comment":" this is an included file","span":"(2:1)-(2:26)","tag":"comment"},{"anno":[],"label":null,"span":"(3:7)-(3:15)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(3:15)-(3:15)","type":"scalar","variable":{"anno":[],"span":"(3:15)-(3:15)","tag":"value","value":{"contents":"x","tag":"variable"}}}],"span":"(3:15)-(3:15)"},"span":"(3:7)-(3:15)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(3:7)-(3:13)"}},"tag":"statement"},{"anno":[],"label":null,"span":"(4:7)-(4:15)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(4:15)-(4:15)","type":"scalar","variable":{"anno":[],"span":"(4:15)-(4:15)","tag":"value","value":{"contents":"y","tag":"variable"}}}],"span":"(4:15)-(4:15)"},"span":"(4:7)-(4:15)","tag":"declaration","type":{"anno":[],"base_type":"logical","selector":null,"span":"(4:7)-(4:13)"}},"tag":"statement"}],"name":"_$somefile_inc","options":[null,null],"span":"(1:7)-(5:9)","subprograms":null,"tag":"subroutine"}]}'
		forCode:
'      subroutine _$somefile_inc
* this is an included file
      integer x
      logical y
      end
'.

	tempFastModel := (famixModel entityNamed: '_$somefile_inc') importFASTModel.

	self assert: (tempFastModel allWithType: FASTFortranSubroutine) isEmpty.
	self assert: (tempFastModel allWithType: FASTFortranIncludedFile) size equals: 1.

	includedFile := (tempFastModel allWithType: FASTFortranIncludedFile) anyOne.
	
	self assert: includedFile statements size equals: 3.
	self assert: includedFile declarations size equals: 0
]

{ #category : 'tests' }
CRFFIncludedFileImportTest >> testVariableDeclarationsAndSegment [

	| tempFastModel includedFile |
	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"srcCodeOrigin.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"comment":" this is an included file","span":"(2:1)-(2:26)","tag":"comment"},{"anno":[],"label":null,"span":"(3:7)-(3:15)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(3:15)-(3:15)","type":"scalar","variable":{"anno":[],"span":"(3:15)-(3:15)","tag":"value","value":{"contents":"x","tag":"variable"}}}],"span":"(3:15)-(3:15)"},"span":"(3:7)-(3:15)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(3:7)-(3:13)"}},"tag":"statement"},{"anno":[],"comment":"@_   segment, truc","span":"(4:1)-(4:19)","tag":"comment"},{"anno":[],"comment":"@_   endsegment","span":"(5:1)-(5:16)","tag":"comment"}],"name":"_$somefile_inc","options":[null,null],"span":"(1:7)-(6:9)","subprograms":null,"tag":"subroutine"}]}'
		forCode:
'      subroutine _$somefile_inc
* this is an included file
      integer x
c@_   segment, truc
c@_   endsegment
      end
'.

	tempFastModel := (famixModel entityNamed: '_$somefile_inc') importFASTModel.

	self assert: (tempFastModel allWithType: FASTFortranSubroutine) isEmpty.
	self assert: (tempFastModel allWithType: FASTFortranIncludedFile) size equals: 1.

	includedFile := (tempFastModel allWithType: FASTFortranIncludedFile) anyOne.
	
	self assert: includedFile statements size equals: 2.
	self assert: includedFile declarations size equals: 1
]
