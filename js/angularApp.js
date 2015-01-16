(function(){
	var app = angular.module('app', []);
	
	var options = [ "Raptors", "Other", "Sea & Shorebirds", "Wading", "Waterfowl" ];
	
	/*var entries = [
	{"image": "http://placehold.it/300x200", "name": "Albatross", "scientificName": "Diomedea exulans", "subtype": "other"},
	{"image": "http://placehold.it/300x200", "name": "Monkey", "scientificName": "Diomedea exulans", "subtype": "raptor"},
	{"image": "http://placehold.it/300x200", "name": "Lorakeet", "scientificName": "Diomedea exulans", "subtype": "raptor"},
	{"image": "http://placehold.it/300x200", "name": "Rockfish", "scientificName": "Diomedea exulans", "subtype": "waterfowl"},
	{"image": "http://placehold.it/300x200", "name": "Capybara", "scientificName": "Diomedea exulans", "subtype": "sea & shorebirds"},
	{"image": "http://placehold.it/300x200", "name": "Pigeon", "scientificName": "Diomedea exulans", "subtype": "other"},
	{"image": "http://placehold.it/300x200", "name": "Sand Dollar", "scientificName": "Diomedea exulans", "subtype": "other"}
	];*/
	
	app.controller('CategoryFilter', ['$scope', '$http', function( $scope, $http ){
		$scope.options = options;
    $http.get('http://localhost/API/field_guide_entries').success( function( data ){
      $scope.entries = data;
    });
    
	}]);

})();