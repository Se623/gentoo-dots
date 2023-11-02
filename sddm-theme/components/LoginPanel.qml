import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12

Item {
    property var user: userPanel.username
    property var password: passwordField.text
    property var session: sessionPanel.session
    property var inputHeight: Screen.height * config.UIScale * 0.25
    property var inputWidth: Screen.width * config.UIScale
    property var pos: "logincard" 

    Rectangle {
	id: loginCard
	color: "#55000000"
	height: 500
	width: 600
	y: root.height 
	x: root.width / 3


	SessionPanel {
	    id: sessionPanel
	}

	LoginContent {
	    id: loginContent
	    anchors {
		horizontalCenter: parent.horizontalCenter
		verticalCenter: parent.verticalCenter
	    }
	}

	
	focus: true

	Keys.onUpPressed: [
	    loginCard.state = "up"
	]

	states: [
	    State {
		name: "up"; 
		PropertyChanges {
		    target: loginCard
		    y: root.height / 4
		}},
	    State {
		 name: "cen"; 
		 PropertyChanges {
		     target: loginCard
		     x: root.width / 3
		 }},
	    State {
		name: "left"; 
		PropertyChanges {
		    target: loginCard
		    x: -root.width
		}},
	    State {
		name: "right"; 
		PropertyChanges {
		    target: loginCard
		    x: root.width
		}}
	    
	 ]

	 transitions: [
	     Transition {
		 from: "*"; to: "up";
		 NumberAnimation { properties: "y"; duration: 500; easing.type: Easing.InOutQuad }
	     },
	     Transition {
		 from: "*"; to: "cen";
		 NumberAnimation { properties: "x"; duration: 500; easing.type: Easing.InOutQuad }
	     },
	     Transition {
		 from: "*"; to: "left";
		 NumberAnimation { properties: "x"; duration: 500; easing.type: Easing.InOutQuad }
	     },
	     Transition {
		 from: "*"; to: "right";
		 NumberAnimation { properties: "x"; duration: 500; easing.type: Easing.InOutQuad }
	     }
	 ]
	
    }
	
     Rectangle {
	 id: loginCardO
	 color: "#55000000"
	 height: 500
	 width: 600
	 x: -root.width
	 y: root.height / 4

	 LoginContent {
	    id: loginContentO
	    anchors {
		horizontalCenter: parent.horizontalCenter
		verticalCenter: parent.verticalCenter
	    }
	 }

	 states: [
	     State {
		 name: "cenO"; 
		 PropertyChanges {
		     target: loginCardO 
		     x: root.width / 3
		 }},
	     State {
		 name: "leftO"; 
		 PropertyChanges {
		     target: loginCardO 
		     x: -root.width
		 }},
	     State {
		 name: "rightO"; 
		 PropertyChanges {
		     target: loginCardO
		     x: root.width
		 }}

	 ]

	 transitions: [
	     Transition {
		 from: "*"; to: "cenO"; 
		 NumberAnimation { properties: "x"; duration: 500; easing.type: Easing.InOutQuad }
	     },
	     Transition {
		 from: "*"; to: "leftO"; 
		 NumberAnimation { properties: "x"; duration: 500; easing.type: Easing.InOutQuad }
	     },
	     Transition {
		 from: "*"; to: "rightO"; 
		 NumberAnimation { properties: "x"; duration: 500; easing.type: Easing.InOutQuad }
	     }
	 ]

     }
    
    Rectangle {
	height: 50
	width: 20
	x: Screen.width - 200
	
	anchors {
	    verticalCenter: parent.verticalCenter 
	
	}
	MouseArea {  
	    anchors.fill: parent
	    onClicked: {
		loginCardO.x = pos == "logincard" ? -root.width : loginCardO.x;
		loginCard.x = pos == "logincardo" ? -root.width : loginCard.x;
		loginCardO.state = pos == "logincardo" ? "rightO" : loginCardO.state; 
		loginCard.state = pos == "logincard" ? "right" : loginCard.state; 
		loginCardO.state = pos == "logincard" ? "cenO" : loginCardO.state; 
		loginCard.state =  pos == "logincardo" ? "cen" : loginCard.state;
		loginCard.y = root.height / 4
		pos = pos == "logincard" ? "logincardo" : "logincard"
		userList.currentIndex = userList.currentIndex + 1;
                usernameField.text = userWrapper.items.get(userList.currentIndex).model.name;
                userPicture.source = userWrapper.items.get(userList.currentIndex).model.icon;
 
	    }
	}
    }
    
    Rectangle {
	height: 50
	width: 20
	x: 50
	
	anchors {
	    verticalCenter: parent.verticalCenter 
	    
	}
	MouseArea {
	    anchors.fill: parent
	    onClicked: {
		loginCardO.x = pos == "logincard" ? root.width : loginCardO.x;
		loginCard.x = pos == "logincardo" ? root.width : loginCard.x;
		loginCardO.state = pos == "logincardo" ? "leftO" : loginCardO.state; 
		loginCard.state = pos == "logincard" ? "left" : loginCard.state; 
		loginCardO.state = pos == "logincard" ? "cenO" : loginCardO.state; 
		loginCard.state =  pos == "logincardo" ? "cen" : loginCard.state;
		loginCard.y = root.height / 4
		pos = pos == "logincard" ? "logincardo" : "logincard"
		
	    }
	}
	
    }
    
    
    Connections {
        function onLoginSucceeded() {
            coverScreen.start();
        }
	
        function onLoginFailed() {
            passwordField.text = "";
            passwordField.focus = true;
        }
	
        target: sddm
    }
}
