#
# Copyright (c) 2015-2016 Alex Spataru <https://github.com/alex-spataru>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

#---------------------------------------------------------------------------------------------------
# Make options
#---------------------------------------------------------------------------------------------------

UI_DIR = uic
MOC_DIR = moc
RCC_DIR = qrc
OBJECTS_DIR = obj

CONFIG += c++11
CONFIG += warn_on
CONFIG += utf8_source
CONFIG += sdk_no_version_check
CONFIG(release, debug|release): CONFIG += qtquickcompiler

#---------------------------------------------------------------------------------------------------
# Qt configuration
#---------------------------------------------------------------------------------------------------

TEMPLATE = app
TARGET = QDriverStation
VERSION = 20.10

QT += xml
QT += svg
QT += core
QT += quick
QT += quickcontrols2

#---------------------------------------------------------------------------------------------------
# Include libraries
#---------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------
# Import source code, resources & QML interface files
#---------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------
# Deploy configurations
#---------------------------------------------------------------------------------------------------

win32* {
    LIBS += -lPdh -lgdi32
    RC_FILE = deploy/windows/resources/info.rc
}

linux:!android {
    target.path = /usr/bin
    icon.path = /usr/share/pixmaps
    desktop.path = /usr/share/applications
    icon.files += deploy/linux/common/qdriverstation.png
    desktop.files += deploy/linux/common/qdriverstation.desktop

    TARGET = qdriverstation
    INSTALLS += target desktop icon
}

macos {
   ICON = deploy/macOS/icon.icns
   RC_FILE = deploy/macOS/icon.icns
   QMAKE_INFO_PLIST = deploy/macOS/info.plist

   # DMG generation constants
   BUNDLE_FILENAME = $${TARGET}.app
   DMG_FILENAME = "QDriverStation-$$(VERSION).dmg"
   
   # Target for pretty DMG generation
   dmg.commands += echo "Generate DMG";
   dmg.commands += macdeployqt $$BUNDLE_FILENAME &&
   dmg.commands += create-dmg \
         --volname $${TARGET} \
         --background $${PWD}/deploy/macOS/dmg_bg.png \
         --icon $${BUNDLE_FILENAME} 150 218 \
         --window-pos 200 120 \
         --window-size 600 450 \
         --icon-size 100 \
         --hdiutil-quiet \
         --app-drop-link 450 218 \
         $${DMG_FILENAME} \
         $${BUNDLE_FILENAME}

   QMAKE_EXTRA_TARGETS += dmg
}
