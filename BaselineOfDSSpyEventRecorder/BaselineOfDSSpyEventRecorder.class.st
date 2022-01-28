Class {
	#name : #BaselineOfDSSpyEventRecorder,
	#superclass : #BaselineOf,
	#category : #BaselineOfDSSpyEventRecorder
}

{ #category : #baselines }
BaselineOfDSSpyEventRecorder >> baseline: spec [

	<baseline>
	spec baseline: 'PharoXPEventRecorder' with: [ 
		spec repository:
			'github://Pharo-XP-Tools/Pharo-XP-EventRecorder:main/' ].

	spec for: #common do: [ spec package: 'DebuggingSpy-EventRecorder' ]
]
