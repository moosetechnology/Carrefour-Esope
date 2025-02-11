Class {
	#name : 'CRFEsopeBindingCleanerVisitor',
	#superclass : 'FASTFortranVisitor',
	#category : 'Carrefour-Esope',
	#package : 'Carrefour-Esope'
}

{ #category : 'visiting' }
CRFEsopeBindingCleanerVisitor >> fullClean: fastModel [
	"as advertized: tries its best to remove everything from the fastModel to allow
	 garbage collecting the memory used"

	fastModel flushPrivateState.
	fastModel flush.
	self accept: fastModel.
	fastModel removeAll
]

{ #category : 'visiting' }
CRFEsopeBindingCleanerVisitor >> visitFASTEsopeSegment: aFASTEsopeSegment [

	aFASTEsopeSegment famix: nil.
	
	aFASTEsopeSegment statements do: [ :each | each accept: self ].

]
