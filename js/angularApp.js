(function(){
	var category = angular.module('category', []);
  
  category.factory( 'FilterOptions', [ '$q', '$http', function( $q, $http ){
    var _options = [];
    var getOptions = function(){
        var deferred = $q.defer();
        $http.jsonp( 'http://localhost/API/subtype' ).success( function( data ){
          deferred.resolve( data );
        });
        return deferred.promise;
      };
    return {
      getOptions: getOptions
    };
  }]);
	
	category.controller('CategoryFilter', ['$scope', '$http', 'FilterOptions', function( $scope, $http, FilterOptions ){
    $scope.options = [];
    $scope.type = $( "#type" ).text();
    
    FilterOptions.getOptions().then( function( data ){
      $.each( data, function( key, value ){
        if( value.parentType == $scope.type ){
          $scope.options.push( { "title" : value.title, "parentType" : value.parentType } )
        }
      });
    });
    
    $http.jsonp('http://localhost/API/type').success( function( data ){
      $scope.entries = data;
    });    
	}]);

})();