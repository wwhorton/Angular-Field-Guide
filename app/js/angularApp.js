'use strict';

(function(){
	var fieldGuide = angular.module('fieldGuide', [ 'ngRoute', 'mm.foundation', 'fieldGuideServices', 'fieldGuideFilters', 'fieldGuideDirectives', 'fieldGuideControllers' ]);
  
  fieldGuide.run( function( $rootScope ){
    $rootScope.types = [ 
        { 'name' : 'Algae',
          'image' : '/images/Algae.jpg',
          'blurb' : 'Algae are simple plants that lack roots, stems, leaves and a vascular system. Like all other plants, algae go through photosynthesis and need sunlight to grow.'
        },
        { 'name' : 'Bay Grasses (SAV)',
          'subtypes' : [{
              'name' : 'Low Salinity',
              'image' : '',
              'blurb' : ''
              },
              {
              'name' : 'Medium Salinity',
              'image' : '',
              'blurb' : ''
              },
              {
              'name' : 'High Salinity',
              'image' : '',
              'blurb' : ''
              }],
          'image' : '/images/Bay Grass.jpg',
          'blurb' : 'Bay grasses - also known as submerged aquatic vegetation or SAV - are plants that grow underwater in the Chesapeake Bay\'s shallows. More than 16 species of bay grasses grow in the Bay and its tributaries.'
        },
        { 'name' : 'Birds',
          'subtypes' : [{
            'name' : 'Raptors',
            'image' : '',
            'blurb' : ''
            },
            {
            'name' : 'Other',
            'image' : '',
            'blurb' : ''
            },
            {
            'name' : 'Waterfowl',
            'image' : '',
            'blurb' : ''
            },
            {
            'name' : 'Wading',
            'image' : '',
            'blurb' : ''
            },
            {
            'name' : 'Sea & Shorebirds',
            'image' : '',
            'blurb' : ''
            }],
          'image' : '/images/Birds.jpg',
          'blurb' : 'Hundreds of species of birds live in the Chesapeake Bay watershed. Some birds live here year-round, while others migrate to the Bay region to feed or nest.'
        },
        { 'name' : 'Fish',
          'subtypes' : [{
            'name' : 'Freshwater Fish',
            'image' : '',
            'blurb' : ''
            },
            {
            'name' : 'Estuarine Fish',
            'image' : '',
            'blurb' : ''
            },
            {
            'name' : 'Migratory Fish',
            'image' : '',
            'blurb' : ''
            }],
          'image' : '/images/Fish.jpg',
          'blurb' : 'Approximately 350 species of fish live in the Chesapeake Bay. Some fish are year-round residents, while others swim into the Bay from the ocean to feed, reproduce or find shelter.'
        },
        { 'name' : 'Insects',
          'image' : '/images/Insects.jpg',
          'blurb' : 'Thousands of species of insects live in the Chesapeake Bay region. Insects are found in nearly every habitat, from deep woods to sandy beaches to our own backyards. Some insects live on the land, while others spend most of their time in the water.'
        },
        { 'name' : 'Invertebrates', 
          'subtypes' : [{
            'name' : 'Arthropods',
            'image' : '',
            'blurb' : '',
            },
            {
            'name' : 'Mollusks',
            'image' : '',
            'blurb' : ''
            },
            {
            'name' : 'Other Invertebrates',
            'image' : '',
            'blurb' : ''
            }],
          'image' : '/images/Invertebrates.jpg',
          'blurb' : 'Invertebrates are animals without a backbone. Hundreds of species of invertebrates live in the Chesapeake Bay.'
        },
        { 'name' : 'Mammals',
          'subtypes' : [{
            'name' : 'Aquatic',
            'image' : '',
            'blurb' : ''
            },
            {
            'name' : 'Semi-Aquatic',
            'image' : '',
            'blurb' : ''
            },
            {
            'name' : 'Land',
            'image' : '',
            'blurb' : ''
            },
            {
            'name' : 'Flying',
            'image' : '',
            'blurb' : ''
            }],
          'image' : '/images/Mammals.jpg',
          'blurb' : 'Mammals are an extremely diverse class of animals, ranging from bats, squirrels and rabbits to bobcats, dolphins and humans.'
        },
        { 'name' : 'Plants & Trees',
          'subtypes' : [{
            'name' : 'Flowers',
            'image' : '',
            'blurb' : ''
            },
            {
            'name' : 'Trees & Shrubs',
            'image' : '',
            'blurb' : ''
            },
            {
            'name' : 'Aquatic & Wetland Plants',
            'image' : '',
            'blurb' : ''
            }],
          'image' : '/images/Plants.jpg',
          'blurb' : 'More than 2,700 types of plants grow throughout the Chesapeake Bay watershed. Plants grow in nearly every habitat: from upland forests to the Bay\'s shoreline to our own backyards.'
        },
        { 'name' : 'Reptiles & Amphibians',
          'subtypes' : [{
            'name' : 'Amphibians',
            'image' : '',
            'blurb' : ''
            },
            {
            'name' : 'Reptiles',
            'image' : '',
            'blurb' : ''
            }],
          'image' : '/images/Reptiles.jpg',
          'blurb' : 'Reptiles and amphibians are cold-blooded vertebrates. They are sometimes called herps.'
        }
      ];

    $rootScope.habitats = [ 
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

})();