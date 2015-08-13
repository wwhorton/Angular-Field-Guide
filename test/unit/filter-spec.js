
describe( 'Filter testing', function(){
  var $filter, filter;
  var testArray = [
                        { title: 'Farms',
                          category_name: 'Solvents',
                          fieldguide_appearance: 'A lot of stuff and things...',
                          fieldguide_scientific_name: 'science 1',
                          fieldguide_other_facts: 'facts facts facts'
                        },
                        { title: 'Penguins',
                          category_name: 'Penguins',
                          fieldguide_appearance: 'Lorem ipsum is so 90s.',
                          fieldguide_scientific_name: 'science 2',
                          fieldguide_other_facts: 'Stuff to know'
                        },
                        { title: '3r8789',
                          fieldguide_appearance: 'baldkhjlkhjrthr',
                          fieldguide_scientific_name: 'science 3',
                          fieldguide_other_facts: 'No facts are fun.'
                        },
                        { title: 'Dogs',
                          fieldguide_appearance: 'Blah blah blah!',
                          fieldguide_scientific_name: 'Blahicus blahface',
                          fieldguide_other_facts: 'Things you didn\'t know before but do now...'
                        }
                   ];
  beforeEach( function(){
    module( 'fieldGuide' );
  });
  
  beforeEach( inject( function( _$filter_ ){
      $filter = _$filter_;  
  }));

  
  describe( 'entriesByKeyword filter', function(){

    var queryTitle = 'Farms', queryAppearance = 'bald', queryScience = 'Blahicus', queryFacts = 'fun', queryMultiple = 'science';
    
    beforeEach( function(){
      filter = $filter( 'entriesByKeyword' );
    });
    
    it( 'should exist as a filter', function(){
      expect( filter ).toBeDefined();
    });
    
    it( 'should return an array of any objects that have a title containing the queried text', function(){
      var filteredArray = filter( testArray, queryTitle );
      expect( filteredArray.length ).toEqual( 1 );
      expect( filteredArray[0].title ).toEqual( queryTitle );
    });
    
    it( 'should return an array of any objects that have an appearance containing the queried text', function(){
      var filteredArray = filter( testArray, queryAppearance );
      expect( filteredArray.length ).toEqual( 1 );
      expect( filteredArray[0].fieldguide_appearance ).toContain( queryAppearance );
    });
    
    it( 'should return an array of any objects that have a scientific name containing the queried text', function(){
      var filteredArray = filter( testArray, queryScience );
      expect( filteredArray.length ).toEqual( 1 );
      expect( filteredArray[0].fieldguide_scientific_name ).toContain( queryScience );
    });
    
    it( 'should return an array of any objects that have an "other facts" field containing the queried text', function(){
      var filteredArray = filter( testArray, queryFacts );
      expect( filteredArray.length ).toEqual( 1 );
      expect( filteredArray[0].fieldguide_other_facts ).toContain( queryFacts );
    });
    
    it( 'should return an array of multiple objects if more than one has a field containing the queried text', function(){
      var filteredArray = filter( testArray, queryMultiple );
      expect( filteredArray.length ).toBeGreaterThan( 1 );
    });   
  });

  describe( 'entryByTitle filter', function(){
    
    beforeEach( function(){
      filter = $filter( 'entryByTitle' );
    });
    
    it( 'should have an "entryByTitle" filter', function(){
      expect( $filter( 'entryByTitle' ) ).toBeDefined();
    });
    
    it( 'should return single object from array whose title matches the query', function(){
      var testTitle = 'Farms';
      var filteredData = filter( testArray, testTitle );
      expect( filteredData.title ).toEqual( testTitle );
    });
  });
  
});