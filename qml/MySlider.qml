import QtQuick 2.0
import QtQuick.Controls 2.0


Item {
	id: root
	property alias from: slider.from
	property alias to: slider.to
	property alias value: slider.value
	property alias title: tl.text
	property var vtext: parseInt(value)

	signal moved(var v)

	Row {
		anchors.fill: parent
		Item {
			height: parent.height
			width: tl.contentWidth+5
			Text {
				id: tl
				anchors.centerIn: parent
				text: ""
				color: "darkred"
			}
		}
		Slider {
			id: slider
			width: parent.width-(tl.width+vshow.width)
			height: parent.height
			from: 0
			to: 179
			value: 0
			onMoved: root.moved(parseInt(value))
		}
		Item {
			height: parent.height
			width: vshow.contentWidth+5
			Text {
				id: vshow
				anchors.centerIn: parent
				text: root.vtext
				color: "darkred"
			}
		}
	}

}
