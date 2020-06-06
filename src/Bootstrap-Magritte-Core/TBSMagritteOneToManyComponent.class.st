Class {
	#name : #TBSMagritteOneToManyComponent,
	#superclass : #MAOneToManyComponent,
	#category : #'Bootstrap-Magritte-Core'
}

{ #category : #private }
TBSMagritteOneToManyComponent >> buildReport [

	^ (TBSMagritteReport rows: self value description: self reference)
		sortEnabled: self magritteDescription isOrdered not;
		yourself
]

{ #category : #'rendering-buttons' }
TBSMagritteOneToManyComponent >> renderSelectButtonOn: html [
	html button 
		beSubmit;
		class: 'btn';
		callback: [self add];
		with: [html tbsGlyphIcon iconPlus. html space; text: (self labelForSelector: #add)]

]
