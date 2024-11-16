import QtQuick

import QtQuick.Scene3D
import Qt3D.Core
import Qt3D.Render
import Qt3D.Extras
// import QtQuick3D

import utils

Item {
    id: root
    width: Style.resize(200)
    height: Style.resize(286)

    property real yOffset: 0
    property alias animator: jumpAnimation

    SequentialAnimation on yOffset {
        id: jumpAnimation
        running: false

        NumberAnimation { to: 10; duration: 250; easing.type: Easing.OutQuad }
        NumberAnimation { to: 0; duration: 1000; easing.type: Easing.OutBounce }
    }

    // View3D {
    //     anchors.fill: parent
    //     environment: SceneEnvironment {
    //         clearColor: "transparent"
    //         backgroundMode: SceneEnvironment.Color
    //     }

    //     PerspectiveCamera {
    //         eulerRotation.x: -35
    //     }

    //     DirectionalLight {
    //         eulerRotation.x: -35
    //         eulerRotation.y: -70
    //     }

    //     Model {
    //         id: note
    //         source: "/assets/mesh/note_mesh.mesh"
    //         rotation: Quaternion.fromEulerAngles(Qt.vector3d(50, 0, -80))
    //         y: -750 + root.yOffset
    //         scale: Qt.vector3d(1.25, 1.25, 1)
    //         materials: [
    //             PrincipledMaterial {
    //                 baseColorMap: Texture {
    //                     source: Style.gfx("dark-texture-background")
    //                 }
    //             }
    //         ]
    //         eulerRotation: Qt.vector3d(30, 0, rotationY)
    //         property real rotationY
    //         NumberAnimation on rotationY {
    //             from: 0; to: 360
    //             duration: 5000
    //             loops: Animation.Infinite
    //             running: root.visible
    //         }
    //     }
    // }

    Scene3D {
        anchors.fill: parent

        entity: Entity {
            components: [
                RenderSettings {
                    ForwardRenderer {
                        camera: camera
                        clearColor: "transparent"
                    }
                },
                DirectionalLight {
                    worldDirection: Qt.vector3d(-0.5, -1, -1)
                    intensity: 2.5
                    color: "white"
                }
            ]

            Camera {
                id: camera
                projectionType: CameraLens.PerspectiveProjection
                fieldOfView: 30
                nearPlane: 0.1
                farPlane: 1000.0
                position: Qt.vector3d(0, -10, 20)
                viewCenter: Qt.vector3d(0, 0, 0)
            }

            OrbitCameraController { camera: camera }

            Entity {
                components: [
                    Mesh {
                        source: Style.mesh("note")
                    },
                    Transform {
                        scale: 0.09
                        translation: Qt.vector3d(0, -15 + root.yOffset, -70)
                        NumberAnimation on rotationY {
                            from: 0; to: 360
                            duration: 5000
                            loops: Animation.Infinite
                            running: root.visible
                        }
                    },
                    DiffuseMapMaterial {
                        textureScale: 1
                        diffuse: TextureLoader {
                            source: Style.gfx("dark-texture-background")
                        }
                        ambient: "black"
                    }
                ]
            }
        }
    }
}
