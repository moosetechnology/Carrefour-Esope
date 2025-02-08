Class {
	#name : 'CRFEsopeBindingCleanerVisitor',
	#superclass : 'FASTFortranVisitor',
	#category : 'Carrefour-Esope',
	#package : 'Carrefour-Esope'
}

{ #category : 'visiting' }
CRFEsopeBindingCleanerVisitor >> visitFASTEsopeSegment: aFASTEsopeSegment [

	aFASTEsopeSegment famix: nil.
	
	aFASTEsopeSegment statements do: [ :each | each accept: self ].

]
