(function(){
	var category = angular.module('category', []);
	
	var options = [ {name: "Raptors", id: '22'}, {name: "Other", id: '19'}, {name: "Sea & Shorebirds", id: '20'}, {name: "Wading", id: '21'}, {name: "Waterfowl", id: '18'} ];
	
	category.controller('CategoryFilter', ['$scope', '$http', function( $scope, $http ){
		$scope.options = options;
    $http.get('http://localhost/API/type').success( function( data ){

      $scope.entries = data;
    });    
	}]);

})();