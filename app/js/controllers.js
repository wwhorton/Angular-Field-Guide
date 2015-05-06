'use strict';

( function(){

  var fieldGuideControllers = angular.module( 'fieldGuideControllers', [] );
  
  fieldGuideControllers.controller( 'StartController', [ '$scope', '$rootScope', '$timeout', 'getEntries', 'critterOfTheMonth', 'renderHtml', 'equalize', function( $scope, $rootScope, $timeout, getEntries, critterOfTheMonth, renderHtml, equalize ){
    $scope.categories = {
                          types : { selected: 'types', options: $rootScope.types, templateUrl: '/partials/browseAccordion.html' },
                          habitats : { selected: 'habitats', options: $rootScope.habitats, templateUrl: '/partials/browseList.html' }
    };  
    $scope.renderHtml = renderHtml;
    $scope.entries = $rootScope.entries;
    $scope.critter = {};
    /*getEntries().then( function( result ){
      $scope.entries = result.data;
      $scope.critter = critterOfTheMonth( $scope.entries );
      equalize();
    });*/
  }]);
  
  fieldGuideControllers.controller( 'HabitatController', [ '$scope', '$rootScope', '$http', '$routeParams', '$filter', 'renderHtml', 'equalize', function( $scope, $rootScope, $http, $routeParams, $filter, renderHtml, equalize ){
    var matches, results;
    $scope.FG = { 'entries': $rootScope.entries };
    $scope.habitat = {};
    $scope.selection = { 'type': '' };
    $scope.types = $filter( 'filter' )( $scope.entries, $routeParams.habitat );
    console.log( $scope.types );
    $scope.renderHtml = renderHtml;
    
    $scope.habitat = _.find( $rootScope.habitats, function( habitat ){
      return habitat.name === $routeParams.habitat;
    });
    $scope.$watchGroup( [ 'entries', 'selection.type' ], function( newVal, oldVal ){
      if( newVal[0] !== oldVal[0] || newVal[1] !== oldVal[1] ){
        equalize();
      }
    }, true );
  }]);
  
  fieldGuideControllers.controller( 'TypeController', [ '$scope', '$rootScope', '$http', '$routeParams', '$location', 'renderHtml', 'equalize', function( $scope, $rootScope, $http, $routeParams, $location, renderHtml, equalize ){
    $scope.FG = { 'entries': $rootScope.entries };
    $scope.selection = { 
                      'subtype' : ( !$routeParams.subtype ) ? '' : $routeParams.subtype ,
                      'type' : $routeParams.type,
                      'blurb' : _.find( $rootScope.types, function( type ){
                                    return type.name === $routeParams.type;
                                  }).blurb,
                      'options' : _.find( $rootScope.types, function( type ){
                                    return type.name === $routeParams.type;
                                  }).subtypes
                      };                  
    $scope.renderHtml = renderHtml;
    $scope.$watch( 'selection.subtype', function( newVal, oldVal ){
      if( newVal !== oldVal ){
        equalize();
        var path = ( $scope.selection.subtype ) ? '/type/' + $scope.selection.type + '/subtype/' + $scope.selection.subtype : '/type/' + $scope.selection.type;
        $location.path( path );
      }
    }, true);
  }]);
  
  fieldGuideControllers.controller( 'NavController', [ '$scope', '$rootScope', function( $scope, $rootScope ){
    $scope.types = $rootScope.types;
    $scope.habitats = $rootScope.habitats;
    $scope.navItems = _.map( $scope.types, function( type ){
      return type.name;
    });
    $scope.navItems = $scope.navItems.concat( $rootScope.habitats );

  }]);
  
  fieldGuideControllers.controller( 'ResultsController', [ '$scope', '$routeParams', '$sce', 'getEntries', 'entriesByKeywordFilter', 'equalize', function( $scope, $routeParams, $sce, getEntries, entriesByKeywordFilter, equalize ){
    $scope.results = { 'entries': '' };
    $scope.results.entries = entriesByKeywordFilter( $rootScope.entries, $routeParams.query );

  }]);
  
  fieldGuideControllers.controller( 'EntryController', [ '$scope', '$routeParams', '$sce', 'getEntries', 'renderHtml', 'renderSrc', 'entryByTitleFilter', 'relatedCritters', 'makeButtons', 'getFlickr', function( $scope, $routeParams, $sce, getEntries, renderHtml, renderSrc, entryByTitleFilter, relatedCritters, makeButtons, getFlickr ){
    getEntries().then( function( result ){
      $scope.entries = result.data;
      $scope.entry = entryByTitleFilter( $scope.entries, $routeParams.title );
      makeButtons( $scope.entry );
      $scope.relatedCategories = _.map( $scope.entry.categories, function( category ){
        return category.category_name;
      });
      $scope.relatedCritters = _.shuffle( relatedCritters( $scope.entries, $scope.entry ) );
      $scope.entry.images = [];
      getFlickr( $scope.entry.flickr_tags ).then( function( results ){
        var images = $( $.parseXML( results.data ) ).find( 'photo' );
        for( var i = 0; i < images.length; i++ ){
          $scope.entry.images.push( images[i].attributes );
        }
        for( i = 0; i < $scope.entry.images.length; i++ ){
          $scope.entry.images[i].url = 'https://farm'+$scope.entry.images[i].farm.value+'.staticflickr.com/'+$scope.entry.images[i].server.value+'/'+$scope.entry.images[i].id.value+'_'+$scope.entry.images[i].secret.value+'.jpg';
          $scope.entry.images[i].caption =  $( images[i] ).find( 'description' ).text();
        }
        
      });  
     
    });
    $scope.title = $routeParams.title;
    $scope.renderHtml = renderHtml;
    $scope.renderSrc = renderSrc;

	}]);
})();