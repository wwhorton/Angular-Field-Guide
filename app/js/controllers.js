'use strict';

( function(){

  var fieldGuideControllers = angular.module( 'fieldGuideControllers', [] );
  
  fieldGuideControllers.controller( 'StartController', [ '$scope', '$rootScope', 'critterOfTheMonth', 'renderHtml', 'equalize', function( $scope, $rootScope, critterOfTheMonth, renderHtml, equalize ){
    $scope.categories = {
                          types : { selected: 'types', options: $rootScope.types, templateUrl: 'partials/browseAccordion.html' },
                          habitats : { selected: 'habitats', options: $rootScope.habitats, templateUrl: 'partials/browseList.html' }
    };  
    $scope.renderHtml = renderHtml;
    $scope.FG = { };
    $scope.FG.entries = $rootScope.entries;            
    $scope.FG.critter = critterOfTheMonth( $rootScope.entries );
    $scope.$watch( 'entries.length', function(){
      $scope.FG.entries = $rootScope.entries;            
      $scope.FG.critter = critterOfTheMonth( $rootScope.entries );
    });
  }]);
  
  fieldGuideControllers.controller( 'HabitatController', [ '$scope', '$rootScope', '$http', '$routeParams', '$filter', 'renderHtml', 'equalize', function( $scope, $rootScope, $http, $routeParams, $filter, renderHtml, equalize ){
    var matches, results;
    $scope.FG = { 'entries': $rootScope.entries };
    $scope.selection = { 'type': '' };
    $scope.types = $filter( 'filter' )( $scope.FG.entries, $routeParams.habitat );
    $scope.renderHtml = renderHtml;
    $scope.habitat = _.find( $rootScope.habitats, function( habitat ){
      return habitat.name === $routeParams.habitat;
    });
    $scope.$watchGroup( [ 'entries.length', 'selection.type' ], function(){
      $scope.FG = { 'entries': $rootScope.entries };
      $scope.types = $filter( 'filter' )( $scope.FG.entries, $routeParams.habitat );
      $scope.habitat = _.find( $rootScope.habitats, function( habitat ){
        return habitat.name === $routeParams.habitat;
      });
      equalize();
    });
  }]);
  
  fieldGuideControllers.controller( 'TypeController', [ '$scope', '$rootScope', '$http', '$routeParams', '$location', 'renderHtml', 'equalize', function( $scope, $rootScope, $http, $routeParams, $location, renderHtml, equalize ){
    $scope.FG = { 'entries': $rootScope.entries };
    $scope.FG.thisType = _.find( $rootScope.types, function( type ){
      return type.name === $routeParams.type;
    });
    $scope.selection = { 
                      'subtype' : ( !$routeParams.subtype ) ? '' : $routeParams.subtype ,
                      'image' : $scope.FG.thisType.image,
                      'type' : $scope.FG.thisType.name,
                      'blurb' : $scope.FG.thisType.blurb,
                      'text' : $scope.FG.thisType.text,
                      'options' : $scope.FG.thisType.subtypes
                      };                  
    $scope.renderHtml = renderHtml;
    $scope.$watchGroup( [ 'entries.length', 'selection.subtype' ], function(){
      $scope.FG = { 'entries': $rootScope.entries };
      equalize();
      var path = ( $scope.selection.subtype ) ? 'type/' + $scope.selection.type + '/subtype/' + $scope.selection.subtype : 'type/' + $scope.selection.type;
      $location.path( path );
      _.find( $rootScope.types, function( type ){
        if( type.name === $routeParams.type && $routeParams.subtype && $scope.selection.subtype ){
          $scope.subBlurb = _.find( type.subtypes, function( subtype ){
            return subtype.name === $routeParams.subtype;
          }).blurb;
        }
      });
      console.log( $scope.subBlurb );
    });
    
  }]);
  
  fieldGuideControllers.controller( 'NavController', [ '$scope', '$rootScope', function( $scope, $rootScope ){
    $scope.types = $rootScope.types;
    $scope.habitats = $rootScope.habitats;
    $scope.navItems = _.map( $scope.types, function( type ){
      return type.name;
    });
    $scope.navItems = $scope.navItems.concat( $rootScope.habitats );

  }]);
  
  fieldGuideControllers.controller( 'ResultsController', [ '$scope', '$rootScope','$routeParams', '$sce', 'getEntries', 'entriesByKeywordFilter', 'equalize', function( $scope, $rootScope, $routeParams, $sce, getEntries, entriesByKeywordFilter, equalize ){
    $scope.results = { 'entries': '' };
    $scope.$watch( 'entries', function(){
      $scope.results.entries = entriesByKeywordFilter( $rootScope.entries, $routeParams.query );
      equalize();
    });
  }]);
  
  fieldGuideControllers.controller( 'EntryController', [ '$scope', '$rootScope','$routeParams', '$sce', 'getEntries', 'renderHtml', 'renderSrc', 'entryByTitleFilter', 'relatedCritters', 'makeButtons', 'getFlickr', function( $scope, $rootScope, $routeParams, $sce, getEntries, renderHtml, renderSrc, entryByTitleFilter, relatedCritters, makeButtons, getFlickr ){
    
    $scope.FG = { 'entries': $rootScope.entries,
                  'entry': '',
                  'relatedCritters': '',
                  'title': $routeParams.title
                };        
        
    $scope.$watchGroup( ['FG.title', 'entries'], function( newVal, oldVal ){
      if( $scope.FG.title || newVal[1] !== oldVal[1] ){
        $scope.FG.entries = $rootScope.entries;
        $scope.FG.entry = entryByTitleFilter( $rootScope.entries, $routeParams.title );
        makeButtons( $scope.FG.entry );
        $scope.FG.relatedCritters = _.shuffle( relatedCritters( $scope.FG.entries, $scope.FG.entry ) );
        $scope.FG.entry.images = [];
        getFlickr( $scope.FG.entry.flickr_tags ).then( function( results ){
          var images = $( $.parseXML( results.data ) ).find( 'photo' );
          for( var i = 0; i < images.length; i++ ){
            $scope.FG.entry.images.push( images[i].attributes );
          }
          for( i = 0; i < $scope.FG.entry.images.length; i++ ){
            $scope.FG.entry.images[i].url = 'https://farm'+$scope.FG.entry.images[i].farm.value+'.staticflickr.com/'+$scope.FG.entry.images[i].server.value+'/'+$scope.FG.entry.images[i].id.value+'_'+$scope.FG.entry.images[i].secret.value+'.jpg';
            $scope.FG.entry.images[i].caption =  $( images[i] ).find( 'description' ).text();
          }
        });
      }
    });

    $scope.title = $routeParams.title;
    $scope.renderHtml = renderHtml;
    $scope.renderSrc = renderSrc;

	}]);
})();