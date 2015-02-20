(function(){
	var category = angular.module('category', [ 'ngRoute' ]);
  //var options = [ "Fish", "Birds", "Algae", "Bay Grasses (SAV)", "Insects", "Invertebrates", "Mammals", "Plants & Trees", "Reptiles & Amphibians" ];
  var options = [ "Raptors", "Wading", "Waterfowl", "Sea & Shorebirds", "Other" ];
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
  
  category.config(['$routeProvider', 
    function($routeProvider) {
      $routeProvider.
        when( '/category/:category', {
          templateUrl: '/app/partials/entryList.html',
          controller: 'CategoryFilter'
        }).
        when( '/entry/:entryName', {
          templateUrl: '/app/partials/entry.html',
          controller: 'CategoryFilter'
        }).
        otherwise({
          redirectTo: '/category/:category'
        });
  }]);
	
  category.controller('CategoryFilter', ['$scope', '$http', 'FilterOptions', function( $scope, $http, FilterOptions ){
    $scope.options = options;
    $scope.type = $( "#type" ).text();
    $scope.subtype = "";

   /* FilterOptions.getOptions().then( function( data ){
      $.each( data, function( key, value ){
        if( value.parentType == $scope.type ){
          value.title = _.unescape( value.title );
          value.parentType = _.unescape( value.parentType );
          $scope.options.push( { "title" : value.title, "parentType" : value.parentType } )
        }
      });
    }); */
    
    $http.jsonp('http://www.chesapeakebay.net/site/API_test?callback=JSON_CALLBACK').success( function( data ){
      console.log( data );
      $scope.entries = data;
    });    
	}]);

})();