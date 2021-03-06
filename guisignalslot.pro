# Add more folders to ship with the application, here
folder_01.source = qml/guisignalslot
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    TestClass.cpp \
    ComponentConnector.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    TestClass.h \
    ComponentConnector.h

OTHER_FILES += \
    qml/guisignalslot/NodeInput.qml \
    qml/guisignalslot/Node.qml \
    qml/guisignalslot/NodeConnectorUI.qml \
    qml/guisignalslot/NodeLibraryWindow.qml \
    qml/guisignalslot/FontAwesome.js
