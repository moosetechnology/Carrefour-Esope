Class {
	#name : 'CRFEsopeBindingCleaner',
	#superclass : 'CRFFBindingCleaner',
	#category : 'Carrefour-Esope',
	#package : 'Carrefour-Esope'
}

{ #category : 'visiting' }
CRFEsopeBindingCleaner >> visitFASTEsopeSegment: aFASTEsopeSegment [

	aFASTEsopeSegment famix: nil.
	
	aFASTEsopeSegment statements do: [ :each | each accept: self ].

]
