//= require application

var point = new google.maps.LatLng(37.65389321945714,127.04496474325442); // ADD HERE THE CENTER OF THE MAP
var marker_points = [new google.maps.LatLng(37.65389321945714,127.04496474325442)]; // ADD HERE THE MARKERS YOU WANT TO DISPLAY
var markers = [];
var iterator = 0;
	
function initialize_eos_map(){		
		var myMapStyles = [
			{ featureType: "road", elementType: "all", stylers: [  ] }
		];
		var eosMapStyles = new google.maps.StyledMapType(myMapStyles, {name: "My personalized map"});
		
		var myMapOptions = {
			zoom: 17,
			scrollwheel:true,
			draggable: true,
			center: point,
			mapTypeControl: false,
			mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
				position: google.maps.ControlPosition.RIGHT_CENTER,
				mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'custom_styled']},
			navigationControl: true,
			navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL,
				position: google.maps.ControlPosition.LEFT_BOTTOM},
			zoomControlOptions: {
				style: google.maps.ZoomControlStyle.LARGE
			  }
		};
		
		var map = new google.maps.Map(document.getElementById("eos_map"),myMapOptions);
		map.mapTypes.set('custom_styled', eosMapStyles);
		map.setMapTypeId('custom_styled');
		
		drop(map, marker_points);
}
	
function drop(map, marker_points) {
	for (var i = 0; i < marker_points.length; i++) {
		setTimeout(function() {
			addMarker(map, marker_points);
		}, i * 300);
	}
}
	
function addMarker(map, marker_points) {
	var image = new google.maps.MarkerImage(
			  "/assets/marker.png",
			  new google.maps.Size(160,56),
			  new google.maps.Point(0,0),
			  new google.maps.Point(80,56)
		  );
		var shadow = new google.maps.MarkerImage(
			  "/assets/marker_shadow.png",
			  new google.maps.Size(200,56),
			  new google.maps.Point(0,0),
			  new google.maps.Point(80,56)
		  );
		var shape = {
			  coord: [0, 0, 160,56],
			  type: "rect"
		  };
	markers.push(new google.maps.Marker({
			position: marker_points[iterator],
			draggable: false,
			raiseOnDrag: false,
			icon: image,
			shadow: shadow,
			shape: shape,
			map: map,
			animation: google.maps.Animation.DROP
	}));
	iterator++;
}



$(document).ready(function() {
	$("#oc").toggle(function(){
		$("#oc_menu").animate({height:'244'},244);
		$(this).addClass('open');
		return false;
	},function(){
		$("#oc_menu").animate({height:'0'},244);
		$(this).removeClass('open');
		return false;
	});
	
	initialize_eos_map();
});