(function(){
	var fieldGuide = angular.module('fieldGuide', [ 'ngRoute', 'mm.foundation' ]);

  var types = [ 
      { 'name' : 'Algae',
        'subtypes' : [ 'All' ]
      },
      { 'name' : 'Bay Grasses (SAV)',
        'subtypes' : [ 'All', 'Low Salinity', 'Medium Salinity', 'High Salinity' ]
      },
      { 'name' : 'Birds',
        'subtypes' : [ 'All', 'Raptors', 'Other', 'Waterfowl', 'Wading', 'Sea & Shorebirds' ]
      },
      { 'name' : 'Fish',
        'subtypes' : [ 'All', 'Freshwater Fish', 'Estuarine Fish', 'Saltwater Fish' ]
      },
      { 'name' : 'Insects',
        'subtypes' : [ 'All' ]
      },
      { 'name' : 'Invertebrates', 
        'subtypes' : [ 'All', 'Arthropods', 'Mollusks', 'Other Invertebrates' ]
      },
      { 'name' : 'Mammals',
        'subtypes' : [ 'All', 'Aquatic', 'Semi-Aquatic', 'Land', 'Flying' ]
      },
      { 'name' : 'Plants & Trees',
        'subtypes' : [ 'All', 'Flowers', 'Trees & Shrubs', 'Aquatic & Wetland Plants' ]
      },
      { 'name' : 'Reptiles & Amphibians',
        'subtypes' : [ 'All', 'Amphibians', 'Reptiles' ]
      }
    ];
  var habitats = [ 'Aquatic Reefs & Pilings', 'Beaches & Tidal Flats', 'Forests & Uplands', 'Marshes & Wetlands', 'Open Waters', 'Shallow Waters', 'Streams & Rivers' ];
    
  fieldGuide.config(['$routeProvider', '$locationProvider', 
    function($routeProvider, $locationProvider) {
      $routeProvider.
        when( '/', {
          templateUrl: '/app/partials/start.html',
          controller: 'StartCtrl'
        }).
        when( '/category/:category', {
          templateUrl: '/app/partials/entryList.html',
          controller: 'CategoryFilter'
        }).
        when( '/category/:category/subcategory/:subcategory', {
          templateUrl: '/app/partials/entryList.html',
          controller: 'CategoryFilter'
        }).
        when( '/entry/:url_title', {
          templateUrl: '/app/partials/entry.html',
          controller: 'CategoryFilter'
        }).
        otherwise({
          redirectTo: '/'
        });
      $locationProvider.html5Mode( true );
  }]);
  
  fieldGuide.controller( 'StartCtrl', [ '$scope', '$timeout', function( $scope, $timeout ){
    $scope.types = types;
    $scope.habitats = habitats;
    $scope.navItems = _.map( $scope.types, function( type ){
      return type.name;
    });
    $scope.navItems = $scope.navItems.concat( habitats );
    $timeout( function(){
       $( document ).foundation();
    });
  }]);
  
  fieldGuide.controller( 'NavCtrl', [ '$scope', function( $scope ){
    $scope.types = types;
    $scope.habitats = habitats;
    $scope.navItems = _.map( $scope.types, function( type ){
      return type.name;
    });
    $scope.navItems = $scope.navItems.concat( habitats );
  }]);
	
  fieldGuide.controller('CategoryFilter', ['$scope', '$http', '$routeParams', function( $scope, $http, $routeParams ){
    $scope.options = _.find( types, function( type ){
     return type.name === $routeParams.category;
    }).subtypes;
    $scope.category = $routeParams.category;
    $scope.subcategory = $routeParams.subcategory ? $routeParams.subcategory : 'All' ;
    $scope.url_title = $routeParams.url_title;
    $http.jsonp('http://www.chesapeakebay.net/site/API_test?callback=JSON_CALLBACK').success( function( data ){
      $scope.entries = data;
    });
    $scope.$watch( $routeParams.category );
	}]);


})();