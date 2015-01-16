(function(){
	var category = angular.module('category', []);
	
	var options = [ {name: "Raptors", id: '22'}, {name: "Other", id: '19'}, "Sea & Shorebirds", "Wading", "Waterfowl" ];
	
	category.controller('CategoryFilter', ['$scope', '$http', function( $scope, $http ){
		$scope.options = options;
    $http.get('http://localhost/API/entries').success( function( data ){

      $scope.entries = data;
    });    
	}]);

})();