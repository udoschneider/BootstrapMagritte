Class {
	#name : #TBSMagritteSelectListComponent,
	#superclass : #MASelectListComponent,
	#category : #'Bootstrap-Magritte-Examples'
}

{ #category : #'rendering-grouped' }
TBSMagritteSelectListComponent >> renderEditorForGroupedOn: html [ 
	html select tbsFormControl
		id: self labelId;
		dispatchCallback;
		with: [ self renderGroupsOn: html ]
]

{ #category : #rendering }
TBSMagritteSelectListComponent >> renderEditorForUngroupedOn: html [
	html select tbsFormControl
		id: self labelId;
		list: self options;
		selected: self value;
		callback: [ :value | self value: value ];
		labels: [ :value | self labelForOption: value ]
]
