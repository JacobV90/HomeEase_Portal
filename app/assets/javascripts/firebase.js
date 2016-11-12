$.getScript('https://www.gstatic.com/firebasejs/3.6.0/firebase.js', function()
{
    console.log("firebase ready!!");
    
    //Initialize Firebase
    var config = {
        apiKey: "AIzaSyAw4OJvB9_3K0rF8TitGDAjhtGM3pVWC10",
        authDomain: "home-ease.firebaseapp.com",
        databaseURL: "https://home-ease.firebaseio.com",
        storageBucket: "home-ease.appspot.com",
        messagingSenderId: "192999449621"
    };
    firebase.initializeApp(config);
    
    fire = {
        // watch for property changes from client side app
        propertiesService: function(){
            var ref = firebase.database().ref('Properties/');
                ref.on('child_changed', function(snapshot) {
                    console.log("hello from firebase");
                    console.log(snapshot.val());
                    notifyAndUpdate(snapshot.key,snapshot.val())
            });
        }
    }
    
    fire.propertiesService();
});

function notifyAndUpdate(id, property){
    $.ajax({
        url: '/notifications',
        type: 'POST',
        data: JSON.stringify({
            tenants: property.tenants,
            prop_id: id
        }),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function(msg) {
            alert(msg);
        },
        error: function (){
            window.alert("something wrong!");
        }
    });
}

