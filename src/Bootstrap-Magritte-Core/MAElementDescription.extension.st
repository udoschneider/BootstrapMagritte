Extension { #name : #MAElementDescription }

{ #category : #'*bootstrap-magritte-core' }
MAElementDescription >> placeholder [
	^ self 
		propertyAt: #placeholder 
		ifAbsent: [ nil ]
]

{ #category : #'*bootstrap-magritte-core' }
MAElementDescription >> placeholder: placeHolderText [
	^ self propertyAt: #placeholder put: placeHolderText
]
