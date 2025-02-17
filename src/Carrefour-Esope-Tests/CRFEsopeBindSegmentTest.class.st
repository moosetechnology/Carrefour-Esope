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

{ #category : 'running' }
CRFEsopeBindSegmentTest >> newFamixModel [

	^ FamixEsopeModel new
]

{ #category : 'as yet unclassified' }
CRFEsopeBindSegmentTest >> testAssignmentWithDeclaredPointerVariableAndExpressionBothFieldAccess [

	| entities fmx |

	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"comment":"@_   pointeur var.VARSEG","span":"(2:1)-(2:25)","tag":"comment"},{"anno":[],"comment":"@_   pointeur expr.EXPRSEG","span":"(3:1)-(3:27)","tag":"comment"},{"anno":[],"label":null,"span":"(4:7)-(4:35)","statement":{"anno":[],"expression":{"anno":[],"expression":{"anno":[],"span":"(4:22)-(4:25)","tag":"value","value":{"contents":"expr","tag":"variable"}},"field":{"anno":[],"span":"(4:27)-(4:35)","tag":"value","value":{"contents":"exprfield","tag":"variable"}},"span":"(4:22)-(4:35)","tag":"deref"},"span":"(4:7)-(4:35)","tag":"assign_expression","target":{"anno":[],"expression":{"anno":[],"span":"(4:7)-(4:9)","tag":"value","value":{"contents":"var","tag":"variable"}},"field":{"anno":[],"span":"(4:11)-(4:18)","tag":"value","value":{"contents":"varfield","tag":"variable"}},"span":"(4:7)-(4:18)","tag":"deref"}},"tag":"statement"}],"name":"blah","options":[null,null],"span":"(1:7)-(5:9)","subprograms":null,"tag":"subroutine"}]}'
		forCode: 
'      subroutine blah
c@_   pointeur var.VARSEG
c@_   pointeur expr.EXPRSEG
      var.varfield = expr.exprfield
      end
'.

	(famixModel entityNamed: 'blah') bindFastModel: fastModel.

	entities := famixModel allWithType: FamixF77PUSubroutine.

	self assert: entities size equals: 1.
	fmx := entities anyOne.

	self assert: fmx fast isNotNil.
]

{ #category : 'as yet unclassified' }
CRFEsopeBindSegmentTest >> testAssignmentWithDeclaredPointerVariableAndExpressionBothFieldAccessWithTheirSegment [

	| entities fmx |

	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"comment":"@_   segment VARSEG","span":"(2:1)-(2:20)","tag":"comment"},{"anno":[],"label":null,"span":"(3:7)-(3:22)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(3:15)-(3:22)","type":"scalar","variable":{"anno":[],"span":"(3:15)-(3:22)","tag":"value","value":{"contents":"varfield","tag":"variable"}}}],"span":"(3:15)-(3:22)"},"span":"(3:7)-(3:22)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(3:7)-(3:13)"}},"tag":"statement"},{"anno":[],"comment":"@_   end segment","span":"(4:1)-(4:17)","tag":"comment"},{"anno":[],"comment":"@_   segment EXPRSEG","span":"(5:1)-(5:21)","tag":"comment"},{"anno":[],"label":null,"span":"(6:7)-(6:23)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(6:15)-(6:23)","type":"scalar","variable":{"anno":[],"span":"(6:15)-(6:23)","tag":"value","value":{"contents":"exprfield","tag":"variable"}}}],"span":"(6:15)-(6:23)"},"span":"(6:7)-(6:23)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(6:7)-(6:13)"}},"tag":"statement"},{"anno":[],"comment":"@_   end segment","span":"(7:1)-(7:17)","tag":"comment"},{"anno":[],"comment":"@_   pointeur var.VARSEG","span":"(8:1)-(8:25)","tag":"comment"},{"anno":[],"comment":"@_   pointeur expr.EXPRSEG","span":"(9:1)-(9:27)","tag":"comment"},{"anno":[],"label":null,"span":"(10:7)-(10:35)","statement":{"anno":[],"expression":{"anno":[],"expression":{"anno":[],"span":"(10:22)-(10:25)","tag":"value","value":{"contents":"expr","tag":"variable"}},"field":{"anno":[],"span":"(10:27)-(10:35)","tag":"value","value":{"contents":"exprfield","tag":"variable"}},"span":"(10:22)-(10:35)","tag":"deref"},"span":"(10:7)-(10:35)","tag":"assign_expression","target":{"anno":[],"expression":{"anno":[],"span":"(10:7)-(10:9)","tag":"value","value":{"contents":"var","tag":"variable"}},"field":{"anno":[],"span":"(10:11)-(10:18)","tag":"value","value":{"contents":"varfield","tag":"variable"}},"span":"(10:7)-(10:18)","tag":"deref"}},"tag":"statement"}],"name":"blah","options":[null,null],"span":"(1:7)-(11:9)","subprograms":null,"tag":"subroutine"}]}'
		forCode: 
