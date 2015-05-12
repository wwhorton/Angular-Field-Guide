'use strict';
( function(){
  
  var fieldGuideServices = angular.module( 'fieldGuideServices', [ 'angular-md5' ] );

  fieldGuideServices.factory( 'getEntries', [ '$http', function( $http ){
    var promise;
    var getEntries = function(){
      if( !promise ){
        promise = $http.jsonp('http://www.chesapeakebay.net/site/API_test?callback=JSON_CALLBACK');
      }
      return promise;
    };
    return getEntries;
  }]);

  fieldGuideServices.factory( 'renderHtml', [ '$sce', function( $sce ){
    var renderHtml = function( raw_html ){
      return $sce.trustAsHtml( raw_html );
    };
    return renderHtml;
  }]);

  fieldGuideServices.factory( 'renderSrc', [ '$sce', function( $sce ){
    var renderSrc = function( raw_html ){
      return $sce.trustAsResourceUrl( raw_html );
    };
    return renderSrc;
  }]);

  fieldGuideServices.factory( 'critterOfTheMonth', function(){
    var getCritter = function( critters ) {
      var monthlyCritter = _.filter( critters, function( critter ){
        return critter.status === 'critterofthemonth';
      });
      monthlyCritter = _.sortBy( monthlyCritter, 'entry_date' );
      return monthlyCritter[monthlyCritter.length - 1];
    };
    return getCritter;
  });

    fieldGuideServices.factory( 'relatedCritters', [ '$rootScope', 'getEntries', 'matchCategory', function( $rootScope, getEntries, matchCategory ){
    return function( entries, critter ){
      var filtered = [];
      var categoryToMatch = _.find( critter.categories, function( category ){
        var result;
        function matchSubtypes( subtypeArray ){
          for( var i = 0; i < subtypeArray.length; i++){
            if( matchCategory( subtypeArray[i].name, category.category_name ) ){
              result = true;
            }
          }
        }
        for( var i = 0; i < $rootScope.types.length; i++ ){
          if( $rootScope.types[i].subtypes ){
            if ( matchCategory( $rootScope.types[i].name, category.category_name ) ) { result = true; }
            matchSubtypes( $rootScope.types[i].subtypes );
          } else { 
            if ( matchCategory( $rootScope.types[i].name, category.category_name ) ) { result = true; }
          }
        }
        return result;
      }).category_name;
      
      entries.forEach( function( entry ){
        entry.categories.forEach( function( category ){
          if( category.category_name.toUpperCase() === categoryToMatch.toUpperCase() ){
            filtered.push( entry );
          }
        });
      });
      return filtered;
    };  
  }]);

  fieldGuideServices.factory( 'matchCategory', function(){
    return function( cat, category ){
      if( cat === category ){
        return true;
      }
    };
  });  
  fieldGuideServices.factory( 'makeButtons', [ '$rootScope', function( $rootScope ){
    var makeButtons = function( critter ){
      critter.buttons = {};
      critter.buttons.type = _.find( critter.categories, function( category ){
          for( var i = 0; i < $rootScope.types.length; i++ ){
           if( $rootScope.types[i].name === category.category_name ){
             return true;
           }
         }
      }).category_name;
      critter.buttons.habitats = _.filter( critter.categories, function( category ){
          for( var i = 0; i < $rootScope.habitats.length; i++ ){
           if( $rootScope.habitats[i].name === category.category_name ){
             return true;
           }
         }
      });    
      critter.buttons.subtype = _.find( critter.categories, function( category ){
        var results;
        function matchCategory( subtype ){
          if( subtype.name === category.category_name ){
            results = true;
          }
        }
        
        for( var i = 0; i < $rootScope.types.length; i++ ){
            _.compact( $rootScope.types[i].subtypes ).forEach( matchCategory );
        }
        return results;
      });
      critter.buttons.subtype = ( critter.buttons.subtype ) ? critter.buttons.subtype.category_name : undefined;
    };
    return makeButtons;
  }]);

  fieldGuideServices.factory( 'getFlickr', [ '$http', 'md5', function( $http, md5 ){
    return function( tags ){
      var apiSig = '589af94b6012d347api_keyc03d2c380487bc102a9213f8487b891dauth_token72157627022294584-5cb5ec33745f610cextrasdescriptionformatrestmethodflickr.photos.searchtags' + tags + 'user_id29388462@N06';
      apiSig = md5.createHash( apiSig );     
      return $http( {
        url:  'https://api.flickr.com/services/rest/',
        params: {
          'method' : 'flickr.photos.search',
          'api_key' : 'c03d2c380487bc102a9213f8487b891d',
          'user_id' : '29388462@N06',
          'tags' : tags,
          'extras' : 'description',
          'format' : 'rest',
          'auth_token' : '72157627022294584-5cb5ec33745f610c',
          'api_sig' : apiSig
        }
      });
    };
  }]);

  fieldGuideServices.factory( 'equalize', ['$timeout', function( $timeout ){
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
})();