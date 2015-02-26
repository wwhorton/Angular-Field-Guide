(function(){
  
/***Globals***/

	var fieldGuide = angular.module('fieldGuide', [ 'ngRoute', 'mm.foundation' ]);

  var types = [ 
      { 'name' : 'Algae'
      },
      { 'name' : 'Bay Grasses (SAV)',
        'subtypes' : [ 'Low Salinity', 'Medium Salinity', 'High Salinity' ]
      },
      { 'name' : 'Birds',
        'subtypes' : [ 'Raptors', 'Other', 'Waterfowl', 'Wading', 'Sea & Shorebirds' ]
      },
      { 'name' : 'Fish',
        'subtypes' : [ 'Freshwater Fish', 'Estuarine Fish', 'Saltwater Fish' ]
      },
      { 'name' : 'Insects'
      },
      { 'name' : 'Invertebrates', 
        'subtypes' : [ 'Arthropods', 'Mollusks', 'Other Invertebrates' ]
      },
      { 'name' : 'Mammals',
        'subtypes' : [ 'Aquatic', 'Semi-Aquatic', 'Land', 'Flying' ]
      },
      { 'name' : 'Plants & Trees',
        'subtypes' : [ 'Flowers', 'Trees & Shrubs', 'Aquatic & Wetland Plants' ]
      },
      { 'name' : 'Reptiles & Amphibians',
        'subtypes' : [ 'Amphibians', 'Reptiles' ]
      }
    ];
  types.url = '/app/partials/browseAccordion.html';
    
  var habitats = [ {'name': 'Aquatic Reefs & Pilings'}, {'name': 'Beaches & Tidal Flats'}, {'name': 'Forests & Uplands'}, {'name': 'Marshes & Wetlands'}, {'name': 'Open Waters'}, {'name': 'Shallow Waters'}, {'name': 'Streams & Rivers' }];
  habitats.url = '/app/partials/browseList.html';

/***Services***/

  fieldGuide.factory( 'getEntries', [ '$http', function( $http ){
    var promise;
    var getEntries = function(){
      if( !promise ){
        promise = $http.jsonp('http://www.chesapeakebay.net/site/API_test?callback=JSON_CALLBACK');
      }
      return promise;
    }
    return getEntries;
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
        when( '/type/:type', {
          templateUrl: '/app/partials/entryList.html',
          controller: 'TypeController'
        }).
        when( '/type/:type/subtype/:subtype', {
          templateUrl: '/app/partials/entryList.html',
          controller: 'TypeController'
        }).
        when( '/entry/:title', {
          templateUrl: '/app/partials/entry.html',
          controller: 'EntryController'
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
  
  fieldGuide.controller( 'HabitatController', [ '$scope', '$http', '$routeParams', '$timeout', 'getEntries', function( $scope, $http, $routeParams, $timeout, getEntries ){
    $scope.entries = {};
    getEntries().then( function( result ){
      $scope.entries = result.data;
    });
    $scope.habitat = $routeParams.habitat;
  }]);
  
  fieldGuide.controller( 'TypeController', [ '$scope', '$http', '$routeParams', '$timeout', 'getEntries', function( $scope, $http, $routeParams, $timeout, getEntries ){
    $scope.subtype = ( !$routeParams.subtype ) ? "" : $routeParams.subtype;
    $scope.entries = {};
    getEntries().then( function( result ){
      $scope.entries = result.data;
    });
    $scope.type = $routeParams.type;
    $scope.options = _.find( types, function( type ){
     return type.name === $routeParams.type;
    }).subtypes;
    
  }]);
  
  fieldGuide.controller( 'NavController', [ '$scope', function( $scope ){
    $scope.types = types;
    $scope.habitats = habitats;
    $scope.navItems = _.map( $scope.types, function( type ){
      return type.name;
    });
    $scope.navItems = $scope.navItems.concat( habitats );
  }]);
  
  fieldGuide.controller( 'EntryController', [ '$scope', '$routeParams', 'getEntries', function( $scope, $routeParams, getEntries ){
    getEntries().then( function( result ){
      $scope.entries = result.data;
    });
    $scope.title = $routeParams.title;
	}]);
  
  fieldGuide.controller('CategoryList', ['$scope', '$http', '$routeParams', function( $scope, $http, $routeParams ){
    $http.jsonp('http://www.chesapeakebay.net/site/API_test?callback=JSON_CALLBACK').success( function( data ){
      $scope.entries = data;
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