Class {
	#name : #TBSMagritteDisabledTextInputComponent,
	#superclass : #MATextInputComponent,
	#category : #'Bootstrap-Magritte-Core'
}

{ #category : #rendering }
TBSMagritteDisabledTextInputComponent >> renderInputOn: html [
	| textInput |
	textInput := html textInput.
	description placeholder notNil ifTrue: [ 
		textInput placeholder: description placeholder ].
	
	description cssClasses isEmpty ifFalse: [
		textInput class: (String streamContents: [:stream |
			description cssClasses 
				do: [:cls | stream nextPutAll: cls] 
				separatedBy: [stream nextPut: Character space]])].

	textInput
		id: self labelId;
		disabled;
		on: #string of: self. 
]
