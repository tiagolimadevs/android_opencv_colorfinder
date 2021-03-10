import QtQuick 2.0
import QtMultimedia 5.12
import QtQuick.Controls 2.0

import my.filter 1.0

Item {
	width: widget.getSize().width
	height: widget.getSize().height

	property var isOpen: true


	Camera {
		id: camera
		captureMode: Camera.CaptureViewfinder
	}

	VideoOutput {
		id: videoOutput
        	source: camera
		filters: [myfilter]
		width: parent.width
		height: parent.height
		x: -width
		orientation: camera.orientation
		fillMode: VideoOutput.Stretch
	}

	VideoOutput {
        	source: myfilter
		width: parent.width
		height: parent.height
		orientation: camera.orientation
		fillMode: VideoOutput.Stretch
	}


	Button {
		y: isOpen ? parent.height*.28 : parent.height*.88
		width: parent.height*.1
		height: width
		text: isOpen ? "hidden" : "show"
		textColor: "darkred"
		color: Qt.rgba(0, 0, 0, .1);
		clip: true
		border {
			width: 0
		}
		onClicked: {
			isOpen = !isOpen
		}
	}

	Button {
		y: isOpen ? parent.height*.28 : parent.height*.88
		x: width*1.5
		width: parent.height*.1
		height: width
		visible: isOpen && colorChanger.showType.value > 0
		color: Qt.rgba(0, 0, 0, .1);
		textColor: "darkred"
		text: "copy"
		clip: true
		border {
			width: 0
		}
		onClicked: {
			var txt=""
			switch (colorChanger.showType.value) {
				case 3: {
					txt += "dilateX="+colorChanger.values[0]
					txt += ",dilateY="+colorChanger.values[1]
					txt += ",erodeX="+colorChanger.values[2]
					txt += ",erodeY="+colorChanger.values[3]
					txt += ";\n"
				}
				case 2: {
					txt += "hueMin="+colorChanger.values[4]
					txt += ",hueMax="+colorChanger.values[5]
					txt += ",satMin="+colorChanger.values[6]
					txt += ",satMax="+colorChanger.values[7]
					txt += ",valMin="+colorChanger.values[8]
					txt += ",valMax="+colorChanger.values[9]
					txt += ";\n"
				}
				case 1: {
					txt += "cvt=cv::COLOR_"+colorChanger.idx2name
					txt += ";\n"
					break;
				}
				default:
					return;
			}
			myfilter.copy(txt);
		}

	}

	ColorChanger {
		id: colorChanger
		y: isOpen ? parent.height*.38 : parent.height
		visible: isOpen
		width: parent.width
		height: parent.height*.6
		color: Qt.rgba(0, 0, 0, .1)
		clip: true
	}


	Myfilter {
		id: myfilter
		dilateX: colorChanger.values[0]
		dilateY: colorChanger.values[1]
		erodeX: colorChanger.values[2]
		erodeY: colorChanger.values[3]

		hmin: colorChanger.values[4]
		hmax: colorChanger.values[5]
		smin: colorChanger.values[6]
		smax: colorChanger.values[7]
		vmin: colorChanger.values[8]
		vmax: colorChanger.values[9]

		colorIdx: colorChanger.values[10]
		showType: colorChanger.showType.value
	}
}



