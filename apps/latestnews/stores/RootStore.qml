import QtQuick
import QtQml.XmlListModel

QtObject {
    id: root

    property int selectedCategory: -1
    property bool feedLoading: (feedModel.status === XmlListModel.Loading)
    property string categoryName: root.categoriesModel.get(root.selectedCategory).name

    property ListModel categoriesModel: ListModel {
        id: categoriesModel
        ListElement { name: "MIT Latest News"; feed: "http://news.mit.edu/rss/feed" }
        ListElement { name: "Reasearch News"; feed: "http://news.mit.edu/rss/research" }
        ListElement { name: "Campus News"; feed: "http://news.mit.edu/rss/campus" }
        ListElement { name: "School of Science"; feed: "http://news.mit.edu/rss/school/science" }
        ListElement { name: "Science, technology, and society"; feed: "http://news.mit.edu/rss/topic/science-technology-and-society" }
    }

    property var feedModel: XmlListModel {
        id: xmlModel
        source: root.categoriesModel.get(root.selectedCategory).feed
        query: "/rss/channel/item"

        XmlListModelRole { name: "title"; elementName: "title" }
        XmlListModelRole { name: "pubDate"; elementName: "pubDate" }
        XmlListModelRole { name: "description"; elementName: "description" }
        XmlListModelRole { name: "link"; elementName: "link" }
    }
}
