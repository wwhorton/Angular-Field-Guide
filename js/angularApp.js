(function(){
	var category = angular.module('category', []);
  
  category.factory( 'FilterOptions', [ '$q', '$http', function( $q, $http ){
    var _options = [];
    var getOptions = function(){
        var deferred = $q.defer();
        $http.get( 'http://localhost/API/subtype' ).success( function( data ){
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
          value.title = _.unescape( value.title );
          value.parentType = _.unescape( value.parentType );
          $scope.options.push( { "title" : value.title, "parentType" : value.parentType } )
        }
      });
    });
    
    $http.jsonp('http://www.chesapeakebay.net/site/API_test?callback=JSON_CALLBACK').success( function( data ){
      console.log( data );
      $scope.entries = data;
    });    
	}]);

})();