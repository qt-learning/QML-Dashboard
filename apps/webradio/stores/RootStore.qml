import QtQuick
import QtMultimedia

QtObject {
    id: root

    property real volume: 1.0
    property int currentStationIndex: 0
    property bool playbackStatePlaying: (player.playbackState === MediaPlayer.PlayingState)
    property bool mediaError: (player.mediaStatus !== MediaPlayer.BufferedMedia)

    property ListModel stationsModel: WebRadioStationsModel { }

    property MediaPlayer audioPlayer: MediaPlayer {
        id: player
        audioOutput: AudioOutput { volume: root.volume }
        source: root.stationsModel.get(0).url
    }

    function nextStation() {
        if (root.currentStationIndex < root.stationsModel.count - 1) {
            root.currentStationIndex++;
        } else {
            root.currentStationIndex = root.stationsModel.count - 1;
        }
        root.play();
    }

    function previousStation() {
        if (root.currentStationIndex > 0) {
            root.currentStationIndex--;
        } else {
            root.currentStationIndex = 0;
        }
        root.play();
    }

    function play() {
        player.source = root.stationsModel.get(root.currentStationIndex).url;
        player.play();
    }

    function stop() {
        player.stop();
    }

    function getStationLogo() {
        return !!root.stationsModel.get(root.currentStationIndex).image ?
                 root.stationsModel.get(root.currentStationIndex).image : "";
    }

    function getStationName() {
        return !!root.stationsModel.get(root.currentStationIndex).name ?
                 root.stationsModel.get(root.currentStationIndex).name : "Unknown station";
    }
}
