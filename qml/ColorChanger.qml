import QtQuick 2.0

Rectangle {
	id: root
	
	property alias showType: showType
	property var values: [1, 1, 1, 1, 0, 179, 0, 255, 0, 255, 8]
	property var lastValues: [1, 1, 1, 1, 0, 179, 0, 255, 0, 255, 8]

	function getValue(idx) {
		const n = lastValues[idx]
		return n; 
	}

	property var idxBgr2name: [
		"BGR2BGRA", "BGR2RGBA", "BGR2RGB",
	       	"BGR2GRAY", "BGR2BGR565", "BGR2BGR555",
       		"BGR2XYZ", "BGR2YCrCb", "BGR2HSV",
		"BGR2Lab", "BGR2Luv", "BGR2HLS",
		"BGR2HSV_FULL", "BGR2HLS_FULL",
	       	"BGR2YUV", "BGR2YUV_I420",
       		"BGR2YUV_IYUV", "BGR2YUV_YV12"
	]
	property var idx2name: root.idxBgr2name[root.values[10]]

	property var model: [
		{
			title: "dilateX",
			min: 1,
			max: 100,
			visible: root.showType.value==3,
			value: root.getValue(0)
		},
		{
			title: "dilateY",
			min: 1,
			max: 100,
			visible: root.showType.value==3,
			value: root.getValue(1)
		},
		{
			title: "erodeX",
			min: 1,
			max: 100,
			visible: root.showType.value==3,
			value: root.getValue(2)
		},
		{
			title: "erodeY",
			min: 1,
			max: 100,
			visible: root.showType.value==3,
			value: root.getValue(3)
		},


		{
			title: "hmin",
			min: 0,
			max: 255,
			visible: root.showType.value>1,
			value: root.getValue(4)
		},
		{
			title: "hmax",
			min: 0,
			max: 255,
			visible: root.showType.value>1,	
			value: root.getValue(5)
		},

		{
			title: "smin",
			min: 0,
			max: 255,
			visible: root.showType.value>1,
			value: root.getValue(6)
		},
		{
			title: "smax",
			min: 0,
			max: 255,
			visible: root.showType.value>1,
			value: root.getValue(7)
		},

		{
			title: "vmin",
			min: 0,
			max: 255,
			visible: root.showType.value>1,
			value: root.getValue(8)
		},
		{
			title: "vmax",
			min: 0,
			max: 255,
			visible: root.showType.value>1,
			value: root.getValue(9)
		},

		
		{
			title: root.idx2name,
			min: 0,
			max: 18, 
			visible: root.showType.value>0,
			value: root.values[10]
		},
	]

	ShowType {
		id: showType
		width: root.width
		height: root.height*.2
		onChanged: {
			const c = root.values.length
			for (x = 0; x < c; x++)
				root.lastValues[x] = root.values[x]
			root.lastValues = root.lastValues
		}
	}
	
	ListView {
		model: root.model
		width: root.width
		clip: true
		height: root.height*.8
		anchors.top: showType.bottom
		delegate:  MySlider {
			clip: true
			title: modelData.title
			width: visible ? root.width : 0
			height: visible ? root.height*.2 : 0
			from: modelData.min
			to: modelData.max
			value: modelData.value
			visible: modelData.visible

			onMoved: function(v) {
				root.values[index] = v
				root.values = root.values
			}
		}
	}	
}
