(function(){
  
/***Globals***/

	var fieldGuide = angular.module('fieldGuide', [ 'ngRoute', 'mm.foundation' ]);

  var types = [ 
      { 'name' : 'Algae',
        'image' : '/app/images/algae.jpg'
      },
      { 'name' : 'Bay Grasses (SAV)',
        'subtypes' : [ 'Low Salinity', 'Medium Salinity', 'High Salinity' ],
        'image' : '/app/images/Bay Grass.jpg'
      },
      { 'name' : 'Birds',
        'subtypes' : [ 'Raptors', 'Other', 'Waterfowl', 'Wading', 'Sea & Shorebirds' ],
        'image' : '/app/images/Birds.jpg'
      },
      { 'name' : 'Fish',
        'subtypes' : [ 'Freshwater Fish', 'Estuarine Fish', 'Saltwater Fish' ],
        'image' : '/app/images/Fish.jpg'
      },
      { 'name' : 'Insects',
        'image' : '/app/images/Insects.jpg'
      },
      { 'name' : 'Invertebrates', 
        'subtypes' : [ 'Arthropods', 'Mollusks', 'Other Invertebrates' ],
        'image' : '/app/images/Invertebrates.jpg'
      },
      { 'name' : 'Mammals',
        'subtypes' : [ 'Aquatic', 'Semi-Aquatic', 'Land', 'Flying' ],
        'image' : '/app/images/Mammals.jpg'        
      },
      { 'name' : 'Plants & Trees',
        'subtypes' : [ 'Flowers', 'Trees & Shrubs', 'Aquatic & Wetland Plants' ],
        'image' : '/app/images/Plants.jpg'        
      },
      { 'name' : 'Reptiles & Amphibians',
        'subtypes' : [ 'Amphibians', 'Reptiles' ],
        'image' : '/app/images/Reptiles.jpg'        
      }
    ];

  var habitats = [ 
      { 'name': 'Aquatic Reefs & Pilings',
        'image': '/app/images/pilings.jpg'
      },
      { 'name': 'Beaches & Tidal Flats',
        'image': '/app/images/tidal flats.jpg'
      },
      { 'name': 'Forests & Uplands',
        'image': '/app/images/forest.jpg'
      },
      { 'name': 'Marshes & Wetlands',
        'image': '/app/images/wetlands.jpg'
      },
      { 'name': 'Open Waters',
        'image': '/app/images/open water.jpg'
      },
      { 'name': 'Shallow Waters',
        'image': '/app/images/shallow water.jpg'
      },
      { 'name': 'Streams & Rivers',
        'image': '/app/images/river.jpg'
      }
    ];

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
  
  fieldGuide.factory( 'makeButtons', function(){
    var makeButtons = function( critter ){
      critter.buttons = {};
      critter.type = _.filter( critter.categories, function( category ){
          for( var i = 0; i < types.length; i++ ){
           if( types[i].name === category.category_name ){
             return true;
           }
         }
      });
      critter.habitats = _.filter( critter.categories, function( category ){
          for( var i = 0; i < habitats.length; i++ ){
           if( habitats[i].name === category.category_name ){
             return true;
           }
         }
      });
      critter.subtype = _.filter( critter.categories, function( category ){
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
    };
    return makeButtons;
  });
  
  fieldGuide.factory( 'equalize', ['$timeout', function( $timeout ){
    return function(){
      $timeout( function(){
        $(document).foundation( {
          equalizer: {
            equalize_on_stack: true
          }
        }, 'equalizer', 'reflow' );
      }, 30 );
    };
  }]);

/***Filters***/
  fieldGuide.filter( 'entriesByTitle', function() {
    return function( array, title ){
      return _.filter( array, function( item ){
        return item.title.toUpperCase().indexOf( title.toUpperCase() ) > -1;
      });
    };
  });

  fieldGuide.filter( 'entryByTitle', function() {
    return function( array, title ){
      return _.find( array, function( entry ){
        return entry.title.toUpperCase() === title.toUpperCase();
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
  
  fieldGuide.directive( 'entryBlock', function( renderHtml, equalize ) {
    return {
      restrict: 'AE',
      replace: true,
      scope: { thisEntry: '=entry' },
      templateUrl: '/app/partials/entry-block.html',
      link: function( scope ){
        scope.fieldguide_homepageblurb = renderHtml( scope.fieldguide_homepageblurb );
      }
    };
  });
  
  fieldGuide.directive( 'searchBar', function( $location ){
    return {
      replace: true,
      templateUrl: '/app/partials/search-bar.html',
      link: function( scope, element, attributes ){
        $( '#searchButton' ).on( 'click', function(){
          $location.path( '/search/' + scope.search.title );
          scope.search.title = '';
        });
        $( '#titleSearch' ).keypress( function( event ){
          if( event.which == 13 ){
            $( '#searchButton' ).click();
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
        when( '/search/:query', {
          templateUrl: '/app/partials/entryList.html',
          controller: 'ResultsController',
          caseInsensitiveMatch: true          
        }).
        when( '/habitats/:habitat', {
          templateUrl: '/app/partials/habitat.html',
          controller: 'HabitatController',
          caseInsensitiveMatch: true
        }).
        when( '/type/:type', {
          templateUrl: '/app/partials/entryList.html',
          controller: 'TypeController',
          caseInsensitiveMatch: true
        }).
        when( '/type/:type/subtype/:subtype', {
          templateUrl: '/app/partials/entryList.html',
          controller: 'TypeController',
          caseInsensitiveMatch: true
        }).
        when( '/entry/:title', {
          templateUrl: '/app/partials/entry.html',
          controller: 'EntryController',
          caseInsensitiveMatch: true
        }).
        otherwise({
          redirectTo: '/'
        });
      $locationProvider.html5Mode( true );
  }]);
 
/***Controllers***/
 
  fieldGuide.controller( 'StartController', [ '$scope', '$timeout', 'getEntries', 'randomCritter', 'renderHtml', 'equalize', function( $scope, $timeout, getEntries, randomCritter, renderHtml, equalize ){
    $scope.categories = {
                          types : { selected: 'types', options: types, templateUrl: '/app/partials/browseAccordion.html' },
                          habitats : { selected: 'habitats', options: habitats, templateUrl: '/app/partials/browseList.html' }
    };  
    $scope.renderHtml = renderHtml;
    $scope.entries = {};
    $scope.critter = {};
    getEntries().then( function( result ){
      $scope.entries = result.data;
      $scope.critter = randomCritter( $scope.entries );
    });
    equalize();
  }]);
  
  fieldGuide.controller( 'HabitatController', [ '$scope', '$http', '$routeParams', '$timeout', 'getEntries', 'renderHtml', 'makeButtons', 'equalize', function( $scope, $http, $routeParams, $timeout, getEntries, renderHtml, makeButtons, equalize ){
    $scope.entries = {};
    $scope.habitat = {};
    $scope.renderHtml = renderHtml;
    $scope.makeButtons = makeButtons;
    getEntries().then( function( result ){
      $scope.entries = result.data;
      console.log( $scope.entries );
    });
    $scope.habitat.title = $routeParams.habitat;
    equalize();
  }]);
  
  fieldGuide.controller( 'TypeController', [ '$scope', '$http', '$routeParams', 'getEntries', 'renderHtml', 'equalize', function( $scope, $http, $routeParams, getEntries, renderHtml, equalize ){
    $scope.selection = { 
                      'subtype' : ( !$routeParams.subtype ) ? "" : $routeParams.subtype ,
                      'type' : $routeParams.type,
                      'options' : _.find( types, function( type ){
                                    return type.name === $routeParams.type;
                                  }).subtypes
                                
                      };
    
    $scope.renderHtml = renderHtml;
    getEntries().then( function( result ){
      $scope.entries = result.data;
    });

    $scope.$watch( 'selection.subtype', function(){
      equalize();
    });
  }]);
  
  fieldGuide.controller( 'NavController', [ '$scope', function( $scope ){
    $scope.types = types;
    $scope.habitats = habitats;
    $scope.navItems = _.map( $scope.types, function( type ){
      return type.name;
    });
    $scope.navItems = $scope.navItems.concat( habitats );
  }]);
  
  fieldGuide.controller( 'ResultsController', [ '$scope', '$routeParams', 'getEntries', 'entriesByTitleFilter', function( $scope, $routeParams, getEntries, entriesByTitleFilter ){
    $scope.type = "";
    $scope.subtype = "";
    getEntries().then( function( result ){
      $scope.entries = entriesByTitleFilter( result.data, $routeParams.query );
    });
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