'      subroutine blah
c@_   segment VARSEG
      integer varfield
c@_   end segment
c@_   segment EXPRSEG
      integer exprfield
c@_   end segment
c@_   pointeur var.VARSEG
c@_   pointeur expr.EXPRSEG
      var.varfield = expr.exprfield
      end
'.

	(famixModel entityNamed: 'blah') bindFastModel: fastModel.

	entities := famixModel allWithType: FamixF77PUSubroutine.

	self assert: entities size equals: 1.
	fmx := entities anyOne.

	self assert: fmx fast isNotNil.
]

{ #category : 'as yet unclassified' }
CRFEsopeBindSegmentTest >> testAssignmentWithVariableAndExpressionBothFieldAccess [

	| entities fmx |

	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:35)","statement":{"anno":[],"expression":{"anno":[],"expression":{"anno":[],"span":"(2:22)-(2:25)","tag":"value","value":{"contents":"expr","tag":"variable"}},"field":{"anno":[],"span":"(2:27)-(2:35)","tag":"value","value":{"contents":"exprfield","tag":"variable"}},"span":"(2:22)-(2:35)","tag":"deref"},"span":"(2:7)-(2:35)","tag":"assign_expression","target":{"anno":[],"expression":{"anno":[],"span":"(2:7)-(2:9)","tag":"value","value":{"contents":"var","tag":"variable"}},"field":{"anno":[],"span":"(2:11)-(2:18)","tag":"value","value":{"contents":"varfield","tag":"variable"}},"span":"(2:7)-(2:18)","tag":"deref"}},"tag":"statement"}],"name":"blah","options":[null,null],"span":"(1:7)-(3:9)","subprograms":null,"tag":"subroutine"}]}'
		forCode: 
'      subroutine blah
      var.varfield = expr.exprfield
      end
'.

	(famixModel entityNamed: 'blah') bindFastModel: fastModel.

	entities := famixModel allWithType: FamixF77PUSubroutine.

	self assert: entities size equals: 1.
	fmx := entities anyOne.

	self assert: fmx fast isNotNil.
]

{ #category : 'as yet unclassified' }
CRFEsopeBindSegmentTest >> testAssignmentWithVariableAndExpressionFieldAccess [

	| entities fmx |

	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:26)","statement":{"anno":[],"expression":{"anno":[],"expression":{"anno":[],"span":"(2:13)-(2:16)","tag":"value","value":{"contents":"expr","tag":"variable"}},"field":{"anno":[],"span":"(2:18)-(2:26)","tag":"value","value":{"contents":"exprfield","tag":"variable"}},"span":"(2:13)-(2:26)","tag":"deref"},"span":"(2:7)-(2:26)","tag":"assign_expression","target":{"anno":[],"span":"(2:7)-(2:9)","tag":"value","value":{"contents":"var","tag":"variable"}}},"tag":"statement"}],"name":"blah","options":[null,null],"span":"(1:7)-(3:9)","subprograms":null,"tag":"subroutine"}]}'
		forCode:
'      subroutine blah
      var = expr.exprfield
      end
'.

	(famixModel entityNamed: 'blah') bindFastModel: fastModel.

	entities := famixModel allWithType: FamixF77PUSubroutine.

	self assert: entities size equals: 1.
	fmx := entities anyOne.

	self assert: fmx fast isNotNil.
]

{ #category : 'as yet unclassified' }
CRFEsopeBindSegmentTest >> testAssignmentWithVariableFieldAccessAndExpression [

	| entities fmx |

	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:25)","statement":{"anno":[],"expression":{"anno":[],"span":"(2:22)-(2:25)","tag":"value","value":{"contents":"expr","tag":"variable"}},"span":"(2:7)-(2:25)","tag":"assign_expression","target":{"anno":[],"expression":{"anno":[],"span":"(2:7)-(2:9)","tag":"value","value":{"contents":"var","tag":"variable"}},"field":{"anno":[],"span":"(2:11)-(2:18)","tag":"value","value":{"contents":"varfield","tag":"variable"}},"span":"(2:7)-(2:18)","tag":"deref"}},"tag":"statement"}],"name":"blah","options":[null,null],"span":"(1:7)-(3:9)","subprograms":null,"tag":"subroutine"}]}'
		forCode:
'      subroutine blah
      var.varfield = expr
      end
'.

	(famixModel entityNamed: 'blah') bindFastModel: fastModel.

	entities := famixModel allWithType: FamixF77PUSubroutine.

	self assert: entities size equals: 1.
	fmx := entities anyOne.

	self assert: fmx fast isNotNil.
]

