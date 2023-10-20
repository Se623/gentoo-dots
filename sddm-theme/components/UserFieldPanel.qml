import QtGraphicalEffects 1.12
import QtQuick 2.12
import QtQuick.Controls 2.12

Label {
    id: usernameField

    height: inputHeight
    width: inputWidth
    font.family: config.Font
    font.pointSize: config.FontSize
    font.bold: true
    color: config.FieldText
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    text: userModel.lastUser
    
    background: Rectangle {
        id: userFieldBackground

        color: config.FieldBackground
        border.color: config.FieldBorderColor
        border.width: 0
        radius: config.Radius
    }



}
