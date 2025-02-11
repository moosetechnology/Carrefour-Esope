Class {
	#name : 'CRFEsopeBindSegmentTest',
	#superclass : 'CRFFAbstractBindTest',
	#category : 'Carrefour-Esope-Tests',
	#package : 'Carrefour-Esope-Tests'
}

{ #category : 'running' }
CRFEsopeBindSegmentTest >> jsonImporterClass [

	^FASTEsopeJsonVisitor
]

{ #category : 'tests' }
CRFEsopeBindSegmentTest >> testSegmentEmpty [

	| fmx fast |
	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"/home/anquetil/Pharo/images/fast-esope-250120/srcCode.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"comment":"@_   segment, book","span":"(2:1)-(2:19)","tag":"comment"},{"anno":[],"comment":"@_   end segment","span":"(3:1)-(3:17)","tag":"comment"}],"name":"main","span":"(1:7)-(4:17)","subprograms":null,"tag":"main"}]}'
		forCode:
'      program main
c@_   segment, book
c@_   end segment
      end program
'.

	fmx := famixModel entityNamed: 'book'.
	fmx bindFastModel: fastModel.

	fast := fmx fast.
	self assert: fast isNotNil.
	self assert: fast class equals: FASTEsopeSegment.
	self assert: fast name equals: fmx name.
	self assert: fast famix equals: fmx

]

{ #category : 'tests' }
CRFEsopeBindSegmentTest >> testSegmentWithMultipleFields [

	| entities fast |
	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"/home/anquetil/Pharo/images/fast-esope-250120/srcCode.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"comment":"@_   segment, book","span":"(2:1)-(2:19)","tag":"comment"},{"anno":[],"label":null,"span":"(3:8)-(3:26)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(3:21)-(3:26)","type":"scalar","variable":{"anno":[],"span":"(3:21)-(3:26)","tag":"value","value":{"contents":"btitle","tag":"variable"}}}],"span":"(3:21)-(3:26)"},"span":"(3:8)-(3:26)","tag":"declaration","type":{"anno":[],"base_type":"character","selector":{"anno":[],"kind":null,"length":{"anno":[],"span":"(3:18)-(3:19)","tag":"value","value":{"contents":["40",null],"tag":"integer"}},"span":"(3:17)-(3:19)"},"span":"(3:8)-(3:19)"}},"tag":"statement"},{"anno":[],"label":null,"span":"(4:8)-(4:21)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(4:16)-(4:21)","type":"scalar","variable":{"anno":[],"span":"(4:16)-(4:21)","tag":"value","value":{"contents":"bpages","tag":"variable"}}}],"span":"(4:16)-(4:21)"},"span":"(4:8)-(4:21)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(4:8)-(4:14)"}},"tag":"statement"},{"anno":[],"label":null,"span":"(5:8)-(5:16)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(5:13)-(5:16)","type":"scalar","variable":{"anno":[],"span":"(5:13)-(5:16)","tag":"value","value":{"contents":"budc","tag":"variable"}}}],"span":"(5:13)-(5:16)"},"span":"(5:8)-(5:16)","tag":"declaration","type":{"anno":[],"base_type":"real","selector":null,"span":"(5:8)-(5:11)"}},"tag":"statement"},{"anno":[],"comment":"@_   end segment","span":"(6:1)-(6:17)","tag":"comment"}],"name":"main","span":"(1:7)-(7:17)","subprograms":null,"tag":"main"}]}'
		forCode:
'      program main
c@_   segment, book
       character*40 btitle
       integer bpages
       real budc
c@_   end segment
      end program
'.

	(famixModel entityNamed: 'book') bindFastModel: fastModel.

	entities := famixModel allWithType: FamixFortranAttribute.

	self assert: entities size equals: 3.
	entities do: [ :fmx |
		fast := fmx fastDeclaration.

		self assert: fast isNotNil.
		self assert: fast class equals: FASTFortranVariableDeclarator.
		self assert: fast name equals: fmx name.
		self assert: fast famixDeclaration equals: fmx
	]

]