{ #category : 'as yet unclassified' }
CRFEsopeBindSegmentTest >> testAssignmentWithVariableFieldAccessAndLiteralExpression [

	| entities segment fmx fast |
	
	segment := famixModel newSegment name: 'toto'.
	segment addAttribute: (famixModel newAttributeNamed: 'varfield').

	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"arguments":null,"blocks":[{"anno":[],"comment":"@_   pointeur var.toto","span":"(2:1)-(2:23)","tag":"comment"},{"anno":[],"label":null,"span":"(3:7)-(3:22)","statement":{"anno":[],"expression":{"anno":[],"span":"(3:22)-(3:22)","tag":"value","value":{"contents":["2",null],"tag":"integer"}},"span":"(3:7)-(3:22)","tag":"assign_expression","target":{"anno":[],"expression":{"anno":[],"span":"(3:7)-(3:9)","tag":"value","value":{"contents":"var","tag":"variable"}},"field":{"anno":[],"span":"(3:11)-(3:18)","tag":"value","value":{"contents":"varfield","tag":"variable"}},"span":"(3:7)-(3:18)","tag":"deref"}},"tag":"statement"}],"name":"blah","options":[null,null],"span":"(1:7)-(4:9)","subprograms":null,"tag":"subroutine"}]}'
		forCode:
'      subroutine blah
c@_   pointeur var.toto
      var.varfield = 2
      end
'.

	(famixModel entityNamed: 'blah') bindFastModel: fastModel.

	entities := famixModel allWithType: FamixF77Variable.

	self assert: entities size equals: 1.

	fmx := entities anyOne.
	fast := fmx fastUses.

	self assert: fast size equals: 1.
	self assert: fast anyOne class equals: FASTFortranScalarVariable.
	self assert: fast anyOne name equals: fmx name.
	self assert: fast anyOne famixVariable equals: fmx.

	entities := famixModel allWithType: FamixFortranAttribute.

	self assert: entities size equals: 1.

	fmx := entities anyOne.
	fast := fmx fastUses.

	self assert: fast size equals: 1.
	self assert: fast anyOne class equals: FASTFortranScalarVariable.
	self assert: fast anyOne name equals: fmx name.
	self assert: fast anyOne famixVariable equals: fmx.
]

{ #category : 'tests' }
CRFEsopeBindSegmentTest >> testSegmentEmpty [

	| fmx fast entities |
	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"comment":"@_   segment, book","span":"(2:1)-(2:19)","tag":"comment"},{"anno":[],"comment":"@_   end segment","span":"(3:1)-(3:17)","tag":"comment"}],"name":"main","span":"(1:7)-(4:17)","subprograms":null,"tag":"main"}]}'
		forCode:
'      program main
c@_   segment, book
c@_   end segment
      end program
'.

	(famixModel entityNamed: 'main') bindFastModel: fastModel.
	
	entities := famixModel allWithType: FamixEsopeSegment.

	self assert: entities size equals: 1.

	fmx := entities anyOne.

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
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"comment":"@_   segment, book","span":"(2:1)-(2:19)","tag":"comment"},{"anno":[],"label":null,"span":"(3:8)-(3:26)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(3:21)-(3:26)","type":"scalar","variable":{"anno":[],"span":"(3:21)-(3:26)","tag":"value","value":{"contents":"btitle","tag":"variable"}}}],"span":"(3:21)-(3:26)"},"span":"(3:8)-(3:26)","tag":"declaration","type":{"anno":[],"base_type":"character","selector":{"anno":[],"kind":null,"length":{"anno":[],"span":"(3:18)-(3:19)","tag":"value","value":{"contents":["40",null],"tag":"integer"}},"span":"(3:17)-(3:19)"},"span":"(3:8)-(3:19)"}},"tag":"statement"},{"anno":[],"label":null,"span":"(4:8)-(4:21)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(4:16)-(4:21)","type":"scalar","variable":{"anno":[],"span":"(4:16)-(4:21)","tag":"value","value":{"contents":"bpages","tag":"variable"}}}],"span":"(4:16)-(4:21)"},"span":"(4:8)-(4:21)","tag":"declaration","type":{"anno":[],"base_type":"integer","selector":null,"span":"(4:8)-(4:14)"}},"tag":"statement"},{"anno":[],"label":null,"span":"(5:8)-(5:16)","statement":{"anno":[],"attributes":null,"declarators":{"anno":[],"list":[{"anno":[],"initial":null,"length":null,"span":"(5:13)-(5:16)","type":"scalar","variable":{"anno":[],"span":"(5:13)-(5:16)","tag":"value","value":{"contents":"budc","tag":"variable"}}}],"span":"(5:13)-(5:16)"},"span":"(5:8)-(5:16)","tag":"declaration","type":{"anno":[],"base_type":"real","selector":null,"span":"(5:8)-(5:11)"}},"tag":"statement"},{"anno":[],"comment":"@_   end segment","span":"(6:1)-(6:17)","tag":"comment"}],"name":"main","span":"(1:7)-(7:17)","subprograms":null,"tag":"main"}]}'
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
