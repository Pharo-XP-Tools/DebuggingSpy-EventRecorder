"
I know how to collect and send data to experimental Inria servers.

I need to be correctly initialized to work properly:
- set my project name (a string)
- set my participant uuid (a String)
- set my experience name (a string)
- set my task or survey id

Server-side, the data will be stored in a directory such as:
/project/experience/uuid/taskOrSurvey/
"
Class {
	#name : #DSEventRecorderLogger,
	#superclass : #Object,
	#traits : 'TDSLogger',
	#classTraits : 'TDSLogger classTrait',
	#instVars : [
		'currentExperiment',
		'currentTask',
		'currentSurvey',
		'projectName',
		'collector',
		'participantUUID'
	],
	#category : #'DebuggingSpy-EventRecorder'
}

{ #category : #logging }
DSEventRecorderLogger >> authorizeDataSending [

	ERPrivacy sendDiagnosticsAndUsageData: true
]

{ #category : #accessing }
DSEventRecorderLogger >> collector [

	^ collector ifNil: [ collector := self newCollector ]
]

{ #category : #logging }
DSEventRecorderLogger >> computeLoggingId [ 
	currentSurvey ifNotNil:[^currentSurvey uuid asString].
	currentTask ifNotNil:[^currentTask uuid asString].
	^nil
]

{ #category : #initialization }
DSEventRecorderLogger >> initialize [
	EREventRecorder reset.
	PXEventRecorder reset.
	EREventRecorderSettings url: 'https://rmod-xp.lille.inria.fr/'
]

{ #category : #logging }
DSEventRecorderLogger >> log: aDSEventRecord [

	self updateCollector add: aDSEventRecord
]

{ #category : #collectors }
DSEventRecorderLogger >> newCollector [
	collector := PXEventCollector new.
	collector category: projectName.
	collector experienceId: currentExperiment experienceId.
	collector participantUUID: participantUUID.
	collector occupant: nil.
	collector register.
	^collector
]

{ #category : #accessing }
DSEventRecorderLogger >> participantUUID: anObject [

	participantUUID := anObject
]

{ #category : #accessing }
DSEventRecorderLogger >> projectName: anObject [

	projectName := anObject
]

{ #category : #initialization }
DSEventRecorderLogger >> reset [
	currentTask := nil
]

{ #category : #initialization }
DSEventRecorderLogger >> setExperiment: anExperiment [
	currentExperiment := anExperiment 
]

{ #category : #setup }
DSEventRecorderLogger >> setupLoggerAfterSurvey: aSurvey [

	currentSurvey := nil
]

{ #category : #setup }
DSEventRecorderLogger >> setupLoggerBeforeSurvey: aSurvey [
	currentSurvey := aSurvey
]

{ #category : #setup }
DSEventRecorderLogger >> setupLoggerForTask: aTask [
	currentTask := aTask
]

{ #category : #collectors }
DSEventRecorderLogger >> updateCollector [

	^ self newCollector
		  taskOrSurveyId: self computeLoggingId;
		  yourself
]
