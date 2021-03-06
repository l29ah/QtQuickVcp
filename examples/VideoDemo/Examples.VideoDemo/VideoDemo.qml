/****************************************************************************
**
** Copyright (C) 2014 Alexander Rössler
** License: LGPL version 2.1
**
** This file is part of QtQuickVcp.
**
** All rights reserved. This program and the accompanying materials
** are made available under the terms of the GNU Lesser General Public License
** (LGPL) version 2.1 which accompanies this distribution, and is available at
** http://www.gnu.org/licenses/lgpl-2.1.html
**
** This library is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
** Lesser General Public License for more details.
**
** Contributors:
** Alexander Rössler @ The Cool Tool GmbH <mail DOT aroessler AT gmail DOT com>
**
****************************************************************************/
import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import Machinekit.Application.Controls 1.0
import Machinekit.VideoView 1.0
import Machinekit.Service 1.0

ServiceWindow {
    id: main
    title: qsTr("Video Demo")

    Service {
        id: videoService
        type: "video"
        required: true
    }

    ColumnLayout {
        anchors.margins: 10
        anchors.fill: parent
        spacing: 0

        MjpegStreamerClient {
            id: mjpegStreamerClient

            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: ready
            videoUri: videoService.uri
            ready: videoService.ready

            Label {
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: Screen.logicalPixelDensity
                text: parent.fps
            }

            Label {
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.margins: Screen.logicalPixelDensity
                text: parent.time.toTimeString()
            }
        }

        Label {
            id: infoLabel

            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: !videoService.ready
            text: qsTr("Webcam not available")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
