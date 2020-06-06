Class {
	#name : #BaselineOfBootstrapMagritte,
	#superclass : #BaselineOf,
	#category : #BaselineOfBootstrapMagritte
}

{ #category : #baselines }
BaselineOfBootstrapMagritte >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Bootstrap'
					with: [ spec
						repository: 'github://astares/Seaside-Bootstrap';
						loads: #('default') ];
				baseline: 'Magritte'
					with: [ spec
						loads: #('Seaside');
						repository: 'github://magritte-metamodel/magritte/source' ].
			spec
				package: 'Bootstrap-Magritte-Core'
					with: [ spec requires: #('Bootstrap' 'Magritte') ];
				package: 'Bootstrap-Magritte-Examples'
					with: [ spec requires: 'Bootstrap-Magritte-Core' ];
				group: 'default'
					with: #('Bootstrap-Magritte-Core' 'Bootstrap-Magritte-Examples') ]
]
