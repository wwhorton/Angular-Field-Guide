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
  
  fieldGuide.factory( 'renderHtml', [ '$sce', function( $sce ){
    var renderHtml = function( raw_html ){
      return $sce.trustAsHtml( raw_html );
    }
    return renderHtml;
  }]);
  
  fieldGuide.factory( 'renderSrc', [ '$sce', function( $sce ){
    
    var renderSrc = function( raw_html ){
      return $sce.trustAsResourceUrl( raw_html );
    }
    return renderSrc;
  }]);
  
  fieldGuide.factory( 'randomCritter', function(){
    var getCritter = function( critters ) {
      var max = critters.length;
      var index = Math.random() * ( max );
      return critters[ Math.round( index ) ];
    }
    return getCritter;
  }); 
  
/***Filters***/

  fieldGuide.filter( 'category', function() {
    return function( data, category ){
      
    };  
  });
  
/***Directives***/
  
  fieldGuide.directive( 'audio', function( $sce ) {
    return {
      restrict: 'A',
      scope: { code:'=' },
      replace: true,
      template: '<audio ng-src="{{url}}" controls></audio>',
      link: function( scope ){
        scope.$watch( 'code', function( sourceUrl ){
          if( sourceUrl !== undefined ){
            scope.url = $sce.trustAsResourceUrl( sourceUrl );
          }
        });
      }
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
 
  fieldGuide.controller( 'StartController', [ '$scope', '$timeout', 'getEntries', 'randomCritter', 'renderHtml', function( $scope, $timeout, getEntries, randomCritter, renderHtml ){
    $scope.categories = { selected: 'types', options: types, templateUrl: '/app/partials/browseAccordion.html' };
    $scope.updateCategories = function(){
      $scope.categories.options = eval( $scope.categories.selected );
    };
    $scope.renderHtml = renderHtml;
    $scope.entries = {};
    $scope.critter = {};
    getEntries().then( function( result ){
      $scope.entries = result.data;
      $scope.critter = randomCritter( $scope.entries );
    });
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
  
  fieldGuide.controller( 'EntryController', [ '$scope', '$routeParams', '$sce', 'getEntries', 'renderHtml', 'renderSrc', function( $scope, $routeParams, $sce, getEntries, renderHtml, renderSrc ){
    getEntries().then( function( result ){
      $scope.entries = result.data;
      console.log( $scope.entries );
    });
    $scope.title = $routeParams.title;
    $scope.renderHtml = renderHtml;
    $scope.renderSrc = renderSrc;
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