Class {
	#name : 'BaselineOfSpecCore',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSpecCore',
	#package : 'BaselineOfSpecCore'
}

{ #category : 'baseline' }
BaselineOfSpecCore >> baseline: spec [
	<baseline>
	
	spec for: #common do: [ 
		self pillar: spec.
		
		spec
			"Core"
			package: 'Spec2-Layout';
			package: 'Spec2-Core' with: [ spec requires: #('Spec2-Layout') ];
			package: 'Spec2-Dialogs' with: [ spec requires: #('Spec2-Core') ];
			package: 'Spec2-Dialogs-Tests' with: [ spec requires: #('Spec2-Dialogs') ];
			package: 'Spec2-CommandLine' with: [ spec requires: #('Spec2-Core') ];
			package: 'Spec2-Commands';
			package: 'Spec2-Transmission' with: [ spec requires: #('Spec2-Core') ];
			package: 'Spec2-Interactions' with: [ spec requires: #('Spec2-Core') ];
			package: 'Spec2-Commander2' with: [ spec requires: #('Spec2-Core' 'Spec2-Interactions') ];
			"ListView"
			package: 'Spec2-ListView' with: [ spec requires: #('Spec2-Core') ];
			"Code"
			package: 'Spec2-Code' with: [ spec requires: #('Spec2-Core' 'Spec2-Commands') ];
			package: 'Spec2-Code-Commands' with: [ spec requires: #('Spec2-Core' 'Spec2-Commands') ];
			package: 'Spec2-Code-Diff' with: [ spec requires: #('Spec2-Code') ];
			"Common widgets"
			package: 'Spec2-CommonWidgets' with: [ spec requires: #('Spec2-Core' 'Spec2-Layout') ];
			package: 'Spec2-CommonWidgets-Tests' with: [ spec requires: #('Spec2-CommonWidgets' 'Spec2-Tests') ];
			"Tests"			
			package: 'Spec2-Adapters-Stub' with: [ spec requires: #('Spec2-Core') ];
			package: 'Spec2-Commander2-Tests' with: [ spec requires: #('Spec2-Commander2') ];
			package: 'Spec2-Tests' with: [ spec requires: #('Spec2-Core' 'Spec2-Examples' 'Spec2-Dialogs-Tests') ];
			package: 'Spec2-ListView-Tests' with: [ spec requires: #('Spec2-ListView' 'Spec2-Tests') ];
			package: 'Spec2-Code-Tests' with: [ spec requires: #('Spec2-Tests' 'Spec2-Code') ];
			package: 'Spec2-Code-Diff-Tests' with: [ spec requires: #('Spec2-Tests' 'Spec2-Code-Diff') ];
			"Examples"
			package: 'Spec2-Examples' with: [ spec requires: #('Spec2-CommonWidgets') ];
			package: 'Spec2-Commander2-ContactBook' with: [ spec requires: #('Spec2-Commander2') ];
			package: 'Spec2-Commander2-ContactBook-Extensions' with: [ spec requires: #('Spec2-Commander2-ContactBook') ];
			"RichText -> Pillar"
			package: 'Spec2-Pillar' with: [ spec requires: #('Spec2-Core' 'PillarCore') ] 
	].
	
	spec group: 'Core' with: #(
		'Spec2-Layout' 
		'Spec2-Transmission'
		'Spec2-Commands' 
		'Spec2-Core' 
		'Spec2-Dialogs' 
		'Spec2-CommandLine' 
		'Spec2-Adapters-Stub'
		'Spec2-ListView'  
		'Spec2-Interactions' 
		'Spec2-Commander2' ).
	spec group: 'Code' with: #('Core' 'Spec2-Code-Commands' 'Spec2-Code' 'Spec2-Code-Diff').
	spec group: 'CodeTests' with: #('Spec2-Code-Tests' 'Spec2-Code-Diff-Tests').
	spec group: 'Support' with: #('Core' 'Spec2-Examples').
	spec group: 'Tests' with: #('Core' 'Spec2-Tests' 'Spec2-Commander2-Tests' 'Spec2-ListView-Tests').
	spec group: 'SupportTests' with: #('Support').
	spec group: 'Pillar' with: #('Spec2-Pillar' ).
	spec group: 'Base' with: #('Core' 'Support').
	spec group: 'BaseTests' with: #('Spec2-Tests' 'SupportTests').
	
	spec group: 'default' with: #('Base' 'BaseTests' 'Code' 'CodeTests').
]

{ #category : 'external projects' }
BaselineOfSpecCore >> pillar: spec [
	spec
		baseline: 'PillarCore'
		with: [ spec repository: 'github://pillar-markup/pillar:dev-8/src' ]
]

{ #category : 'accessing' }
BaselineOfSpecCore >> project [
	"Atomic loading is needed for Spec because we are moving classes of package and it breaks their subclasses. 
	
	Here is an explanation I wrote on Discord:
	
«The problem with Obsolete classes is that classes with subclasses were moved from Spec-Core to Spec-Deprecated80. 

When updating Spec it will first load Spec-Core. This will delete the class and its subclasses will be migrated to an obsolete superclass. 
Then Spec-Deprecated80 is loaded but it does not migrate the subclasses of the obsolete class to it. (Apparently there is an intern working on that Pablo told me).»

We need to use atomic loading only during update of existing Spec upgrade"

	^self class environment at: #SpPresenter 
		ifPresent: [
			super project
				loadType: #atomic;
				yourself ] 
		ifAbsent: [ 		
			super project
				loadType: #linear;
				yourself  ]

	 
]
