"
Configuration for using the Bootstrap and Magritte project for seaside applications
"
Class {
	#name : #ConfigurationOfBootstrapMagritte,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfBootstrapMagritte
}

{ #category : #'development support' }
ConfigurationOfBootstrapMagritte class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfBootstrapMagritte class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfBootstrapMagritte class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfBootstrapMagritte class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfBootstrapMagritte class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfBootstrapMagritte class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfBootstrapMagritte class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfBootstrapMagritte class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfBootstrapMagritte class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfBootstrapMagritte class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfBootstrapMagritte >> baseline010: spec [ 
        <version: '0.1.0-baseline'>
        
	spec for: #common do: [
		spec blessing: #baseline.
		spec description: 'First baseline, including magritte'.
            spec author: 'Torsten Bergmann'.
            spec timestamp: '01/10/2014 20:00'.		
		spec repository: 'http://smalltalkhub.com/mc/TorstenBergmann/BootstrapMagritte/main/'.    
		
		spec project: 'Bootstrap' with: [
			spec
				className: 'ConfigurationOfBootstrap';
				repository: 'http://smalltalkhub.com/mc/TorstenBergmann/Bootstrap/main';
				versionString: #'stable'. ].

		spec project: 'Magritte3' with: [
				spec
					className: 'ConfigurationOfMagritte3';
					versionString: #'stable';
					loads: #( 'Seaside' );
					repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main' ].
				            
		spec package: 'Bootstrap-Magritte-Core' with: [ spec requires: #('Bootstrap' 'Magritte3') ].
		spec package: 'Bootstrap-Magritte-Examples' with: [ spec requires: 'Bootstrap-Magritte-Core' ].
		
		spec group: 'default' with: #('Bootstrap-Magritte-Core' 'Bootstrap-Magritte-Examples') ].
			
]

{ #category : #baselines }
ConfigurationOfBootstrapMagritte >> baseline020: spec [ 
        <version: '0.2.0-baseline'>
        
	spec for: #common do: [
		spec blessing: #baseline.
		spec description: 'Group definitions in Bootstrap changed'.
            spec author: 'Stephan Eggermont'.
            spec timestamp: '2014-6-11'.		
		spec repository: 'http://smalltalkhub.com/mc/TorstenBergmann/BootstrapMagritte/main/'.    
		
		spec project: 'Bootstrap' with: [
			spec
				className: 'ConfigurationOfBootstrap';
				repository: 'http://smalltalkhub.com/mc/TorstenBergmann/Bootstrap/main';
				versionString: #'stable';
				loads: #( 'core' 'widgets' ) ].

		spec project: 'Magritte3' with: [
				spec
					className: 'ConfigurationOfMagritte3';
					versionString: #'stable';
					loads: #( 'Seaside' );
					repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main' ].
				            
		spec package: 'Bootstrap-Magritte-Core' with: [ spec requires: #('Bootstrap' 'Magritte3') ].
		spec package: 'Bootstrap-Magritte-Examples' with: [ spec requires: 'Bootstrap-Magritte-Core' ].
		
		spec group: 'default' with: #('Bootstrap-Magritte-Core' 'Bootstrap-Magritte-Examples') ].
			
]

{ #category : #baselines }
ConfigurationOfBootstrapMagritte >> baseline030: spec [ 
        <version: '0.3.0-baseline'>
        
	spec for: #common do: [
		spec blessing: #baseline.
		spec description: 'Group definitions in Bootstrap changed'.
            spec author: 'Udo Schneider'.
            spec timestamp: '2014-9-14'.		
		spec repository: 'http://smalltalkhub.com/mc/TorstenBergmann/BootstrapMagritte/main/'.    
		
		spec project: 'Bootstrap' with: [
			spec
				className: 'ConfigurationOfBootstrap';
				repository: 'http://smalltalkhub.com/mc/TorstenBergmann/Bootstrap/main';
				versionString: #'stable';
				loads: #( 'default' ) ].

		spec project: 'Magritte3' with: [
				spec
					className: 'ConfigurationOfMagritte3';
					versionString: #'stable';
					loads: #( 'Seaside' );
					repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main' ].
				            
		spec package: 'Bootstrap-Magritte-Core' with: [ spec requires: #('Bootstrap' 'Magritte3') ].
		spec package: 'Bootstrap-Magritte-Examples' with: [ spec requires: 'Bootstrap-Magritte-Core' ].
		
		spec group: 'default' with: #('Bootstrap-Magritte-Core' 'Bootstrap-Magritte-Examples') ].
			
]

{ #category : #baselines }
ConfigurationOfBootstrapMagritte >> baseline040: spec [ 
        <version: '0.4.0-baseline'>
        
	spec for: #common do: [
		spec blessing: #baseline.
		spec
			description: 'Bootstrap moved to github';
			author: 'Diego Lont';
			timestamp: '2019-5-14';
			repository: 'http://smalltalkhub.com/mc/TorstenBergmann/BootstrapMagritte/main/'.    

		spec
			baseline: 'Bootstrap' with: [
				spec
					repository: 'github://astares/Seaside-Bootstrap';
					loads: #( 'default' ) ];

			baseline: 'Magritte' with: [
				spec
					loads: #( 'Seaside' );
					repository: 'github://magritte-metamodel/magritte/source' ].

		spec
			package: 'Bootstrap-Magritte-Core' with: [ spec requires: #('Bootstrap' 'Magritte') ];
			package: 'Bootstrap-Magritte-Examples' with: [ spec requires: 'Bootstrap-Magritte-Core' ];
		
			group: 'default' with: #('Bootstrap-Magritte-Core' 'Bootstrap-Magritte-Examples') ]
]

{ #category : #accessing }
ConfigurationOfBootstrapMagritte >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfBootstrapMagritte >> development: spec [
	<symbolicVersion: #'development'>
	spec for: #'common' version: '0.2.0'.

	spec for: #'pharo' version: '0.2.4'.

	spec for: #'squeak' version: '0.2.3'.

]

{ #category : #accessing }
ConfigurationOfBootstrapMagritte >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfBootstrapMagritte >> stable: spec [
	<symbolicVersion: #'stable'>
	spec for: #'common' version: '0.2.0'.

	spec for: #'pharo' version: '0.2.4'.
	spec for: #( #'pharo4.x' #'pharo5.x' ) version: '0.2.3'.

	spec for: #'squeak' version: '0.2.3'.

]

{ #category : #versions }
ConfigurationOfBootstrapMagritte >> version010: spec [ 
        <version: '0.1.0' imports: #('0.1.0-baseline')>

        spec for: #common do: [
	            spec blessing: #development.
			spec description: 'Initial development'.
            	spec author: 'Torsten Bergmann'.
            	spec timestamp: '01/10/2014 20:00'.	
			spec project: 'Bootstrap' with: '0.6.0'.		

			"for magritte stable is loaded, see baseline"		
			spec package: 'Bootstrap-Magritte-Core' with: 'Bootstrap-Magritte-Core-TorstenBergmann.9'.
			spec package: 'Bootstrap-Magritte-Examples' with: 'Bootstrap-Magritte-Examples-TorstenBergmann.6'.
                ].
]

{ #category : #versions }
ConfigurationOfBootstrapMagritte >> version020: spec [ 
	<version: '0.2.0' imports: #('0.2.0-baseline')>

	spec for: #common do: [
		spec blessing: #development.
		spec description: 'Modified version to load the latest version, based on Seaside 3.0.x'.
		spec author: 'Diego Lont'.
		spec timestamp: '22 jan. 2014'.	
		spec project: 'Magritte3' with: #'release3.0';
		project: 'Bootstrap' with: '0.9.0'.
			" we do not specify our packages, as this is our development version.
			We want the latest loaded." ].
]

{ #category : #versions }
ConfigurationOfBootstrapMagritte >> version021: spec [ 
	<version: '0.2.1' imports: #('0.2.0-baseline')>

	spec for: #common do: [
		spec blessing: #development.
		spec description: 'Modified version to load the latest version, based on Seaside 3.1.x'.
		spec author: 'Diego Lont'.
		spec timestamp: '22 jan. 2014'.	
		spec project: 'Magritte3' with: #'release3.1';
		project: 'Bootstrap' with: '0.9.0'.
			" we do not specify our packages, as this is our development version.
			We want the latest loaded." ].
]

{ #category : #versions }
ConfigurationOfBootstrapMagritte >> version022: spec [ 
	<version: '0.2.2' imports: #('0.3.0-baseline')>

	spec for: #common do: [
		spec blessing: #development.
		spec description: 'Modified version to load the latest Bootstrap version'.
		spec author: 'Udo Schneider'.
		spec timestamp: '15 sep. 2014'.	
		spec project: 'Magritte3' with: #'release3.1';
		project: 'Bootstrap' with: #stable.
			" we do not specify our packages, as this is our development version.
			We want the latest loaded." ].
]

{ #category : #versions }
ConfigurationOfBootstrapMagritte >> version023: spec [ 
	<version: '0.2.3' imports: #('0.3.0-baseline')>

	spec for: #common do: [
		spec blessing: #development.
		spec description: 'Modified version to load the latest Magritte version'.
		spec author: 'Stephan Eggermont'.
		spec timestamp: '6 okt. 2015'.	
		spec project: 'Magritte3' with: #'release3.5';
		project: 'Bootstrap' with: #stable.
			" we do not specify our packages, as this is our development version.
			We want the latest loaded." ].
]

{ #category : #versions }
ConfigurationOfBootstrapMagritte >> version024: spec [ 
	<version: '0.2.4' imports: #('0.4.0-baseline')>

	spec for: #common do: [
		spec blessing: #development.
		spec description: 'Modified version to load the latest Magritte version'.
		spec author: 'Diego Lont'.
		spec timestamp: '14 may 2019'.	
		" we do not specify our packages, as this is our development version.
			We want the latest loaded." ].
]
