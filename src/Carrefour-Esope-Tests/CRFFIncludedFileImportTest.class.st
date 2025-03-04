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
CRFFIncludedFileImportTest >> testBindingOneSegment [

	|  entities fmx fast |
	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"comment":" this is an included file","span":"(2:1)-(2:26)","tag":"comment"},{"anno":[],"comment":"@_   segment, truc","span":"(3:1)-(3:19)","tag":"comment"},{"anno":[],"comment":"@_   endsegment","span":"(4:1)-(4:16)","tag":"comment"}],"name":"_$somefile_inc","options":[null,null],"span":"(1:7)-(5:9)","subprograms":null,"tag":"subroutine"}]}'
		forCode:
'      subroutine _$somefile_inc
* this is an included file
c@_   segment, truc
c@_   endsegment
      end
'.
	
	fastModel cleanupFakeIncludeSubroutine.

	(famixModel entityNamed: '_$somefile_inc') bindFastModel: fastModel.

	entities := famixModel allWithType: FamixEsopeSegment.

	self assert: entities size equals: 1.
	fmx := entities anyOne.
	fast := fmx fast.

	self assert: fast isNotNil.
	self assert: fast name equals: 'truc'.
	self assert: fast famix equals: fmx.
]

{ #category : 'tests' }
CRFFIncludedFileImportTest >> testBindingOneSegmentWithOneField [

	|  entities fmx fast |
	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"comment":"@_   segment, truc","span":"(2:1)-(2:19)","tag":"comment"},{"anno":[],"label":null,"span":"(3:7)-(3:19)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(3:15)-(3:19)","type":"scalar","variable":{"anno":[],"span":"(3:15)-(3:19)","tag":"value","value":{"contents":"field","tag":"variable"}}}],"span":"(3:15)-(3:19)"},"span":"(3:7)-(3:19)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(3:7)-(3:13)"}},"tag":"statement"},{"anno":[],"comment":"@_   endsegment","span":"(4:1)-(4:16)","tag":"comment"}],"name":"_$somefile_inc","options":[null,null],"span":"(1:7)-(5:9)","subprograms":null,"tag":"subroutine"}]}'
		forCode:
'      subroutine _$somefile_inc
c@_   segment, truc
      integer field
c@_   endsegment
      end
'.
	
	fastModel cleanupFakeIncludeSubroutine.

	(famixModel entityNamed: '_$somefile_inc') bindFastModel: fastModel.

	entities := famixModel allWithType: FamixFortranAttribute.

	self assert: entities size equals: 1.
	fmx := entities anyOne.
	fast := fmx fastDeclaration.

	self assert: fast isNotNil.
	self assert: fast name equals: 'field'.
	self assert: fast famixDeclaration equals: fmx.
]

{ #category : 'tests' }
CRFFIncludedFileImportTest >> testBindingVariableDeclarationAndSegmentWithField [

	| entities fmx fast |
	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:15)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(2:15)-(2:15)","type":"scalar","variable":{"anno":[],"span":"(2:15)-(2:15)","tag":"value","value":{"contents":"x","tag":"variable"}}}],"span":"(2:15)-(2:15)"},"span":"(2:7)-(2:15)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(2:7)-(2:13)"}},"tag":"statement"},{"anno":[],"comment":"@_   segment, truc","span":"(3:1)-(3:19)","tag":"comment"},{"anno":[],"label":null,"span":"(4:7)-(4:19)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(4:15)-(4:19)","type":"scalar","variable":{"anno":[],"span":"(4:15)-(4:19)","tag":"value","value":{"contents":"field","tag":"variable"}}}],"span":"(4:15)-(4:19)"},"span":"(4:7)-(4:19)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(4:7)-(4:13)"}},"tag":"statement"},{"anno":[],"comment":"@_   endsegment","span":"(5:1)-(5:16)","tag":"comment"}],"name":"_$somefile_inc","options":[null,null],"span":"(1:7)-(6:9)","subprograms":null,"tag":"subroutine"}]}'
		forCode:
'      subroutine _$somefile_inc
      integer x
c@_   segment, truc
      integer field
c@_   endsegment
      end
'.

	fastModel cleanupFakeIncludeSubroutine.

	(famixModel entityNamed: '_$somefile_inc') bindFastModel: fastModel.

	entities := famixModel allWithType: FamixF77Variable.

	self assert: entities size equals: 1.

	fmx := entities anyOne.
	fast := fmx fastDeclaration.

	self assert: fast isNotNil.
	self assert: fast name equals: 'x'.
	self assert: fast famixDeclaration equals: fmx.

	entities := famixModel allWithType: FamixFortranAttribute.

	self assert: entities size equals: 1.

	fmx := entities anyOne.
	fast := fmx fastDeclaration.

	self assert: fast isNotNil.
	self assert: fast name equals: 'field'.
	self assert: fast famixDeclaration equals: fmx.
]

