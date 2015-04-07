'use strict';

(function(){
  
/***Globals***/

	var fieldGuide = angular.module('fieldGuide', [ 'ngRoute', 'mm.foundation' ]);

  var types = [ 
      { 'name' : 'Algae',
        'image' : '/images/algae.jpg',
        'blurb' : 'Algae are simple plants that lack roots, stems, leaves and a vascular system. Like all other plants, algae go through photosynthesis and need sunlight to grow.'
      },
      { 'name' : 'Bay Grasses (SAV)',
        'subtypes' : [ 'Low Salinity', 'Medium Salinity', 'High Salinity' ],
        'image' : '/images/Bay Grass.jpg',
        'blurb' : 'Bay grasses - also known as submerged aquatic vegetation or SAV - are plants that grow underwater in the Chesapeake Bay\'s shallows. More than 16 species of bay grasses grow in the Bay and its tributaries.'
      },
      { 'name' : 'Birds',
        'subtypes' : [ 'Raptors', 'Other', 'Waterfowl', 'Wading', 'Sea & Shorebirds' ],
        'image' : '/images/Birds.jpg',
        'blurb' : 'Hundreds of species of birds live in the Chesapeake Bay watershed. Some birds live here year-round, while others migrate to the Bay region to feed or nest.'
      },
      { 'name' : 'Fish',
        'subtypes' : [ 'Freshwater Fish', 'Estuarine Fish', 'Saltwater Fish' ],
        'image' : '/images/Fish.jpg',
        'blurb' : 'Approximately 350 species of fish live in the Chesapeake Bay. Some fish are year-round residents, while others swim into the Bay from the ocean to feed, reproduce or find shelter.'
      },
      { 'name' : 'Insects',
        'image' : '/images/Insects.jpg',
        'blurb' : 'Thousands of species of insects live in the Chesapeake Bay region. Insects are found in nearly every habitat, from deep woods to sandy beaches to our own backyards. Some insects live on the land, while others spend most of their time in the water.'
      },
      { 'name' : 'Invertebrates', 
        'subtypes' : [ 'Arthropods', 'Mollusks', 'Other Invertebrates' ],
        'image' : '/images/Invertebrates.jpg',
        'blurb' : 'Invertebrates are animals without a backbone. Hundreds of species of invertebrates live in the Chesapeake Bay.'
      },
      { 'name' : 'Mammals',
        'subtypes' : [ 'Aquatic', 'Semi-Aquatic', 'Land', 'Flying' ],
        'image' : '/images/Mammals.jpg',
        'blurb' : 'Mammals are an extremely diverse class of animals, ranging from bats, squirrels and rabbits to bobcats, dolphins and humans.'
      },
      { 'name' : 'Plants & Trees',
        'subtypes' : [ 'Flowers', 'Trees & Shrubs', 'Aquatic & Wetland Plants' ],
        'image' : '/images/Plants.jpg',
        'blurb' : 'More than 2,700 types of plants grow throughout the Chesapeake Bay watershed. Plants grow in nearly every habitat: from upland forests to the Bay\'s shoreline to our own backyards.'
      },
      { 'name' : 'Reptiles & Amphibians',
        'subtypes' : [ 'Amphibians', 'Reptiles' ],
        'image' : '/images/Reptiles.jpg',
        'blurb' : 'Reptiles and amphibians are cold-blooded vertebrates. They are sometimes called herps.'
      }
    ];

  var habitats = [ 
      { 'name': 'Aquatic Reefs & Pilings',
        'image': '/images/pilings.jpg'
      },
      { 'name': 'Beaches & Tidal Flats',
        'image': '/images/tidal flats.jpg'
      },
      { 'name': 'Forests & Uplands',
        'image': '/images/forest.jpg'
      },
      { 'name': 'Marshes & Wetlands',
        'image': '/images/wetlands.jpg'
      },
      { 'name': 'Open Waters',
        'image': '/images/open water.jpg'
      },
      { 'name': 'Shallow Waters',
        'image': '/images/shallow water.jpg'
      },
      { 'name': 'Streams & Rivers',
        'image': '/images/river.jpg'
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
    };
    return getEntries;
  }]);
  
  fieldGuide.factory( 'renderHtml', [ '$sce', function( $sce ){
    var renderHtml = function( raw_html ){
      return $sce.trustAsHtml( raw_html );
    };
    return renderHtml;
  }]);
  
  fieldGuide.factory( 'renderSrc', [ '$sce', function( $sce ){
    var renderSrc = function( raw_html ){
      return $sce.trustAsResourceUrl( raw_html );
    };
    return renderSrc;
  }]);
  
  fieldGuide.factory( 'randomCritter', function(){
    var getCritter = function( critters ) {
      var max = critters.length;
      var index = Math.random() * ( max );
      return critters[ Math.round( index ) ];
    };
    return getCritter;
  }); 
  
  fieldGuide.factory( 'makeButtons', function(){
    var makeButtons = function( critter ){
      critter.buttons = {};
      critter.buttons.type = _.find( critter.categories, function( category ){
          for( var i = 0; i < types.length; i++ ){
           if( types[i].name === category.category_name ){
             return true;
           }
         }
      }).category_name;
      critter.buttons.habitats = _.filter( critter.categories, function( category ){
          for( var i = 0; i < habitats.length; i++ ){
           if( habitats[i].name === category.category_name ){
             return true;
           }
         }
      });    
      critter.buttons.subtype = _.find( critter.categories, function( category ){
        var results;
        function matchCategory( subtype ){
          if( subtype === category.category_name ){
            results = true;
          }
        }
        
        for( var i = 0; i < types.length; i++ ){
            _.compact( types[i].subtypes ).forEach( matchCategory );
        }
        return results;
      });
      critter.buttons.subtype = ( critter.buttons.subtype ) ? critter.buttons.subtype.category_name : undefined;
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
      }, 100 );
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
      templateUrl: '/partials/entry-block.html',
      link: function( scope ){
        scope.fieldguide_homepageblurb = renderHtml( scope.fieldguide_homepageblurb );
      }
    };
  });
  
  fieldGuide.directive( 'searchBar', function( $location ){
    return {
      replace: true,
      templateUrl: '/partials/search-bar.html',
      link: function( scope, element, attributes ){
        $( '#searchIcon' ).on( 'click', function( e ){
          if( !$( "#searchButton" ).hasClass( "disabled" ) ){
            var thePath = '/search/' + scope.search.title;
            $location.path( thePath );
          }
        scope.$apply();
        });
        $( '#titleSearch' ).bind( 'keypress', function( event ){
          if( event.which == '13' ){
            $( '#searchIcon' ).click();
          }
        });
      }
    };
  });
  
  fieldGuide.directive( 'smallMediaQuery', function(){
    return {
      restrict: 'A',
      link: function( scope, element, attributes ){
        scope.checkSize = _.debounce( function(){
          scope.isSmall = window.matchMedia( "(max-width: 640px)" ).matches;
          scope.$apply();
        }, 100 );
        $( window ).on( 'load resize', scope.checkSize );
      }
    };
  });
  
  fieldGuide.directive( 'tags', [ 'makeButtons', function( makeButtons ){
    return {
      replace: true,
      restrict: 'E',
      templateUrl: '/partials/tags.html',
      scope: { tagEntry: '=entry' },
      link: function( scope, element, attributes ){
        makeButtons( scope.tagEntry );
      }
    };
  }]);
  fieldGuide.directive( 'navMenuItems', function(){
    return {
      restrict: 'E',
      replace: false,
      require: '^navMenu',
      transclude: true,
      templateUrl: '/partials/navMenuItems.html',
      link: function( scope, element, attributes, NavController ){
        scope.nav.hover = types[0];
        scope.nav.type = types[0];
        
      }
      
    };
  });
      
  fieldGuide.directive( 'navMenu', function(){
    return {
      replace: true,
      restrict: 'E',
      transclude: true,
      templateUrl: '/partials/headerNav.html',
      controller: 'NavController',
      link: function( scope, element, attributes ){
        $( document ).on( 'click', function( event ){
          if( !$( event.target ).closest( '#navMenu' ).length && $( event.target ).attr( 'id' ) != 'menuIcon' ) {
            scope.nav.showMenu = false;
            scope.$apply();
          }
        });

      }
      
    };
  });
  
  fieldGuide.directive( 'preview', function(){
    return {
      replace: true,
      restrict: 'E',
      transclude: true,
      templateUrl: '/partials/previewWindow.html',
      require: '^navMenu',
      link: function( scope, element, attributes ){
    
      }
      
    };
  });
    
  /***Router***/
  
  fieldGuide.config(['$routeProvider', '$locationProvider', 
    function($routeProvider, $locationProvider) {
      $routeProvider.
        when( '/', {
          templateUrl: '/partials/start.html',
          controller: 'StartController'
        }).
        when( '/search/:query', {
          templateUrl: '/partials/entryList.html',
          controller: 'ResultsController',
          caseInsensitiveMatch: true          
        }).
        when( '/habitats/:habitat', {
          templateUrl: '/partials/habitat.html',
          controller: 'HabitatController',
          caseInsensitiveMatch: true
        }).
        when( '/type/:type', {
          templateUrl: '/partials/entryList.html',
          controller: 'TypeController',
          caseInsensitiveMatch: true
        }).
        when( '/type/:type/subtype/:subtype', {
          templateUrl: '/partials/entryList.html',
          controller: 'TypeController',
          caseInsensitiveMatch: true
        }).
        when( '/entry/:title', {
          templateUrl: '/partials/entry.html',
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
                          types : { selected: 'types', options: types, templateUrl: '/partials/browseAccordion.html' },
                          habitats : { selected: 'habitats', options: habitats, templateUrl: '/partials/browseList.html' }
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
  
  fieldGuide.controller( 'HabitatController', [ '$scope', '$http', '$routeParams', '$timeout', 'getEntries', 'renderHtml', 'equalize', function( $scope, $http, $routeParams, $timeout, getEntries, renderHtml, equalize ){
    $scope.entries = {};
    $scope.habitat = {};
    $scope.renderHtml = renderHtml;
    getEntries().then( function( result ){
      $scope.entries = result.data;
    });
    $scope.habitat.title = $routeParams.habitat;
    equalize();
  }]);
  
  fieldGuide.controller( 'TypeController', [ '$scope', '$http', '$routeParams', '$location', 'getEntries', 'renderHtml', 'equalize', function( $scope, $http, $routeParams, $location, getEntries, renderHtml, equalize ){
    $scope.selection = { 
                      'subtype' : ( !$routeParams.subtype ) ? '' : $routeParams.subtype ,
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
      var path = ( $scope.selection.subtype ) ? '/type/' + $scope.selection.type + '/subtype/' + $scope.selection.subtype : '/type/' + $scope.selection.type;
      $location.path( path );
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
    $scope.results = {};
    getEntries().then( function( result ){
      $scope.results.entries = entriesByTitleFilter( result.data, $routeParams.query );
    });
  }]);
  
  fieldGuide.controller( 'EntryController', [ '$scope', '$routeParams', '$sce', 'getEntries', 'renderHtml', 'renderSrc', 'entryByTitleFilter', 'arrayByArrayFilter', 'makeButtons', function( $scope, $routeParams, $sce, getEntries, renderHtml, renderSrc, entryByTitleFilter, arrayByArrayFilter, makeButtons ){
    getEntries().then( function( result ){
      $scope.entries = result.data;
      $scope.entry = entryByTitleFilter( $scope.entries, $routeParams.title );
      $scope.relatedCategories = _.map( $scope.entry.categories, function( category ){
        return category.category_name;
      });
      makeButtons( $scope.entry );
    });
    $scope.title = $routeParams.title;
    $scope.renderHtml = renderHtml;
    $scope.renderSrc = renderSrc;

	}]);
  
})();