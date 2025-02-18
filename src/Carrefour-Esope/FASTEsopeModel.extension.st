Extension { #name : 'FASTEsopeModel' }

{ #category : '*Carrefour-Esope' }
FASTEsopeModel >> carrefourBinderCleaner [

	^ CRFEsopeBindingCleanerVisitor new
]

{ #category : '*Carrefour-Esope' }
FASTEsopeModel >> carrefourBinderVisitor [

	^ CRFEsopeBinderVisitor new
]
