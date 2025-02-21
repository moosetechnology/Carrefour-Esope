Class {
	#name : 'CRFEsopeMetamodelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'famixSegment',
		'fastSegment',
		'fastIncludeStatement',
		'famixInclude'
	],
	#category : 'Carrefour-Esope-Model-Generator',
	#package : 'Carrefour-Esope-Model-Generator'
}

{ #category : 'accessing' }
CRFEsopeMetamodelGenerator class >> packageName [
	<ignoreForCoverage>
	^ 'Carrefour-Esope-Model'
]

{ #category : 'accessing' }
CRFEsopeMetamodelGenerator class >> prefix [
	<ignoreForCoverage>
	^ #CRFEsope
]

{ #category : 'accessing' }
CRFEsopeMetamodelGenerator class >> submetamodels [

	^{
		FamixEsopeGenerator .
		FASTEsopeGenerator .
		FamixFortran77Generator
	}
]

{ #category : 'definition' }
CRFEsopeMetamodelGenerator >> defineClasses [

	super defineClasses.

	famixSegment := self remoteEntity: #Segment withPrefix: #FamixEsope.
	fastSegment := self remoteEntity: #Segment withPrefix: #FASTEsope.
	
	fastIncludeStatement := self remoteEntity: #IncludeStatement withPrefix: #FASTEsope.
	famixInclude := self remoteEntity: #Include withPrefix: #FamixF77.

]

{ #category : 'definition' }
CRFEsopeMetamodelGenerator >> defineRelations [
	super defineRelations.

	(famixSegment property: #fast) - (fastSegment property: #famix).

	(famixInclude property: #fastInclude) - (fastIncludeStatement property: #famixInclude)
]
