'use strict';
( function(){
  
  var fieldGuideFilters = angular.module( 'fieldGuideFilters', [] );
  fieldGuideFilters.filter( 'entriesByKeyword', function() {
    return function( array, title ){
      return _.filter( array, function( item ){
        switch( true ){
          case item.title.toUpperCase().indexOf( title.toUpperCase() ) > -1:
          case item.fieldguide_appearance.toUpperCase().indexOf( title.toUpperCase() ) > -1:
          case item.fieldguide_scientific_name.toUpperCase().indexOf( title.toUpperCase() ) > -1:
          case item.fieldguide_other_facts.toUpperCase().indexOf( title.toUpperCase() ) > -1:
            return true;
          default:
            return false;
        }
      });
    };
  });
  
  fieldGuideFilters.filter( 'entryByTitle', function() {
    return function( array, title ){
      return _.find( array, function( entry ){
        return entry.title.toUpperCase() === title.toUpperCase();
      });  
    };  
  });
  
  fieldGuideFilters.filter( 'arrayByArray', function() {
    return function( array1, criteria ){
      _.each( array1, function( array1Item ){
        return array1Item.category_name.toUpperCase() === criteria.toUpperCase() ;
      });
    };
  });
})();  