import QtQuick 2.0


Item {
	id: root
	property var value: 0

	signal changed()

	Row {
		anchors.fill: parent
		Button {
			border.width: 0
			width: parent.width/4
			height: parent.height
			text: "normal"
			textColor: "darkred"
			color: root.value==0 ? Qt.rgba(0, 0, 0, .5) : Qt.rgba(0, 0, 0, 0)
			onClicked: {
				root.changed()
				root.value=0
			}
		}
		Button {
			border.width: 0
			width: parent.width/4
			height: parent.height
			text: "cvtColor"
			textColor: "darkred"
			color: root.value==1 ? Qt.rgba(0, 0, 0, .5) : Qt.rgba(0, 0, 0, 0)
			onClicked: {
				root.changed()
				root.value=1
			}
		}
		Button {
			border.width: 0
			width: parent.width/4
			height: parent.height
			text: "inRange"
			textColor: "darkred"
			color: root.value==2 ? Qt.rgba(0, 0, 0, .5) : Qt.rgba(0, 0, 0, 0)
			onClicked: {
				root.changed()
				root.value=2
			}
		}
		
		Button {
			border.width: 0
			width: parent.width/4
			height: parent.height
			text: "canny"
			textColor: "darkred"
			color: root.value==3 ? Qt.rgba(0, 0, 0, .5) : Qt.rgba(0, 0, 0, 0)
			onClicked: {
				root.changed()
				root.value=3
			}
		}

	}


}
