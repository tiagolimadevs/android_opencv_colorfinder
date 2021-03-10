import QtQuick 2.0


Rectangle {
	id: root
	property alias textColor: bt.color
	property alias text: bt.text
	signal clicked()

	border {
		width: 2
		color: "black"
	}
	Text {
		id: bt
		anchors.centerIn: parent
		text: ""
		color: "black"
	}
	MouseArea {
		anchors.fill: parent
		onClicked: {
			root.clicked()
		}
	}
	
}
