import QtQuick

QtObject {
    id: root

    property ListModel categoriesModel: ListModel {
        id: categoriesModel
        ListElement { name: "MIT Latest News"; feed: "http://news.mit.edu/rss/feed" }
        ListElement { name: "Reasearch News"; feed: "http://news.mit.edu/rss/research" }
        ListElement { name: "Campus News"; feed: "http://news.mit.edu/rss/campus" }
        ListElement { name: "School of Science"; feed: "http://news.mit.edu/rss/school/science" }
        ListElement { name: "Science, technology, and society"; feed: "http://news.mit.edu/rss/topic/science-technology-and-society" }
    }
}
