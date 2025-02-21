"
A CRFEsopeBinderVisitorTest is a test class for testing the behavior of CRFEsopeBinderVisitor
"
Class {
	#name : 'CRFEsopeBinderVisitorTest',
	#superclass : 'CRFFAbstractBindTest',
	#category : 'Carrefour-Esope-Tests',
	#package : 'Carrefour-Esope-Tests'
}

{ #category : 'running' }
CRFEsopeBinderVisitorTest >> jsonImporterClass [

	^FASTEsopeJsonVisitor
]

{ #category : 'running' }
CRFEsopeBinderVisitorTest >> newFamixModel [

	^FamixEsopeModel new
]

{ #category : 'tests' }
CRFEsopeBinderVisitorTest >> testMypntInvocation [

	| entities fmx fast |
	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:20)","statement":{"anno":[],"expression":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"expr":{"contents":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":["2",null],"tag":"integer"}},"tag":"expr"},"name":null,"span":"(2:17)-(2:17)"},{"anno":[],"expr":{"contents":{"anno":[],"span":"(2:19)-(2:19)","tag":"value","value":{"contents":["3",null],"tag":"integer"}},"tag":"expr"},"name":null,"span":"(2:19)-(2:19)"}],"span":"(2:17)-(2:19)"},"function":{"anno":[],"span":"(2:11)-(2:15)","tag":"value","value":{"contents":"mypnt","tag":"variable"}},"span":"(2:11)-(2:20)","tag":"function_call"},"span":"(2:7)-(2:20)","tag":"assign_expression","target":{"anno":[],"span":"(2:7)-(2:7)","tag":"value","value":{"contents":"v","tag":"variable"}}},"tag":"statement"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'
		forCode:
'      program main
      v = mypnt(2,3)
      end
'.

	(famixModel entityNamed: 'main') bindFastModel: fastModel.


	entities := famixModel allWithType: FamixF77Invocation.

	self assert: entities size equals: 1.
	fmx := entities anyOne.
	fast := fmx fast.

	self assert: fast isNotNil.
	self assert: fast famix equals: fmx.
	self assert: fast class equals: FASTFortranFunctionCall.
	self assert: fast name equals: fmx signature.


]

{ #category : 'tests' }
CRFEsopeBinderVisitorTest >> testMypntInvocationTwice [

	| entities |
	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"label":null,"span":"(2:7)-(2:20)","statement":{"anno":[],"expression":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"expr":{"contents":{"anno":[],"span":"(2:17)-(2:17)","tag":"value","value":{"contents":["2",null],"tag":"integer"}},"tag":"expr"},"name":null,"span":"(2:17)-(2:17)"},{"anno":[],"expr":{"contents":{"anno":[],"span":"(2:19)-(2:19)","tag":"value","value":{"contents":["3",null],"tag":"integer"}},"tag":"expr"},"name":null,"span":"(2:19)-(2:19)"}],"span":"(2:17)-(2:19)"},"function":{"anno":[],"span":"(2:11)-(2:15)","tag":"value","value":{"contents":"mypnt","tag":"variable"}},"span":"(2:11)-(2:20)","tag":"function_call"},"span":"(2:7)-(2:20)","tag":"assign_expression","target":{"anno":[],"span":"(2:7)-(2:7)","tag":"value","value":{"contents":"v","tag":"variable"}}},"tag":"statement"},{"anno":[],"label":null,"span":"(3:7)-(3:20)","statement":{"anno":[],"expression":{"anno":[],"arguments":{"anno":[],"list":[{"anno":[],"expr":{"contents":{"anno":[],"span":"(3:17)-(3:17)","tag":"value","value":{"contents":["4",null],"tag":"integer"}},"tag":"expr"},"name":null,"span":"(3:17)-(3:17)"},{"anno":[],"expr":{"contents":{"anno":[],"span":"(3:19)-(3:19)","tag":"value","value":{"contents":["5",null],"tag":"integer"}},"tag":"expr"},"name":null,"span":"(3:19)-(3:19)"}],"span":"(3:17)-(3:19)"},"function":{"anno":[],"span":"(3:11)-(3:15)","tag":"value","value":{"contents":"mypnt","tag":"variable"}},"span":"(3:11)-(3:20)","tag":"function_call"},"span":"(3:7)-(3:20)","tag":"assign_expression","target":{"anno":[],"span":"(3:7)-(3:7)","tag":"value","value":{"contents":"x","tag":"variable"}}},"tag":"statement"}],"name":"main","span":"(1:7)-(4:9)","subprograms":null,"tag":"main"}]}'
		forCode:
'      program main
      v = mypnt(2,3)
      x = mypnt(4,5)
      end
'.

	(famixModel entityNamed: 'main') bindFastModel: fastModel.

	entities := famixModel allWithType: FamixF77Invocation.

	self assert: entities size equals: 2.

	entities do: [ :invocation |
		self assert: invocation fast isNotNil.
		self assert: invocation fast famix equals: invocation
	]

]

{ #category : 'tests' }
CRFEsopeBinderVisitorTest >> testPointerDeclaration [

	| entities fmx fast |	self
		createModels: '{"meta":{"miVersion":"fortran77","miFilename":"./srcCodeOrigin.f"},"program_units":[{"anno":[],"blocks":[{"anno":[],"comment":"@_   pointeur p.seg","span":"(2:1)-(2:20)","tag":"comment"}],"name":"main","span":"(1:7)-(3:9)","subprograms":null,"tag":"main"}]}'
		forCode:
'      program main
C@_   pointeur p.seg
      end
'.

	(famixModel entityNamed: 'main') bindFastModel: fastModel.


	entities := famixModel allWithType: FamixF77Variable.

	self assert: entities size equals: 1.
	fmx := entities anyOne.
	fast := fmx fastDeclaration.

	self assert: fast name equals: 'p'
]
