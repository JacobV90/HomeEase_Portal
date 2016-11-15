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
            alert_new_tenant();
        },
        error: function (){
            window.alert("something wrong!");
        }
    });
}


function alert_new_tenant(){
    $.notify({
	// options
	icon: 'glyphicon glyphicon-warning-sign',
	title: 'Bootstrap notify',
	message: 'Turning standard Bootstrap alerts into "notify" like notifications',
	url: 'https://github.com/mouse0270/bootstrap-notify',
	target: '_blank'
},{
	// settings
	element: 'body',
	position: null,
	type: "info",
	allow_dismiss: true,
	newest_on_top: false,
	showProgressbar: false,
	placement: {
		from: "top",
		align: "right"
	},
	offset: 20,
	spacing: 10,
	z_index: 1031,
	delay: 5000,
	timer: 1000,
	url_target: '_blank',
	mouse_over: null,
	animate: {
		enter: 'animated fadeInDown',
		exit: 'animated fadeOutUp'
	},
	onShow: null,
	onShown: null,
	onClose: null,
	onClosed: null,
	icon_type: 'class',
	template: '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
		'<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>' +
		'<span data-notify="icon"></span> ' +
		'<span data-notify="title">{1}</span> ' +
		'<span data-notify="message">{2}</span>' +
		'<div class="progress" data-notify="progressbar">' +
			'<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
		'</div>' +
		'<a href="{3}" target="{4}" data-notify="url"></a>' +
	'</div>' 
});
}
