Class {
	#name : 'BaselineOfCarrefourEsope',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfCarrefourEsope',
	#package : 'BaselineOfCarrefourEsope'
}

{ #category : 'baselines' }
BaselineOfCarrefourEsope >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec description: 'Binding FAST and Famix for Esope (Segment)'.
			spec repository:
				'https://github.com/moosetechnology/Carrefour-Esope:main'.
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : 'baselines' }
BaselineOfCarrefourEsope >> defineDependencies: spec [
	spec
		baseline: 'Esope'
		with: [ spec
				loads: #('all');
				repository: 'github://moosetechnology/Esope' ] ;

		baseline: 'FASTEsope'
		with: [ spec
				loads: #('default');
				repository: 'github://moosetechnology/FAST-Esope' ] ;

		baseline: 'CarrefourFortran'
		with: [ spec
				loads: #('default');
				repository: 'github://moosetechnology/Carrefour-Fortran' ]

]

{ #category : 'baselines' }
BaselineOfCarrefourEsope >> defineGroups: spec [
	
	spec
		group: 'core' with: #( 'Carrefour-Esope-Model' 'Carrefour-Esope' );
		group: 'all' with: #( 'core' 'Carrefour-Esope-Tests' 'Carrefour-Esope-Model-Generator' );
		group: 'default' with: #('core')
]

{ #category : 'baselines' }
BaselineOfCarrefourEsope >> definePackages: spec [
	spec
		package: 'Carrefour-Esope-Model-Generator' ;
		package: 'Carrefour-Esope-Model'
			with: [ spec requires: #('Esope' 'FASTEsope') ];
		package: 'Carrefour-Esope'
			with: [ spec requires: #('CarrefourFortran' 'Carrefour-Esope-Model') ] ;
		package: 'Carrefour-Esope-Tests'
			with: [ spec requires: #('Carrefour-Esope') ]


]
