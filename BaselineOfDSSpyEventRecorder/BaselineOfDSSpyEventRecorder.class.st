Class {
	#name : 'BaselineOfDSSpyEventRecorder',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfDSSpyEventRecorder',
	#package : 'BaselineOfDSSpyEventRecorder'
}

{ #category : 'baselines' }
BaselineOfDSSpyEventRecorder >> baseline: spec [

	<baseline>
	spec baseline: 'PharoXPEventRecorder' with: [ 
		spec repository:
			'github://Pharo-XP-Tools/Pharo-XP-EventRecorder:P12/' ].

	spec for: #common do: [ spec package: 'DebuggingSpy-EventRecorder' ]
]
