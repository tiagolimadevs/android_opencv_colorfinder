TEMPLATE = app
HEADERS += include/widget.h include/filter.h include/myfilter.h \
        include/QVideoFrameToQImage.h include/qvideoframe_p.h \
        include/cvutil.h include/colorutil.h
SOURCES += src/main.cpp src/widget.cpp src/filter.cpp src/myfilter.cpp \
        src/QVideoFrameToQImage.cpp src/cvutil.cpp 
INCLUDEPATH += include/
QT += core gui widgets quickwidgets quick multimedia
TARGET = colorFinder
RESOURCES += resources.qrc

linux:!android {
    INCLUDEPATH += /usr/include/opencv4
    LIBS += `pkg-config --cflags --libs opencv4`
}

android {
   INCLUDEPATH += /opt/opencv_android/sdk/native/jni/include/
   LIBS += -L/opt/opencv_android/sdk/native/libs/armeabi-v7a/
   LIBS += -lopencv_core -lopencv_imgproc -lopencv_highgui


    contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
        ANDROID_EXTRA_LIBS = \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_aruco.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_bgsegm.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_bioinspired.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_calib3d.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_ccalib.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_core.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_datasets.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_dnn.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_dnn_objdetect.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_dnn_superres.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_dpm.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_face.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_features2d.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_flann.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_fuzzy.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_gapi.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_hfs.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_highgui.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_img_hash.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_imgcodecs.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_imgproc.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_intensity_transform.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_line_descriptor.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_mcc.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_ml.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_objdetect.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_optflow.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_phase_unwrapping.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_photo.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_plot.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_quality.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_rapid.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_reg.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_rgbd.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_saliency.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_shape.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_stereo.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_stitching.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_structured_light.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_superres.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_surface_matching.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_text.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_tracking.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_video.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_videoio.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_videostab.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_wechat_qrcode.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_xfeatures2d.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_ximgproc.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_xobjdetect.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libopencv_xphoto.so \
            /opt/opencv_android/sdk/native/libs/armeabi-v7a/libtbb.so
    }
}

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/values/libs.xml

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}


