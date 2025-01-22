Class {
	#name : 'CRFEsopeModel',
	#superclass : 'MooseModel',
	#traits : 'FASTEsopeTEntityCreator + FASTFortranTEntityCreator + FASTTEntityCreator + FamixEsopeTEntityCreator + FamixF77TEntityCreator + FamixFortranTEntityCreator',
	#classTraits : 'FASTEsopeTEntityCreator classTrait + FASTFortranTEntityCreator classTrait + FASTTEntityCreator classTrait + FamixEsopeTEntityCreator classTrait + FamixF77TEntityCreator classTrait + FamixFortranTEntityCreator classTrait',
	#category : 'Carrefour-Esope-Model-Model',
	#package : 'Carrefour-Esope-Model',
	#tag : 'Model'
}

{ #category : 'accessing' }
CRFEsopeModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' #'Famix-FortranUDT-Entities' #'Famix-Fortran77-Entities' #'Famix-Esope-Entities' #'FAST-Fortran-Entities' #'FAST-Esope-Entities' #'FAST-Core-Model')
]

{ #category : 'meta' }
CRFEsopeModel class >> annotation [
	<FMClass: #CRFEsopeModel super: #MooseModel>
	<package: #'Carrefour-Esope-Model'>
	<generated>
]
