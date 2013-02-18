TRANSLATIONS = ts/cs.ts ts/de.ts ts/sk.ts ts/fr.ts ts/fi.ts ts/es.ts ts/ru.ts ts/zh_CN.ts ts/ar.ts ts/et.ts

evilhack{
SOURCES = qml/gepes/*.qml
}

CODECFORTR = UTF-8

# Add more folders to ship with the application, here
folder_01.source = qml/gepes
folder_01.target = qml
folder_02.source = images
folder_02.target =
DEPLOYMENTFOLDERS = folder_01 folder_02

translations.files = ts/*.qm
translations.path = /opt/gepes/l10n
INSTALLS += translations

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

symbian:TARGET.UID3 = 0xE3210A36

# Smart Installer package's UID
# This UID is from the protected range and therefore the package will
# fail to install if self-signed. By default qmake uses the unprotected
# range value if unprotected UID is defined for the application and
# 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
symbian:TARGET.CAPABILITY += NetworkServices Location

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=

# Add dependency to symbian components
# CONFIG += qtquickcomponents

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog \
    gepes256.png \
    gepes64.png
