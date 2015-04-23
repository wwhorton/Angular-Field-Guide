'use strict';
( function(){

  var fieldGuideDirectives = angular.module( 'fieldGuideDirectives', [] );
  fieldGuideDirectives.directive( 'audio', function( $sce ) {
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
  
  fieldGuideDirectives.directive( 'entryBlock', function( renderHtml ) {
    return {
      restrict: 'AE',
      replace: true,
      scope: { thisEntry: '=entry' },
      templateUrl: '/partials/entry-block.html',
      link: function( scope ){
        scope.thisEntry.fieldguide_description = renderHtml( scope.thisEntry.fieldguide_description );
      }
    };
  });
  
  fieldGuideDirectives.directive( 'slickCarousel', function() {
    return {
      restrict: 'AE',
      replace: false,
      templateUrl: '/partials/mediaSlider.html',
      scope: { entry: '=entry' },
      link: function( scope, element ){
        scope.$watch( 'entry.images.length', function( newVal, oldVal ){
          if( newVal !== oldVal ){
            $( element ).slick({
              infinite: true,
              center: true,
              adaptiveHeight: true,
              fade: true,
              arrows: true,
              prevArrow: $( '.fa-chevron-left' ),
              nextArrow: $( '.fa-chevron-right' )
            });
          }  
        }, true);
      }
    };
  });
  
  fieldGuideDirectives.directive( 'searchBar', function( $location ){
    return {
      replace: true,
      templateUrl: '/partials/search-bar.html',
      link: function( scope ){
        $( '#searchIcon' ).on( 'click', function(){
          if( !$( '#searchButton' ).hasClass( 'disabled' ) ){
            var thePath = '/search/' + scope.search.title;
            $location.path( thePath );
          }
        scope.$apply();
        });
        $( '#titleSearch' ).bind( 'keypress', function( event ){
          if( event.which === 13 ){
            $( '#searchIcon' ).click();
          }
        });
      }
    };
  });
  
  fieldGuideDirectives.directive( 'smallMediaQuery', function(){
    return {
      restrict: 'A',
      link: function( scope ){
        scope.checkSize = _.debounce( function(){
          scope.isSmall = window.matchMedia( '(max-width: 640px)' ).matches;
          scope.$apply();
        }, 100 );
        $( window ).on( 'load resize', scope.checkSize );
      }
    };
  });
  
  fieldGuideDirectives.directive( 'tags', [ 'makeButtons', function( makeButtons ){
    return {
      replace: true,
      restrict: 'E',
      templateUrl: '/partials/tags.html',
      scope: { tagEntry: '=entry' },
      link: function( scope, element ){
        makeButtons( scope.tagEntry );
        element.on( 'click', function(){
          $( 'html' ).scrollTop( 0 );
        });
      }
    };
  }]);
  fieldGuideDirectives.directive( 'navMenuItems', [ '$rootScope', 'equalize', function( $rootScope, equalize ){
    return {
      restrict: 'E',
      replace: false,
      require: '^navMenu',
      transclude: true,
      templateUrl: '/partials/navMenuItems.html',
      link: function( scope ){
        scope.nav.hover = $rootScope.types[0];
        scope.nav.type = $rootScope.types[0];
        equalize();
      }
    };
  }]);
      
  fieldGuideDirectives.directive( 'navMenu', function(){
    return {
      replace: true,
      restrict: 'E',
      transclude: true,
      templateUrl: '/partials/headerNav.html',
      controller: 'NavController',
      link: function( scope ){
        $( '#menuIcon' ).click( function(){
          if( $( this ).hasClass( 'fi-list' ) ) {
            $( this ).removeClass( 'fi-list' );
            $( this ).addClass( 'fi-x' );
          } else {
            $( this ).removeClass( 'fi-x' );
            $( this ).addClass( 'fi-list' );
          }
        });
        $( document ).on( 'click', function( event ){
          if( !$( event.target ).closest( '#navMenu' ).length && $( event.target ).attr( 'id' ) !== 'menuIcon' ) {
            if( scope.nav ){ 
              scope.nav.showMenu = false;
              $( '#menuIcon' ).removeClass( 'fi-x' );
              $( '#menuIcon' ).addClass( 'fi-list' );
              scope.$apply();
            }
          }
        });
      }
    };
  });
  
  fieldGuideDirectives.directive( 'preview', function(){
    return {
      replace: true,
      restrict: 'E',
      transclude: true,
      templateUrl: '/partials/previewWindow.html',
      require: '^navMenu'
    };
  });
  fieldGuideDirectives.directive( 'howSoonIsNow', function(){
    return {
      replace: false,
      restrict: 'A',
      link: function( scope ){
        scope.now = $.now();
      }
    };
  });
})();