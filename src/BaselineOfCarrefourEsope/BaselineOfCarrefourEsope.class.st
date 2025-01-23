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
		do: [ spec blessing: #baseline.
			spec description: 'Binding FAST and Famix for Esope (Segment)'.
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : 'baselines' }
BaselineOfCarrefourEsope >> defineDependencies: spec [
	spec
		baseline: 'FASTEsope'
		with: [ spec
				loads: #('default');
				repository: 'https://github.com/moosetechnology/FAST-Esope' ] ;

		baseline: 'Esope'
		with: [ spec
				loads: #('default');
				repository: 'https://github.com/moosetechnology/Esope' ] ;

		baseline: 'Carrefour-Fortran'
		with: [ spec
				loads: #('default');
				repository: 'https://github.com/moosetechnology/Carrefour-Fortran' ]

]

{ #category : 'baselines' }
BaselineOfCarrefourEsope >> defineGroups: spec [
	spec
		group: 'core' with: #('Carrefour-Esope-Model' 'Carrefour-Esope' 'Carrefour-Esope-Tests');
		group: 'default' with: #('core')
]

{ #category : 'baselines' }
BaselineOfCarrefourEsope >> definePackages: spec [
	spec
		package: 'Carrefour-Esope-Model'
			with: [ spec requires: #('Esope' 'FASTEsope') ];
		package: 'Carrefour-Esope-Model-Generator' ;
		package: 'Carrefour-Esope'
			with: [ spec requires: #('Carrefour-Fortran' 'Carrefour-Esope-Model') ] ;
		package: 'Carrefour-Esope-Tests'
			with: [ spec requires: #('Carrefour-Fortran') ]


]