{ #category : 'tests' }
CRFFIncludedFileImportTest >> testBindingVariableDeclarations [

	|  entities fmx fast |
	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"srcCodeOrigin.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"comment":" this is an included file","span":"(2:1)-(2:26)","tag":"comment"},{"anno":[],"label":null,"span":"(3:7)-(3:15)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(3:15)-(3:15)","type":"scalar","variable":{"anno":[],"span":"(3:15)-(3:15)","tag":"value","value":{"contents":"x","tag":"variable"}}}],"span":"(3:15)-(3:15)"},"span":"(3:7)-(3:15)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(3:7)-(3:13)"}},"tag":"statement"},{"anno":[],"label":null,"span":"(4:7)-(4:15)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(4:15)-(4:15)","type":"scalar","variable":{"anno":[],"span":"(4:15)-(4:15)","tag":"value","value":{"contents":"y","tag":"variable"}}}],"span":"(4:15)-(4:15)"},"span":"(4:7)-(4:15)","tag":"declaration","type":{"anno":[],"base_type":"logical","selector":null,"span":"(4:7)-(4:13)"}},"tag":"statement"}],"name":"_$somefile_inc","options":[null,null],"span":"(1:7)-(5:9)","subprograms":null,"tag":"subroutine"}]}'
		forCode:
'      subroutine _$somefile_inc
* this is an included file
      integer x
      logical y
      end
'.

	fastModel cleanupFakeIncludeSubroutine.

	(famixModel entityNamed: '_$somefile_inc') bindFastModel: fastModel.

	entities := famixModel allWithType: FamixF77Variable.

	self assert: entities size equals: 2.

	fmx := entities detect: [:e | e name = 'x' ].

	fast := fmx fastDeclaration.

	self assert: fast isNotNil.
	self assert: fast name equals: 'x'.
	self assert: fast famixDeclaration equals: fmx.

	fmx := entities detect: [:e | e name = 'y' ].

	fast := fmx fastDeclaration.

	self assert: fast isNotNil.
	self assert: fast name equals: 'y'.
	self assert: fast famixDeclaration equals: fmx.
]

{ #category : 'tests' }
CRFFIncludedFileImportTest >> testOneSegment [
	"For included files, a fake subroutine is created to make it syntactically correct
	 the esope importer removes it by calling #cleanupFakeIncludeSubroutine
	Here we call the method directly"

	| includedFile |
	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"comment":" this is an included file","span":"(2:1)-(2:26)","tag":"comment"},{"anno":[],"comment":"@_   segment, truc","span":"(3:1)-(3:19)","tag":"comment"},{"anno":[],"comment":"@_   endsegment","span":"(4:1)-(4:16)","tag":"comment"}],"name":"_$somefile_inc","options":[null,null],"span":"(1:7)-(5:9)","subprograms":null,"tag":"subroutine"}]}'
		forCode:
'      subroutine _$somefile_inc
* this is an included file
c@_   segment, truc
c@_   endsegment
      end
'.

	fastModel cleanupFakeIncludeSubroutine.

	self assert: (fastModel allWithType: FASTFortranSubroutine) isEmpty.
	self assert: (fastModel allWithType: FASTFortranIncludedFile) size equals: 1.

	includedFile := (fastModel allWithType: FASTFortranIncludedFile) anyOne.
	
	self assert: includedFile declarations size equals: 1
]

{ #category : 'tests' }
CRFFIncludedFileImportTest >> testVariableDeclarations [

	| includedFile |
	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"srcCodeOrigin.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"comment":" this is an included file","span":"(2:1)-(2:26)","tag":"comment"},{"anno":[],"label":null,"span":"(3:7)-(3:15)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(3:15)-(3:15)","type":"scalar","variable":{"anno":[],"span":"(3:15)-(3:15)","tag":"value","value":{"contents":"x","tag":"variable"}}}],"span":"(3:15)-(3:15)"},"span":"(3:7)-(3:15)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(3:7)-(3:13)"}},"tag":"statement"},{"anno":[],"label":null,"span":"(4:7)-(4:15)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(4:15)-(4:15)","type":"scalar","variable":{"anno":[],"span":"(4:15)-(4:15)","tag":"value","value":{"contents":"y","tag":"variable"}}}],"span":"(4:15)-(4:15)"},"span":"(4:7)-(4:15)","tag":"declaration","type":{"anno":[],"base_type":"logical","selector":null,"span":"(4:7)-(4:13)"}},"tag":"statement"}],"name":"_$somefile_inc","options":[null,null],"span":"(1:7)-(5:9)","subprograms":null,"tag":"subroutine"}]}'
		forCode:
'      subroutine _$somefile_inc
* this is an included file
      integer x
      logical y
      end
'.

	fastModel cleanupFakeIncludeSubroutine.

	self assert: (fastModel allWithType: FASTFortranSubroutine) isEmpty.
	self assert: (fastModel allWithType: FASTFortranIncludedFile) size equals: 1.

	includedFile := (fastModel allWithType: FASTFortranIncludedFile) anyOne.
	
	self assert: includedFile statementBlock  statements size equals: 3.
	self assert: includedFile declarations size equals: 0
]

{ #category : 'tests' }
CRFFIncludedFileImportTest >> testVariableDeclarationsAndSegment [

	| includedFile |
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

	fastModel cleanupFakeIncludeSubroutine.

	self assert: (fastModel allWithType: FASTFortranSubroutine) isEmpty.
	self assert: (fastModel allWithType: FASTFortranIncludedFile) size equals: 1.

	includedFile := (fastModel allWithType: FASTFortranIncludedFile) anyOne.
	
	self assert: includedFile statementBlock statements size equals: 2.
	self assert: includedFile declarations size equals: 1
]
