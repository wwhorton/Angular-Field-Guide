
describe( 'StartController', function(){

  beforeEach( module ( 'fieldGuide' ) );
  it( 'should create "categories" model with "types" and "habitats" ', inject( function( $controller ){
    var scope = {},
      ctrl = $controller( 'StartController', { $scope:scope } );
      
  expect( scope.categories.types ).toBeDefined( );
  expect( scope.categories.habitats ).toBeDefined( );
  }));
});