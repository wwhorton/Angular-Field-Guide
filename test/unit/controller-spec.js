describe( 'StartController', function(){
// TODO: Fix controller spec test

  beforeEach( module ( 'fieldGuide' ) );
  
  var ctrl, scope;
  
  beforeEach(inject(function( $controller, $rootScope ){
    scope = $rootScope.$new();
    ctrl = $controller( 'StartController', { $scope:scope } );
  }));
  
  it( 'should create "categories" model with "types" and "habitats" ', inject( function( $controller ){
    expect( scope.categories.types ).toBeDefined( );
    expect( scope.categories.habitats ).toBeDefined( );
  }));
  
  
});



