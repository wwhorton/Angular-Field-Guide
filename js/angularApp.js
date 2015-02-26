(function(){
  
/***Globals***/

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
  types.url = '/app/partials/browseAccordion.html';
    
  var habitats = [ {'name': 'Aquatic Reefs & Pilings'}, {'name': 'Beaches & Tidal Flats'}, {'name': 'Forests & Uplands'}, {'name': 'Marshes & Wetlands'}, {'name': 'Open Waters'}, {'name': 'Shallow Waters'}, {'name': 'Streams & Rivers' }];
  habitats.url = '/app/partials/browseList.html';

/***Services***/

  fieldGuide.factory( 'data', [ '$http', function( $http ){
    var entries = {};
    var promise;
    entries.getEntries = function(){
      if( !promise ){
        alert( "Yay!" );
        promise = $http.jsonp('http://www.chesapeakebay.net/site/API_test?callback=JSON_CALLBACK');
      }
      return promise;
    }
    return entries;
  }]);
  
/***Filters***/

  fieldGuide.filter( 'category', function() {
    return function( data, category ){
      
    };  
  });
  
/***Router***/
  
  fieldGuide.config(['$routeProvider', '$locationProvider', 
    function($routeProvider, $locationProvider) {
      $routeProvider.
        when( '/', {
          templateUrl: '/app/partials/start.html',
          controller: 'StartController'
        }).
        when( '/habitats/:habitat', {
          templateUrl: '/app/partials/habitat.html',
          controller: 'HabitatController'
        }).
        when( '/type/:category', {
          templateUrl: '/app/partials/entryList.html',
          controller: 'CategoryList'
        }).
        when( '/type/:category/subtype/:subcategory', {
          templateUrl: '/app/partials/entryList.html',
          controller: 'CategoryList'
        }).
        when( '/entry/:url_title', {
          templateUrl: '/app/partials/entry.html',
          controller: 'CategoryList'
        }).
        otherwise({
          redirectTo: '/'
        });
      $locationProvider.html5Mode( true );
  }]);
 
/***Controllers***/
 
  fieldGuide.controller( 'StartController', [ '$scope', '$timeout', function( $scope, $timeout ){
    $scope.categories = { selected: 'types', options: types, templateUrl: '/app/partials/browseAccordion.html' };
    $scope.updateCategories = function(){
      $scope.categories.options = eval( $scope.categories.selected );
    };

  }]);
  
  fieldGuide.controller( 'HabitatController', [ '$scope', '$http', '$routeParams', '$timeout', 'data', function( $scope, $http, $routeParams, $timeout, data ){
    $scope.entries = {};
    data.getEntries().then( function( result ){
      $scope.entries = result.data;
    });
    $scope.habitat = $routeParams.habitat;
  }]);
  
  fieldGuide.controller( 'NavController', [ '$scope', function( $scope ){
    $scope.types = types;
    $scope.habitats = habitats;
    $scope.navItems = _.map( $scope.types, function( type ){
      return type.name;
    });
    $scope.navItems = $scope.navItems.concat( habitats );
  }]);
	
  fieldGuide.controller('CategoryList', ['$scope', '$http', '$routeParams', function( $scope, $http, $routeParams ){
    $http.jsonp('http://www.chesapeakebay.net/site/API_test?callback=JSON_CALLBACK').success( function( data ){
      $scope.entries = data;
      console.log( $scope.entries );
    });
    $scope.options = _.find( types, function( type ){
     return type.name === $routeParams.category;
    }).subtypes;
    $scope.category = $routeParams.category;
    $scope.subcategory = $routeParams.subcategory ? $routeParams.subcategory : 'All' ;
    $scope.url_title = $routeParams.url_title;

    $scope.$watch( $routeParams.category );
	}]);


})();