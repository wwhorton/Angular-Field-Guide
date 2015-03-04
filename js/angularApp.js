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

  fieldGuide.filter( 'entryByTitle', function() {
    return function( array, title ){
      return _.find( array, function( entry ){
        return entry.title === title;
      });  
    };  
  });
  
  fieldGuide.filter( 'arrayByArray', function() {
    return function( array1, criteria ){
      _.each( array1, function( array1Item ){
        return array1Item.category_name === criteria ;
      });
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
      $scope.critter.buttons = {};
      $scope.critter.type = _.filter( $scope.critter.categories, function( category ){
          for( var i = 0; i < types.length; i++ ){
           if( types[i].name === category.category_name ){
             return true;
           }
         }
      });
      $scope.critter.habitats = _.filter( $scope.critter.categories, function( category ){
          for( var i = 0; i < habitats.length; i++ ){
           if( habitats[i].name === category.category_name ){
             return true;
           }
         }
      });
      $scope.critter.subtype = _.filter( $scope.critter.categories, function( category ){
        var results;
        for( var i = 0; i < types.length; i++ ){
            _.compact( types[i].subtypes ).forEach( function( subtype ){
              if( subtype === category.category_name ){
                results = true;
              }
            });
        }
        return results;
      });     
    });
  }]);
  
  fieldGuide.controller( 'HabitatController', [ '$scope', '$http', '$routeParams', '$timeout', 'getEntries', 'renderHtml', function( $scope, $http, $routeParams, $timeout, getEntries, renderHtml ){
    $scope.entries = {};
    $scope.habitat = {};
    $scope.renderHtml = renderHtml;
    getEntries().then( function( result ){
      $scope.entries = result.data;
      console.log( $scope.entries );
    });
    $scope.habitat.title = $routeParams.habitat;
    $timeout( function(){
      $(document).foundation( {
        equalizer: {
          equalize_on_stack: true
        }
      }, 'equalizer', 'reflow' );
    });

  }]);
  
  fieldGuide.controller( 'TypeController', [ '$scope', '$http', '$routeParams', 'getEntries', function( $scope, $http, $routeParams, getEntries ){
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
  
  fieldGuide.controller( 'SearchController', [ '$scope', 'getEntries', function( $scope, getEntries ){
    $scope.search = { };
    getEntries().then( function( result ){
      $scope.search.entries = result.data;
    });
    $scope.search.reset = function(){
      $scope.search.title = '';
    };
      
  }]);
  
  fieldGuide.controller( 'EntryController', [ '$scope', '$routeParams', '$sce', 'getEntries', 'renderHtml', 'renderSrc', 'entryByTitleFilter', 'arrayByArrayFilter', function( $scope, $routeParams, $sce, getEntries, renderHtml, renderSrc, entryByTitleFilter, arrayByArrayFilter ){
    getEntries().then( function( result ){
      $scope.entries = result.data;
      $scope.entry = entryByTitleFilter( $scope.entries, $routeParams.title );
      $scope.relatedCategories = _.map( $scope.entry.categories, function( category ){
        return category.category_name;
      });
    });
    $scope.title = $routeParams.title;
    $scope.renderHtml = renderHtml;
    $scope.renderSrc = renderSrc;

	}]);
  
})();