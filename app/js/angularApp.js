'use strict';

(function(){
	var fieldGuide = angular.module('fieldGuide', [ 'ngRoute', 'ngAnimate', 'mm.foundation', 'fieldGuideServices', 'fieldGuideFilters', 'fieldGuideDirectives', 'fieldGuideControllers', 'angular.filter' ]);
  
  fieldGuide.run( function( $rootScope, getEntries ){
    $rootScope.entries = [
        {  'type': '',
          'subtype': '',
          'habitats': []
        }
    ];
    
    $rootScope.types = [ 
        { 'name' : 'Birds',
          'subtypes' : [{
            'name' : 'Raptors',
            'label' : 'Raptors',
            'image' : 'images/birds-raptors.jpg',
            'blurb' : 'Raptors are birds of prey. Their keen eyesight allows them to hunt while flying, and they use their sharp beaks and talons to capture prey. Hawks, owls, ospreys, eagles and falcons are all raptors.'
            },
            {
            'name' : 'Other Birds',
            'label' : 'Other',
            'image' : 'images/birds-other.jpg',
            'blurb' : 'As home to hundreds of bird species, the Bay region is full of opportunities birdwatchers and hunters alike. Songbirds, game birds and hummingbirds are just a few of the many other types of birds that live in the Bay region.'
            },
            {
            'name' : 'Waterfowl',
            'label' : 'Waterfowl',
            'image' : 'images/birds-waterfowl.jpg',
            'blurb' : 'Ducks, geese and swans are all waterfowl. Most waterfowl visit the Chesapeake Bay region in winter as they migrate along the Atlantic Flyway, a major flight path for millions of birds. Other waterfowl live in the Bay region year-round.'
            },
            {
            'name' : 'Wading',
            'label' : 'Wading',
            'image' : 'images/birds-wading.jpg',
            'blurb' : 'Wading birds quietly stalk their prey in wetlands and shallow waters. Most wading birds, which include herons and egrets, nest together in large breeding colonies on the Chesapeake Bay\'s small, isolated islands.' 
            },
            {
            'name' : 'Sea & Shorebirds',
            'label' : 'Sea & Shorebirds',
            'image' : 'images/birds-sea-shorebirds.jpg',
            'blurb' : 'Seabirds and shorebirds live on and along the water. They primarily eat fish and other aquatic animals. Shorebirds include gulls, terns and sandpipers. Coots, pelicans and cormorants are all seabirds.'
            }],
          'image' : 'images/Birds.jpg',
          'blurb' : 'Hundreds of species of birds live in the Chesapeake Bay watershed. Some live here year-round, while others migrate to the region to feed or nest. Birds are some of the region\'s most beautiful—but vulnerable—species, and all serve as important links in the Bay ecosystem. ',
          'text' : '<h4>Hundreds of species of birds live in the Chesapeake Bay watershed. Some birds live here year-round, while others migrate to the Bay region to feed or nest.</h4><p>Birds are some of the region\'s most beautiful - but vulnerable - species. Although each bird has distinct behaviors and habitat needs, they all serve as important links in the Bay food web. However, birds are sensitive to pollution and habitat degradation.</p>'
        },
        { 'name' : 'Fish',
          'subtypes' : [{
            'name' : 'Freshwater Fish',
            'label' : 'Freshwater Fish',
            'image' : 'images/fish-freshwater-fish.jpg',
            'blurb' : 'Freshwater fish live year-round in the freshwater streams and rivers that flow to the Chesapeake Bay. Some freshwater fish may move into brackish waters in the Bay and its tidal rivers.'
            },
            {
            'name' : 'Estuarine Fish',
            'label' : 'Estuarine Fish',
            'image' : 'images/fish-estuarine-fish.jpg',
            'blurb' : 'Estuarine fish can survive in waters where fresh and salt water mix, like those throughout the Chesapeake Bay and its tidal rivers. Generally, estuarine fish stay close to the shore during summer and move to deeper waters in winter.'
            },
            {
            'name' : 'Migratory Fish',
            'label' : 'Migratory Fish',
            'image' : 'images/fish-migratory-fish.jpg',
            'blurb' : 'Migratory fish visit the Chesapeake Bay each year to feed or spawn. Marine fish live and spawn in coastal waters, anadromous fish migrate from the ocean to freshwater rivers to spawn and catadromous fish migrate from freshwater rivers to the ocean to spawn.'
            }],
          'image' : 'images/Fish.jpg',
          'blurb' : 'Nearly 350 species of fish live in the Chesapeake Bay. Some are year-round residents, while others swim in from the ocean to feed, reproduce or find shelter. Each of the Bay\'s fish has a vital place in the food web, and many provide abundant opportunities for fishermen.',
          'text' : '<h4>Approximately 350 species of fish live in the Chesapeake Bay. Some fish are year-round residents, while others swim into the Bay from the ocean to feed, reproduce or find shelter.</h4><p>Each of the Bay\'s fish has a place in the food web. For example, <a href=\'entry/Atlantic Menhaden\'>menhaden</a> and other filter-feeders are a vital link between the lower food web and higher-level predators. Menhaden feed on plankton and, in turn, are a critical food source for <a href=\'entry/Bluefish\'>bluefish</a> and <a href=\'entry/Striped Bass\'>striped bass</a>.</p><p>For centuries, the Bay and its rivers have provided rich fishing opportunities. Striped bass and <a href=\'entry/White Perch\'>white perch</a> are some of the many Chesapeake fish species that anglers and commercial fishermen seek out.</p>'

        },
        { 'name' : 'Insects & Invertebrates', 
          'subtypes' : [{
            'name' : 'Insects',
            'label' : 'Insects',
            'image' : 'images/insects-invertebrates-insects.jpg',
            'blurb' : 'Insects are found in nearly every habitat across the watershed, both on land and in the water. Some people may think insects are gross or scary, but they are an important part of the food web for fish, birds, mammals and reptiles.'
            },
            {
            'name' : 'Arthropods',
            'label' : 'Arthropods',
            'image' : 'images/insects-invertebrates-arthropod.jpg',
            'blurb' : 'Arthropods have an external skeleton—or exoskeleton—that they molt to grow. Crustaceans like crabs, shrimp and barnacles are the Bay\'s most common arthropods. Horseshoe crabs are arthropods, but not crustaceans: they are more closely related to spiders and scorpions.'
            },
            {
            'name' : 'Mollusks',
            'label' : 'Mollusks',
            'image' : 'images/insects-invertebrates-mollusks.jpg',
            'blurb' : 'Mollusks include bivalves, gastropods (snails) and cephalopods (squid). Most mollusks have at least one shell that protects and supports the animal\'s soft body. They also have a foot, which allows them to move.'
            },
            {
            'name' : 'Other Invertebrates',
            'label' : 'Other Invertebrates',
            'image' : 'images/insects-invertebrates.jpg',
            'blurb' : 'Invertebrates make up the most diverse and abundant species on Earth. Worms, sponges, corals, tunicates and echinoderms are just a few of the many other types of invertebrates that live in the Bay.'
            }],
          'image' : 'images/insects-invertebrates.jpg',
          'blurb' : 'Invertebrates are animals without a backbone, including insects, mollusks, crustaceans and more. Hundreds of species of invertebrates live in the waters of Chesapeake Bay, and thousands of species of insects live throughout the watershed, from deep woods to sandy beaches to our own backyards.',
          'text' : '<h4>Invertebrates are animals without a backbone. Hundreds of species of invertebrates live in the Chesapeake Bay.</h4><p>Some invertebrates, like <a href=\'entry/Easter Oyster\'>oysters</a> and <a href=\'entry/Blue Crab\'>blue crabs</a>, are well-known and easy to recognize. Others, like worms and <a href=\'entry/copepod\'>copepods</a>, are some of the most abundant animals in the Bay, but humans rarely see them. These small invertebrates are an important food source for larger fish and shellfish.</p><p>Insects are also invertebrates. Thousands of species of insects live in the Chesapeake Bay region in nearly every habitat, from deep woods to sandy beaches to our own backyards. Insects are a major food source for larger animals, including fish, birds, mammals and reptiles.</p>'
        },
        { 'name' : 'Mammals',
          'subtypes' : [{
            'name' : 'Aquatic Mammals',
            'label' : 'Aquatic',
            'image' : 'images/mammals-aquatic.jpg',
            'blurb' : 'Unlike many other mammals, aquatic mammals have no fur and have a thick layer of blubber. The Chesapeake Bay is home to several mammals that spend their entire lives in the water, including dolphins and the occasional wayward manatee.'
            },
            {
            'name' : 'Semi-Aquatic Mammals',
            'label' : 'Semi-Aquatic',
            'image' : 'images/mammals-semi-aquatic.jpg',
            'blurb' : 'Some mammals divide their time between land and water. Their waterproof—often oily—fur allows them to stay warm while in the water. These semi-aquatic species include beavers, muskrats and river otters.'
            },
            {
            'name' : 'Land Mammals',
            'label' : 'Land',
            'image' : 'images/mammals-land.jpg',
            'blurb' : 'A variety of land mammals live in the Bay watershed, from the small meadow vole to the large American black bear. While some of these animals are able to swim, they spend the majority of their lives on land. Land mammals include deer, squirrels, rabbits and foxes.'
            },
            {
            'name' : 'Flying Mammals',
            'label' : 'Flying',
            'image' : 'images/mammals-flying.jpg',
            'blurb' : 'While bats are the only mammals truly able to fly, others can “fly” by gliding for short distances using flaps on skin on either side of their body. Many species of bats, as well as the southern flying squirrel, can be found throughout the Chesapeake Bay region.'
            }],
          'image' : 'images/Mammals.jpg',
          'blurb' : 'Mammals are warm-blooded vertebrates that give birth to and nurse live young, are covered with hair at some point in their lives and generally have two pairs of limbs. Many different types of mammals live in or visit the Bay region, both on land and in the water.',
          'text' : '<h4>Mammals are an extremely diverse class of animals, ranging from bats, squirrels and rabbits to <a href=\'entry/bobcat\'>bobcats</a>, <a href=\'entry/Bottlenose Dolphin\'>dolphins</a> and humans.</h4><p>All mammals are warm-blooded vertebrates that give birth to and nurse live young; have highly evolved skeletons; are covered with hair at some point in their lives; and generally have two pairs of limbs (although some aquatic mammals have evolved without hind limbs).</p><p>Many different types of mammals live in or visit the Chesapeake Bay region. Some live either on land or in the water, while others spend time in both environments.</p>'
        },
        { 'name' : 'Plants & Trees',
          'subtypes' : [{ 
            'name' : 'Algae',
            'label' : 'Algae',
            'image' : 'images/plants-trees-algae.jpg',
            'blurb' : 'Algae are simple plants lacking roots, stems, leaves and a vascular system. Like all other plants, algae go through photosynthesis and need sunlight to grow. Some algae species can be confused with bay grasses, because they look similar and grow in the same places.'
            },
            {
            'name' : 'Bay Grasses',
            'label' : 'Bay Grasses',
            'image' : 'images/plants-trees-bay-grasses.jpg',
            'blurb' : 'Bay grasses—also known as submerged aquatic vegetation, or SAV—are plants that grow in the shallow waters of the Bay, providing food and habitat for fish, crabs and waterfowl. More than 16 species of bay grasses grow in the Bay and its tributaries.'
            },
            {
            'name' : 'Flowers',
            'label' : 'Flowers',
            'image' : 'images/plants-trees-flowers.jpg',
            'blurb' : 'There are hundreds of flowering plants that are native to the Chesapeake Bay region. These flowers are technically known as herbaceous plants, meaning they die off at the end of the growing season.'
            },
            {
            'name' : 'Trees & Shrubs',
            'label' : 'Trees & Shrubs',
            'image' : 'images/plants-trees-trees-shrubs.jpg',
            'blurb' : 'At least 50 types of trees grow in the Chesapeake Bay watershed. Some trees are deciduous, meaning they lose their leaves each autumn and grow new ones in spring. Other trees are evergreen and do not lose their leaves.'
            },
            {
            'name' : 'Aquatic & Wetland Plants',
            'label' : 'Aquatic & Wetland Plants',
            'image' : 'images/plants-trees.jpg',
            'blurb' : 'Wetland plants grow in damp, moist soils, whereas aquatic plants grow directly in water. Many are technically emergent plants, meaning they grow in standing water. Although native to wetlands and marshes, these plants are common in parks, yards and other areas.'
            }],
          'image' : 'images/plants-trees.jpg',
          'blurb' : 'More than 2,700 types of plants grow throughout the Chesapeake Bay watershed, in nearly every habitat: from upland forests to the Bay\'s shoreline to our own backyards. Plants help keep our air and water clean and provide habitat for countless animals.',
          'text' : '<h4> More than 2,700 types of plants grow throughout the Chesapeake Bay watershed, ranging from tiny, single-celled algae to tall, sturdy trees. Plants grow in nearly every habitat, from upland forests to the Bay\'s shoreline to our own backyards.</h4><p>Plants can help indicate the health of the larger Bay ecosystem. For example, large algae blooms are often a sign of nutrient pollution in the water. Bay grasses—also called submerged aquatic vegetation, or SAV—are sensitive to pollution but quick to respond to improved water quality, so their abundance is also a good indicator of Bay health.</p><p>Plants are critical to the Bay ecosystem because they help trap pollution, keep our air and water clean and provide habitat for countless animals, including fish, birds and mammals.</p>'
        },
        { 'name' : 'Reptiles & Amphibians',
          'subtypes' : [{
            'name' : 'Amphibians',
            'label' : 'Amphibians',
            'image' : 'images/reptiles-amphibians-amphibians.jpg',
            'blurb' : 'Amphibians have moist, absorbent, scale-less skin. Frogs, toads, newts and salamanders are all amphibians. Amphibians are very sensitive to environmental changes, making them excellent indicators of an ecosystem\'s health.'
            },
            {
            'name' : 'Reptiles',
            'label' : 'Reptiles',
            'image' : 'images/reptiles-amphibians-reptiles.jpg',
            'blurb' : 'Reptiles have scaly skin that helps them retain water. While many reptiles spend most of their time on land, some species live in or near the water. Snakes, turtles and lizards are all reptiles.'
            }],
          'image' : 'images/reptiles-amphibians.jpg',
          'blurb' : 'Reptiles and amphibians, sometimes called herps, are cold-blooded vertebrates. Hundreds of species live in the Chesapeake region: from frogs and salamanders that dwell along mountainous streams to sea turtles that visit the salty waters of the Bay\'s mouth.',
          'text' : '<h4>Reptiles and amphibians are cold-blooded vertebrates. They are sometimes called herps.</h4><p>Because reptiles and amphibians are cold-blooded, they must to bask in the sun to keep warm. Reptiles spend most of their time on land, whereas amphibians live both on land and in the water.</p><p>Hundreds of reptiles and amphibians live in the Chesapeake Bay region: from the frogs and salamanders that dwell along mountainous streams to the sea turtles that visit the Bay\'s salty mouth.</p>'
        }
      ];

    $rootScope.habitats = [ 
        { 'name': 'Aquatic Reefs & Pilings',
          'image': 'images/aquatic-reefs-pilings.jpg',
          'blurb': '<h4>Aquatic reefs are complex, diverse communities made of densely packed oysters. Healthy reefs form when oyster larvae attach to adult <a href="entry/eastern_oyster">oysters</a>, and layers of oysters grow upward and outward.</h4><p>Hundreds of aquatic animals find food and shelter in oyster reefs. With their many nooks and crannies, reefs provide a safe haven for small <a href="type/fish">fish</a> and <a href="type/invertebrates">invertebrates</a> to hide from predators. Larger species, including <a href="entry/white_perch">white perch</a>, <a href="entry/striped_bass">striped bass</a> and <a href="entry/blue_crab">blue crabs</a>, visit reefs to breed and find food. </p><p>Reefs are the largest source of hard surface on the Bay\'s bottom, which is otherwise mostly covered with soft <a href="/issues/sediment">sediment</a>. Oyster larvae, sponges and <a href="entry/barnacles">barnacles</a> are just a few of the many invertebrates that live attached to hard surfaces.</p><p>Piers, rocks, jetties, wrecks and pilings are similar to aquatic reefs. They provide hard surfaces for invertebrates and attract larger predators in search of food.</p>'
        },
        { 'name': 'Beaches & Tidal Flats',
          'image': 'images/beaches-tidal-flats.jpg',
          'blurb': '<h4>Sandy beaches and tidal mud flats line thousands of miles of Chesapeake Bay shoreline. Beaches are mostly found along the lower Bay, while muddy flats are more common in the upper Bay.</h4><p>Beaches are harsh environments where wildlife are subjected to wind, waves and heat. Aquatic species that wash ashore can easily dry out and die.</p><p>Beaches and tidal flats support a wide variety of plants and animals, including <a href="type/birds">birds</a>, <a href="/fieldguide/categories/category/mammals">mammals</a>, <a href="type/insects">insects</a> and <a href="type/invertebrates">invertebrates</a>. Sandpipers and small crabs scurry along the water\'s edge, while gulls and terns fly above. Underneath the sand and mud, worms, clams and crabs burrow to avoid predators. <a href="entry/horseshoe_crab">Horseshoe crabs</a> are one of the most celebrated beach dwellers; they come ashore in late spring to lay their eggs in the sand.</p>'
        },
        { 'name': 'Forests & Uplands',
          'image': 'images/forest-uplands.jpg',
          'blurb': '<h4>Healthy forests provide food, shelter, nesting areas and safe migration paths for countless species. Decaying leaves and plants littered on the forest floor are a critical link in the <a href="/discover/bayecosystem/foodwebs">food web</a>.</h4><p>Forests don\'t just benefit animals on land; they\'re also critical to aquatic species. Forest buffers along the edges of waterways provide habitat for <a href="type/birds">birds</a>, <a href="/fieldguide/categories/category/mammals">mammals</a> and <a href="type/reptiles_amphibians">reptiles</a>. They also help keep the water cool, which is important for spawning <a href="entry/brook_trout">brook trout</a> and other <a href="type/fish">fish</a>.</p><p>Forest-dwelling species are not limited to large forests. Many species, such as <a href="entry/white_tailed_deer">white-tailed deer</a> and <a href="entry/red_fox">red foxes</a>, can be found in smaller wooded areas in our cities, towns and suburbs. Some even venture into our own backyards!</p>'
        },
        { 'name': 'Marshes & Wetlands',
          'image': 'images/marshes-wetlands.jpg',
          'blurb': '<h4><a href="/issues/wetlands">Wetlands</a> are transitional areas between land and water. Marshes - a type of tidal wetland - are wet areas along the shoreline where aquatic grasses and sedges grow.</h4><p>Hundreds of species of <a href="type/fish">fish</a>, <a href="type/birds">birds</a>, <a href="type/mammals">mammals</a>, <a href="type/reptiles_amphibians">reptiles</a> and <a href="type/invertebrates">invertebrates</a> depend on marshes and wetlands for food. Thousands of aquatic species, including worms, <a href="entry/marsh_periwinkle">periwinkles</a>, <a href="type/insects">insects</a>, <a href="entry/atlantic_ribbed_mussel">ribbed mussels</a> and tiny crustaceans, thrive in wetlands. In turn, larger animals eat these small species.</p><p>Marshes and wetlands also provide shelter for a variety of animals. Two-thirds of the nation\'s commercial fish and shellfish depend on wetlands as nursery or spawning areas. Large flocks of waterfowl visit wetlands during their winter migrations to feed and rest. And mammals such as muskrats and beavers build their homes in wetlands.</p>'
        },
        { 'name': 'Open & Shallow Waters',
          'image': 'images/open-shallow-waters.jpg',
          'blurb': '<h4>Along the Chesapeake Bay\'s shoreline is an area of incredible biological activity: the shallows. The Bay\'s shallow waters extend from the shore to about 10 feet deep. Beyond the shoreline lie the open waters of the Chesapeake Bay: a wide, open area with channels that are more than 100 feet deep.</h4><p>Shallow waters are home to an incredible variety of animals, including worms, clams, crabs, <a href="type/fish">fish</a>, <a href="type/birds">birds</a> and <a href="type/reptiles_amphibians">turtles</a>. Many small fish and invertebrates seek refuge from predators in the shallows. In turn, larger fish and birds hunt for prey there.<a href="type/Plants%20&%20Trees/subtype/Bay%20Grasses">Bay grass beds</a> are a critically important part of the shallows, providing shelter for <a href="entry/blue_crab">blue crabs</a>, young fish and <a href="entry/sandbar_shark">sharks</a> to hide from predators. Several species of migratory waterfowl depend on bay grasses for food.</p><p>The Bay\'s open waters are teeming with life, including <a href="type/fish">fish</a>, <a href="/fieldguide/categories/category/birds">birds</a>, <a href="type/invertebrates">invertebrates</a> and <a href="type/mammals">aquatic mammals</a>. They are a haven for migratory fish such as <a href="entry/bluefish">bluefish</a>, <a href="/fieldguide/critter/cobia">cobia</a> and <a href="entry/mackerels">mackerels</a>. These large fish visit the Bay in summer to feast on <a href="entry/atlantic_menhaden">menhaden</a>, <a href="entry/bay_anchovy">anchovies</a> and other small fish and invertebrates. And, although you cannot see them, microscopic <a href="entry/plankton">plankton</a> float through open waters, forming the base of the Bay\'s <a href="/discover/bayecosystem/foodwebs">food web</a>.</p><p>In summer, both the shallows and open waters of the Bay become very warm, allowing harmful algae blooms to form. These can lead to low-oxygen "dead zones" that suffocate underwater life. In winter, animals that dwell in the Bay\'s shallow waters retreat to deeper channels, while hundreds of thousands of migratory birds stop on the Chesapeake\'s open waters to rest and feed.</p>'
        },
        { 'name': 'Streams & Rivers',
          'image': 'images/streams-rivers.jpg',
          'blurb': '<h4>Hundreds of thousands of streams, creeks and rivers thread through the Chesapeake Bay watershed and eventually flow to the Bay. These freshwater tributaries provide critical habitat for many plants and animals, including <a href="type/fish">fish</a>, <a href="type/insects">insects</a>, <a href="type/reptiles_amphibians">reptiles</a>, <a href="type/reptiles_amphibians">amphibians</a> and <a href="type/invertebrates">invertebrates</a>.</h4><p>Catfish, sunfish and <a href="entry/brook_trout">brook trout</a> are just a few types of fish that live their entire lives in fresh water. Many other fish - including shad, <a href="entry/atlantic_sturgeon">Atlantic sturgeon</a> and <a href="entry/striped_bass">striped bass</a> - travel from the Bay and the ocean to freshwater streams and rivers to spawn.</p><p>Fish aren\'t the only animals that are found in streams and rivers. Diverse communities of tiny worms and clams live at the bottom of streams. Many bay <a href="type/Plants%20&%20Trees/subtype/Bay%20Grasses">grass species</a>, including <a href="entry/coontail">coontail</a> and <a href="entry/wild_celery">wild celery</a>, only grow in fresh water. Along the edges of streams and rivers, turtles and snakes bask in the sun and search for prey. </p>'
        }
      ];
      
    getEntries().then( function( results ){
      $rootScope.entries = results.data;
      _.map( $rootScope.entries, function( entry ){
        entry.habitats = [];
        _.each( entry.categories, function( category ){
          _.each( $rootScope.types, function( type ){
            if( type.name === category.category_name ){
              entry.type = type.name;
            }
            _.each( type.subtypes, function( subtype ){
              if( subtype.label === category.category_name ){
                entry.subtype = subtype.label;
              }
            });
          });
          _.each( $rootScope.habitats, function( habitat ){
            if( habitat.name === category.category_name ){
              entry.habitats.push( habitat.name);
            }
          });
        });
      });
    });
  });

  /***Router***/
  fieldGuide.config(['$routeProvider', '$locationProvider', 
    function($routeProvider, $locationProvider) {
      $routeProvider.
        when( '/', {
          templateUrl: 'partials/start.html',
          controller: 'StartController'
        }).
        when( '/search/:query', {
          templateUrl: 'partials/entryList.html',
          controller: 'ResultsController',
          caseInsensitiveMatch: true          
        }).
        when( '/habitats/:habitat', {
          templateUrl: 'partials/habitat.html',
          controller: 'HabitatController',
          caseInsensitiveMatch: true
        }).
        when( '/type/:type', {
          templateUrl: 'partials/entryList.html',
          controller: 'TypeController',
          caseInsensitiveMatch: true
        }).
        when( '/type/:type/subtype/:subtype', {
          templateUrl: 'partials/entryList.html',
          controller: 'TypeController',
          caseInsensitiveMatch: true
        }).
        when( '/entry/:title', {
          templateUrl: 'partials/entry.html',
          controller: 'EntryController',
          caseInsensitiveMatch: true
        }).
        otherwise({
          redirectTo: '/'
        });
      $locationProvider.html5Mode( true );
  }]);

})();