(function(){
	var category = angular.module('category', []);
	
	var options = [ {title: "Raptors", id: '22'}, {title: "Other", id: '19'}, {title: "Sea & Shorebirds", id: '20'}, {title: "Wading", id: '21'}, {title: "Waterfowl", id: '18'} ];
	
	category.controller('CategoryFilter', ['$scope', '$http', function( $scope, $http ){
		$scope.options = options;
    $http.get('http://localhost/API/type').success( function( data ){

      $scope.entries = data;
    });    
	}]);

})();