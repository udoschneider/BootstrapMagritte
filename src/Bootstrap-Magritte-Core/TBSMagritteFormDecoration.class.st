Class {
	#name : #TBSMagritteFormDecoration,
	#superclass : #MAFormDecoration,
	#instVars : [
		'formCss',
		'legend'
	],
	#category : #'Bootstrap-Magritte-Core'
}

{ #category : #'instance creation' }
TBSMagritteFormDecoration class >> newWithDefaultButtons [
	^ self new 
		addButtons: #(save cancel);
		yourself
]

{ #category : #accessing }
TBSMagritteFormDecoration >> formCss [
	^ formCss ifNil: [ 'form-vertical' ]
]

{ #category : #accessing }
TBSMagritteFormDecoration >> formCss: anObject [
	formCss := anObject
]

{ #category : #accessing }
TBSMagritteFormDecoration >> legend [
	^ legend
]

{ #category : #accessing }
TBSMagritteFormDecoration >> legend: anObject [
	legend := anObject
]

{ #category : #rendering }
TBSMagritteFormDecoration >> renderButtonsOn: html [
	self buttons 
		do: [ :each |
			| tag |
			tag := html tbsButton
				accessKey: each value first;
				callback: [ self execute: each key ];
				text: each value.
			(each = buttons first) ifTrue: [ tag bePrimary ] ] separatedBy: [ html space ]

]

{ #category : #rendering }
TBSMagritteFormDecoration >> renderContentOn: html [
	self renderLegendOn: html.
	html tbsForm
		class: 'magritte';
		class: self formCss;
		multipart: self requiresMultipartForm;
		defaultAction: [ self execute: self default ];
		with: [
			self renderNextOn: html.
			self renderButtonsOn: html ]
]

{ #category : #rendering }
TBSMagritteFormDecoration >> renderLegendOn: html [
	self legend notNil ifTrue: [
		html legend: self legend ]
]
