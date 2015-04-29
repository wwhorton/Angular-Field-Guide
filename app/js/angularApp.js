'use strict';

(function(){
	var fieldGuide = angular.module('fieldGuide', [ 'ngRoute', 'mm.foundation', 'fieldGuideServices', 'fieldGuideFilters', 'fieldGuideDirectives', 'fieldGuideControllers' ]);
  
  fieldGuide.run( function( $rootScope ){
    $rootScope.types = [ 
        { 'name' : 'Birds',
          'subtypes' : [{
            'name' : 'Raptors',
            'image' : '',
            'blurb' : 'Raptors are birds of prey. Their keen eyesight allows them to hunt while flying, and they use their sharp beaks and talons to capture prey. Hawks, owls, ospreys, eagles and falcons are all raptors.'
            },
            {
            'name' : 'Other',
            'image' : '',
            'blurb' : 'As home to hundreds of bird species, the Bay region is full of opportunities birdwatchers and hunters alike. Songbirds, game birds and hummingbirds are just a few of the many other types of birds that live in the Bay region.'
            },
            {
            'name' : 'Waterfowl',
            'image' : '',
            'blurb' : 'Ducks, geese and swans are all waterfowl. Most waterfowl visit the Chesapeake Bay region in winter as they migrate along the Atlantic Flyway, a major flight path for millions of birds. Other waterfowl live in the Bay region year-round.'
            },
            {
            'name' : 'Wading',
            'image' : '',
            'blurb' : 'Wading birds quietly stalk their prey in wetlands and shallow waters. Most wading birds, which include herons and egrets, nest together in large breeding colonies on the Chesapeake Bay\'s small, isolated islands.' 
            },
            {
            'name' : 'Sea & Shorebirds',
            'image' : '',
            'blurb' : 'Seabirds and shorebirds live on and along the water. They primarily eat fish and other aquatic animals. Shorebirds include gulls, terns and sandpipers. Coots, pelicans and cormorants are all seabirds.'
            }],
          'image' : '/images/Birds.jpg',
          'blurb' : 'Hundreds of species of birds live in the Chesapeake Bay watershed. Some live here year-round, while others migrate to the region to feed or nest. Birds are some of the region\'s most beautiful—but vulnerable—species, and all serve as important links in the Bay ecosystem. '
        },
        { 'name' : 'Fish',
          'subtypes' : [{
            'name' : 'Freshwater Fish',
            'image' : '',
            'blurb' : 'Freshwater fish live year-round in the freshwater streams and rivers that flow to the Chesapeake Bay. Some freshwater fish may move into brackish waters in the Bay and its tidal rivers.'
            },
            {
            'name' : 'Estuarine Fish',
            'image' : '',
            'blurb' : 'Estuarine fish can survive in waters where fresh and salt water mix, like those throughout the Chesapeake Bay and its tidal rivers. Generally, estuarine fish stay close to the shore during summer and move to deeper waters in winter.'
            },
            {
            'name' : 'Migratory Fish',
            'image' : '',
            'blurb' : 'Migratory fish visit the Chesapeake Bay each year to feed or spawn. Marine fish live and spawn in coastal waters, anadromous fish migrate from the ocean to freshwater rivers to spawn and catadromous fish migrate from freshwater rivers to the ocean to spawn.'
            }],
          'image' : '/images/Fish.jpg',
          'blurb' : 'Nearly 350 species of fish live in the Chesapeake Bay. Some are year-round residents, while others swim in from the ocean to feed, reproduce or find shelter. Each of the Bay\'s fish has a vital place in the food web, and many provide abundant opportunities for fishermen.'

        },
        { 'name' : 'Insects & Invertebrates', 
          'subtypes' : [{
            'name' : 'Insects',
            'image' : '',
            'blurb' : 'Insects are found in nearly every habitat across the watershed, both on land and in the water. Some people may think insects are gross or scary, but they are an important part of the food web for fish, birds, mammals and reptiles.'
            },
            {
            'name' : 'Arthropods',
            'image' : '',
            'blurb' : 'Arthropods have an external skeleton—or exoskeleton—that they molt to grow. Crustaceans like crabs, shrimp and barnacles are the Bay\'s most common arthropods. Horseshoe crabs are arthropods, but not crustaceans: they are more closely related to spiders and scorpions.'
            },
            {
            'name' : 'Mollusks',
            'image' : '',
            'blurb' : 'Mollusks include bivalves, gastropods (snails) and cephalopods (squid). Most mollusks have at least one shell that protects and supports the animal\'s soft body. They also have a foot, which allows them to move.'
            },
            {
            'name' : 'Other Invertebrates',
            'image' : '',
            'blurb' : 'Invertebrates make up the most diverse and abundant species on Earth. Worms, sponges, corals, tunicates and echinoderms are just a few of the many other types of invertebrates that live in the Bay.'
            }],
          'image' : '/images/Invertebrates.jpg',
          'blurb' : 'Invertebrates are animals without a backbone, including insects, mollusks, crustaceans and more. Hundreds of species of invertebrates live in the waters of Chesapeake Bay, and thousands of species of insects live throughout the watershed, from deep woods to sandy beaches to our own backyards.'
        },
        { 'name' : 'Mammals',
          'subtypes' : [{
            'name' : 'Aquatic',
            'image' : '',
            'blurb' : 'Unlike many other mammals, aquatic mammals have no fur and have a thick layer of blubber. The Chesapeake Bay is home to several mammals that spend their entire lives in the water, including dolphins and the occasional wayward manatee.'
            },
            {
            'name' : 'Semi-Aquatic',
            'image' : '',
            'blurb' : 'Some mammals divide their time between land and water. Their waterproof—often oily—fur allows them to stay warm while in the water. These semi-aquatic species include beavers, muskrats and river otters.'
            },
            {
            'name' : 'Land',
            'image' : '',
            'blurb' : 'A variety of land mammals live in the Bay watershed, from the small meadow vole to the large American black bear. While some of these animals are able to swim, they spend the majority of their lives on land. Land mammals include deer, squirrels, rabbits and foxes.'
            },
            {
            'name' : 'Flying',
            'image' : '',
            'blurb' : 'While bats are the only mammals truly able to fly, others can “fly” by gliding for short distances using flaps on skin on either side of their body. Many species of bats, as well as the southern flying squirrel, can be found throughout the Chesapeake Bay region.'
            }],
          'image' : '/images/Mammals.jpg',
          'blurb' : 'Mammals are warm-blooded vertebrates that give birth to and nurse live young, are covered with hair at some point in their lives and generally have two pairs of limbs. Many different types of mammals live in or visit the Bay region, both on land and in the water.'
        },
        { 'name' : 'Plants & Trees',
          'subtypes' : [{ 
            'name' : 'Algae',
            'image' : '/images/Algae.jpg',
            'blurb' : 'Algae are simple plants lacking roots, stems, leaves and a vascular system. Like all other plants, algae go through photosynthesis and need sunlight to grow. Some algae species can be confused with bay grasses, because they look similar and grow in the same places.'
            },
            {
            'name' : 'Bay Grasses',
            'image' : '/images/Bay Grass.jpg',
            'blurb' : 'Bay grasses—also known as submerged aquatic vegetation, or SAV—are plants that grow in the shallow waters of the Bay, providing food and habitat for fish, crabs and waterfowl. More than 16 species of bay grasses grow in the Bay and its tributaries.'
            },
            {
            'name' : 'Flowers',
            'image' : '',
            'blurb' : 'There are hundreds of flowering plants that are native to the Chesapeake Bay region. These flowers are technically known as herbaceous plants, meaning they die off at the end of the growing season.'
            },
            {
            'name' : 'Trees & Shrubs',
            'image' : '',
            'blurb' : 'At least 50 types of trees grow in the Chesapeake Bay watershed. Some trees are deciduous, meaning they lose their leaves each autumn and grow new ones in spring. Other trees are evergreen and do not lose their leaves.'
            },
            {
            'name' : 'Aquatic & Wetland Plants',
            'image' : '',
            'blurb' : 'Wetland plants grow in damp, moist soils, whereas aquatic plants grow directly in water. Many are technically emergent plants, meaning they grow in standing water. Although native to wetlands and marshes, these plants are common in parks, yards and other areas.'
            }],
          'image' : '/images/Plants.jpg',
          'blurb' : 'More than 2,700 types of plants grow throughout the Chesapeake Bay watershed, in nearly every habitat: from upland forests to the Bay\'s shoreline to our own backyards. Plants help keep our air and water clean and provide habitat for countless animals.'
        },
        { 'name' : 'Reptiles & Amphibians',
          'subtypes' : [{
            'name' : 'Amphibians',
            'image' : '',
            'blurb' : 'Amphibians have moist, absorbent, scale-less skin. Frogs, toads, newts and salamanders are all amphibians. Amphibians are very sensitive to environmental changes, making them excellent indicators of an ecosystem\'s health.'
            },
            {
            'name' : 'Reptiles',
            'image' : '',
            'blurb' : 'Reptiles have scaly skin that helps them retain water. While many reptiles spend most of their time on land, some species live in or near the water. Snakes, turtles and lizards are all reptiles.'
            }],
          'image' : '/images/Reptiles.jpg',
          'blurb' : 'Reptiles and amphibians, sometimes called herps, are cold-blooded vertebrates. Hundreds of species live in the Chesapeake region: from frogs and salamanders that dwell along mountainous streams to sea turtles that visit the salty waters of the Bay\'s mouth.'
        }
      ];

    $rootScope.habitats = [ 
        { 'name': 'Aquatic Reefs & Pilings',
          'image': '/images/pilings.jpg',
          'blurb': ''
        },
        { 'name': 'Beaches & Tidal Flats',
          'image': '/images/tidal flats.jpg',
          'blurb': ''
        },
        { 'name': 'Forests & Uplands',
          'image': '/images/forest.jpg',
          'blurb': ''
        },
        { 'name': 'Marshes & Wetlands',
          'image': '/images/wetlands.jpg',
          'blurb': ''
        },
        { 'name': 'Open & Shallow Waters',
          'image': '/images/shallow water.jpg',
          'blurb': ''
        },
        { 'name': 'Streams & Rivers',
          'image': '/images/river.jpg',
          'blurb': ''
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