Class {
	#name : 'CRFEsopeMetamodelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'famixSegment',
		'fastSegment',
		'fastPointerDeclarationStatement',
		'famixPointer'
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
		FASTEsopeGenerator 
	}
]

{ #category : 'definition' }
CRFEsopeMetamodelGenerator >> defineClasses [

	super defineClasses.

	famixSegment := self remoteEntity: #Segment withPrefix: #FamixEsope.

	fastSegment := self remoteEntity: #Segment withPrefix: #FASTEsope.
	
	famixPointer := self remoteEntity: #Pointer withPrefix: #FamixEsope.
	fastPointerDeclarationStatement := self remoteEntity: #PointerDeclarationStatement withPrefix: #FASTEsope.


]

{ #category : 'definition' }
CRFEsopeMetamodelGenerator >> defineRelations [
	super defineRelations.

	(famixSegment property: #fast) - (fastSegment property: #famix).
	(famixPointer property: #fast) - (fastPointerDeclarationStatement property: #famix)
]
