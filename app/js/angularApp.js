'use strict';

(function(){
	var fieldGuide = angular.module('fieldGuide', [ 'ngRoute', 'mm.foundation', 'fieldGuideServices', 'fieldGuideFilters', 'fieldGuideDirectives', 'fieldGuideControllers', 'angular.filter' ]);
  
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
          'blurb': '<p>Aquatic reefs are complex, diverse communities made of densely packed oysters. Healthy reefs form when oyster larvae attach to adult <a href="/fieldguide/critter/eastern_oyster">oysters</a>, and layers of oysters grow upward and outward.</p><p>Hundreds of aquatic animals find food and shelter in oyster reefs. With their many nooks and crannies, reefs provide a safe haven for small <a href="/fieldguide/categories/category/fish">fish</a> and <a href="/fieldguide/categories/category/invertebrates">invertebrates</a> to hide from predators. Larger species, including <a href="/fieldguide/critter/white_perch">white perch</a>, <a href="/fieldguide/critter/striped_bass">striped bass</a> and <a href="/fieldguide/critter/blue_crab">blue crabs</a>, visit reefs to breed and find food. </p><p>Reefs are the largest source of hard surface on the Bay\'s bottom, which is otherwise mostly covered with soft <a href="/issues/sediment">sediment</a>. Oyster larvae, sponges and <a href="/fieldguide/critter/barnacles">barnacles</a> are just a few of the many invertebrates that live attached to hard surfaces.</p><p>Piers, rocks, jetties, wrecks and pilings are similar to aquatic reefs. They provide hard surfaces for invertebrates and attract larger predators in search of food.</p><p>Click on the images below to learn about some of the critters that live on the Chesapeake Bay\'s aquatic reefs and pilings.</p>'
        },
        { 'name': 'Beaches & Tidal Flats',
          'image': '/images/tidal flats.jpg',
          'blurb': '<p>Sandy beaches and tidal mud flats line thousands of miles of Chesapeake Bay shoreline. Beaches are mostly found along the lower Bay, while muddy flats are more common in the upper Bay.</p><p>Beaches are harsh environments where wildlife are subjected to wind, waves and heat. Aquatic species that wash ashore can easily dry out and die.</p><p>Beaches and tidal flats support a wide variety of plants and animals, including <a href="/fieldguide/categories/category/birds">birds</a>, <a href="/fieldguide/categories/category/mammals">mammals</a>, <a href="/fieldguide/categories/category/insects">insects</a> and <a href="/fieldguide/categories/category/invertebrates">invertebrates</a>. Sandpipers and small crabs scurry along the water\'s edge, while <a href="/fieldguide/critter/gulls">gulls</a> and <a href="/fieldguide/critter/terns">terns</a> fly above. Underneath the sand and mud, worms, clams and crabs burrow to avoid predators. <a href="/fieldguide/critter/horseshoe_crab">Horseshoe crabs</a> are one of the most celebrated beach dwellers; they come ashore in late spring to lay their eggs in the sand.</p><p>Click on the images below to learn about some of the critters that live on the Chesapeake Bay\'s beaches and tidal flats.</p>'
        },
        { 'name': 'Forests & Uplands',
          'image': '/images/forest.jpg',
          'blurb': '<p>Healthy forests provide food, shelter, nesting areas and safe migration paths for countless species. Decaying leaves and plants littered on the forest floor are a critical link in the <a href="/discover/bayecosystem/foodwebs">food web</a>.</p><p>Forests don\'t just benefit animals on land; they\'re also critical to aquatic species. Forest buffers along the edges of waterways provide habitat for <a href="/fieldguide/categories/category/birds">birds</a>, <a href="/fieldguide/categories/category/mammals">mammals</a> and <a href="/fieldguide/categories/category/reptiles_amphibians">reptiles</a>. They also help keep the water cool, which is important for spawning <a href="/fieldguide/critter/brook_trout">brook trout</a> and other <a href="/fieldguide/categories/category/fish">fish</a>.</p><p>Forest-dwelling species are not limited to large forests. Many species, such as <a href="/fieldguide/critter/white_tailed_deer">white-tailed deer</a> and <a href="/fieldguide/critter/red_fox">red foxes</a>, can be found in smaller wooded areas in our cities, towns and suburbs. Some even venture into our own backyards!</p><p>Click on the images below to learn about some of the critters that live in the Chesapeake Bay watershed\'s forests and uplands.</p>'
        },
        { 'name': 'Marshes & Wetlands',
          'image': '/images/wetlands.jpg',
          'blurb': '<p><a href="/issues/wetlands">Wetlands</a> are transitional areas between land and water. Marshes - a type of tidal wetland - are wet areas along the shoreline where aquatic grasses and sedges grow.</p><p>Hundreds of species of <a href="/fieldguide/categories/category/fish">fish</a>, <a href="/fieldguide/categories/category/birds">birds</a>, <a href="/fieldguide/categories/category/mammals">mammals</a>, <a href="/fieldguide/categories/category/reptiles_amphibians">reptiles</a> and <a href="/fieldguide/categories/category/invertebrates">invertebrates</a> depend on marshes and wetlands for food. Thousands of aquatic species, including worms, <a href="/fieldguide/critter/marsh_periwinkle">periwinkles</a>, <a href="/fieldguide/categories/category/insects">insects</a>, <a href="/fieldguide/critter/atlantic_ribbed_mussel">ribbed mussels</a> and tiny crustaceans, thrive in wetlands. In turn, larger animals eat these small species.</p><p>Marshes and wetlands also provide shelter for a variety of animals. Two-thirds of the nation\'s commercial fish and shellfish depend on wetlands as nursery or spawning areas. Large flocks of waterfowl visit wetlands during their winter migrations to feed and rest. And mammals such as muskrats and beavers build their homes in wetlands.</p><p>Click on the images below to learn about some of the critters that live in the Chesapeake Bay\'s marshes and wetlands.</p>'
        },
        { 'name': 'Open & Shallow Waters',
          'image': '/images/shallow water.jpg',
          'blurb': '<p>Along the Chesapeake Bay\'s shoreline is an area of incredible biological activity: the shallows. The Bay\'s shallow waters extend from the shore to about 10 feet deep. Beyond the shoreline lie the open waters of the Chesapeake Bay: a wide, open area with channels that are more than 100 feet deep.</p><p>Shallow waters are home to an incredible variety of animals, including worms, clams, crabs, <a href="/fieldguide/categories/category/fish">fish</a>, <a href="/fieldguide/categories/category/birds">birds</a> and <a href="/fieldguide/categories/category/reptiles_amphibians">turtles</a>. Many small fish and invertebrates seek refuge from predators in the shallows. In turn, larger fish and birds hunt for prey there.<a href="/fieldguide/categories/category/bay_grasses_sav">Bay grass beds</a> are a critically important part of the shallows, providing shelter for <a href="/fieldguide/critter/blue_crab">blue crabs</a>, young fish and <a href="/fieldguide/critter/sandbar_shark">sharks</a> to hide from predators. Several species of migratory waterfowl depend on bay grasses for food.</p><p>The Bay\'s open waters are teeming with life, including <a href="/fieldguide/categories/category/fish">fish</a>, <a href="/fieldguide/categories/category/birds">birds</a>, <a href="/fieldguide/categories/category/invertebrates">invertebrates</a> and <a href="/fieldguide/categories/category/mammals">aquatic mammals</a>. They are a haven for migratory fish such as <a href="/fieldguide/critter/bluefish">bluefish</a>, <a href="/fieldguide/critter/cobia">cobia</a> and <a href="/fieldguide/critter/mackerels">mackerels</a>. These large fish visit the Bay in summer to feast on <a href="/fieldguide/critter/atlantic_menhaden">menhaden</a>, <a href="/fieldguide/critter/bay_anchovy">anchovies</a> and other small fish and invertebrates. And, although you cannot see them, microscopic <a href="/discover/bayecosystem/plankton">plankton</a> float through open waters, forming the base of the Bay\'s <a href="/discover/bayecosystem/foodwebs">food web</a>.</p><p>In summer, both the shallows and open waters of the Bay become very warm, allowing harmful algae blooms to form. These can lead to low-oxygen "dead zones" that suffocate underwater life. In winter, animals that dwell in the Bay\'s shallow waters retreat to deeper channels, while hundreds of thousands of migratory birds stop on the Chesapeake\'s open waters to rest and feed.</p><p>Click on the images below to learn about some of the critters that live in the Chesapeake Bay\'s open and shallow waters.</p>'
        },
        { 'name': 'Streams & Rivers',
          'image': '/images/river.jpg',
          'blurb': '<p>Hundreds of thousands of streams, creeks and rivers thread through the Chesapeake Bay watershed and eventually flow to the Bay. These freshwater tributaries provide critical habitat for many plants and animals, including <a href="/fieldguide/categories/category/fish">fish</a>, <a href="/fieldguide/categories/category/insects">insects</a>, <a href="/fieldguide/categories/category/reptiles_amphibians">reptiles</a>, <a href="/fieldguide/categories/category/reptiles_amphibians">amphibians</a> and <a href="/fieldguide/categories/category/invertebrates">invertebrates</a>.</p><p>Catfish, sunfish and <a href="/fieldguide/critter/brook_trout">brook trout</a> are just a few types of fish that live their entire lives in fresh water. Many other fish - including shad, <a href="/fieldguide/critter/atlantic_sturgeon">Atlantic sturgeon</a> and <a href="/fieldguide/critter/striped_bass">striped bass</a> - travel from the Bay and the ocean to freshwater streams and rivers to spawn.</p><p>Fish aren\'t the only animals that are found in streams and rivers. Diverse communities of tiny worms and clams live at the bottom of streams. Many bay <a href="/fieldguide/categories/category/bay_grasses_sav">grass species</a>, including <a href="/fieldguide/critter/coontail">coontail</a> and <a href="/fieldguide/critter/wild_celery">wild celery</a>, only grow in fresh water. Along the edges of streams and rivers, turtles and snakes bask in the sun and search for prey. </p><p>Click on the images below to learn about some of the critters that live in the Chesapeake Bay watershed\'s streams and rivers.</p>'
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