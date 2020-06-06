Extension { #name : #MAContainer }

{ #category : #'*bootstrap-magritte-core' }
MAContainer >> tbsFormHorizontal [
	^ self propertyAt: #tbsFormHorizontal ifAbsent: [ false ]
]

{ #category : #'*bootstrap-magritte-core' }
MAContainer >> tbsFormHorizontal: aBoolean [
	self propertyAt: #tbsFormHorizontal put: aBoolean
]

{ #category : #'*bootstrap-magritte-core' }
MAContainer >> tbsFormInline [
	^ self propertyAt: #tbsFormInline ifAbsent: [ false ]
]

{ #category : #'*bootstrap-magritte-core' }
MAContainer >> tbsFormInline: aBoolean [
	self propertyAt: #tbsFormInline put: aBoolean
]

{ #category : #'*bootstrap-magritte-core' }
MAContainer >> tbsInlineValidationMessages [
	^ self propertyAt: #tbsInlineValidationMessages ifAbsent: [ false ]
]

{ #category : #'*bootstrap-magritte-core' }
MAContainer >> tbsInlineValidationMessages: aBoolean [
	self propertyAt: #tbsInlineValidationMessages put: aBoolean
]
