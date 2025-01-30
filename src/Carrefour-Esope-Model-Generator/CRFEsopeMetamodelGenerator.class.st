Class {
	#name : 'CRFEsopeMetamodelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'famixSegment',
		'fastSegment',
		'famixVariable',
		'fastPointerDeclarationStatement'
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
		FamixFortran77Generator.
		FASTEsopeGenerator 
	}
]

{ #category : 'definition' }
CRFEsopeMetamodelGenerator >> defineClasses [

	super defineClasses.

	famixSegment := self remoteEntity: #Segment withPrefix: #FamixEsope.

	fastSegment := self remoteEntity: #Segment withPrefix: #FASTEsope.
	
	famixVariable := self remoteEntity: #Variable withPrefix: #FamixF77.
	fastPointerDeclarationStatement := self remoteEntity: #PointerDeclarationStatement withPrefix: #FASTEsope.


]

{ #category : 'definition' }
CRFEsopeMetamodelGenerator >> defineRelations [
	super defineRelations.

	(famixSegment property: #fast) - (fastSegment property: #famix).
	(famixVariable property: #fast) - (fastPointerDeclarationStatement property: #famix)
]
