-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2015 at 09:06 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ee_database`
--
CREATE DATABASE IF NOT EXISTS `ee_database` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `ee_database`;

-- --------------------------------------------------------

--
-- Table structure for table `exp_accessories`
--

DROP TABLE IF EXISTS `exp_accessories`;
CREATE TABLE IF NOT EXISTS `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(75) NOT NULL DEFAULT '',
  `member_groups` varchar(255) NOT NULL DEFAULT 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_accessories`
--

INSERT INTO `exp_accessories` (`accessory_id`, `class`, `member_groups`, `controllers`, `accessory_version`) VALUES
(1, 'Expressionengine_info_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_files_modal|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.0');

-- --------------------------------------------------------

--
-- Table structure for table `exp_actions`
--

DROP TABLE IF EXISTS `exp_actions`;
CREATE TABLE IF NOT EXISTS `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `csrf_exempt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `exp_actions`
--

INSERT INTO `exp_actions` (`action_id`, `class`, `method`, `csrf_exempt`) VALUES
(1, 'Comment', 'insert_new_comment', 0),
(2, 'Comment_mcp', 'delete_comment_notification', 0),
(3, 'Comment', 'comment_subscribe', 0),
(4, 'Comment', 'edit_comment', 0),
(5, 'Search', 'do_search', 1),
(6, 'Channel', 'submit_entry', 0),
(7, 'Channel', 'filemanager_endpoint', 0),
(8, 'Channel', 'smiley_pop', 0),
(9, 'Channel', 'combo_loader', 0),
(10, 'Rte', 'get_js', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_captcha`
--

DROP TABLE IF EXISTS `exp_captcha`;
CREATE TABLE IF NOT EXISTS `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_categories`
--

DROP TABLE IF EXISTS `exp_categories`;
CREATE TABLE IF NOT EXISTS `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `exp_categories`
--

INSERT INTO `exp_categories` (`cat_id`, `site_id`, `group_id`, `parent_id`, `cat_name`, `cat_url_title`, `cat_description`, `cat_image`, `cat_order`) VALUES
(1, 1, 1, 0, 'Waterfowl', 'waterfowl', '', '', 5),
(2, 1, 1, 0, 'Sea & Shorebirds', 'sea-shorebirds', '', '', 3),
(3, 1, 1, 0, 'Wading', 'wading', '', '', 4),
(4, 1, 1, 0, 'Raptors', 'raptors', '', '', 2),
(5, 1, 1, 0, 'Other', 'other', '', '', 1),
(7, 1, 2, 0, 'Blah', 'blah', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_field_data`
--

DROP TABLE IF EXISTS `exp_category_field_data`;
CREATE TABLE IF NOT EXISTS `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_category_field_data`
--

INSERT INTO `exp_category_field_data` (`cat_id`, `site_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(7, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_fields`
--

DROP TABLE IF EXISTS `exp_category_fields`;
CREATE TABLE IF NOT EXISTS `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_groups`
--

DROP TABLE IF EXISTS `exp_category_groups`;
CREATE TABLE IF NOT EXISTS `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_category_groups`
--

INSERT INTO `exp_category_groups` (`group_id`, `site_id`, `group_name`, `sort_order`, `exclude_group`, `field_html_formatting`, `can_edit_categories`, `can_delete_categories`) VALUES
(1, 1, 'Birds', 'a', 0, 'all', '', ''),
(2, 1, 'Test Category Group', 'a', 0, 'all', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_posts`
--

DROP TABLE IF EXISTS `exp_category_posts`;
CREATE TABLE IF NOT EXISTS `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_category_posts`
--

INSERT INTO `exp_category_posts` (`entry_id`, `cat_id`) VALUES
(16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data`
--

DROP TABLE IF EXISTS `exp_channel_data`;
CREATE TABLE IF NOT EXISTS `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_1` text,
  `field_ft_1` tinytext,
  `field_id_2` text,
  `field_ft_2` tinytext,
  `field_id_3` text,
  `field_ft_3` tinytext,
  `field_id_4` text,
  `field_ft_4` tinytext,
  `field_id_5` text,
  `field_ft_5` tinytext,
  `field_id_6` text,
  `field_ft_6` tinytext,
  `field_id_7` text,
  `field_ft_7` tinytext,
  `field_id_8` text,
  `field_ft_8` tinytext,
  `field_id_9` text,
  `field_ft_9` tinytext,
  `field_id_10` varchar(8) DEFAULT NULL,
  `field_ft_10` tinytext,
  `field_id_11` varchar(8) DEFAULT NULL,
  `field_ft_11` tinytext,
  `field_id_12` text,
  `field_ft_12` tinytext,
  `field_id_13` text,
  `field_ft_13` tinytext,
  `field_id_14` text,
  `field_ft_14` tinytext,
  `field_id_15` varchar(8) DEFAULT NULL,
  `field_ft_15` tinytext,
  `field_id_16` varchar(8) DEFAULT NULL,
  `field_ft_16` tinytext,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_channel_data`
--

INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_1`, `field_ft_1`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`, `field_id_8`, `field_ft_8`, `field_id_9`, `field_ft_9`, `field_id_10`, `field_ft_10`, `field_id_11`, `field_ft_11`, `field_id_12`, `field_ft_12`, `field_id_13`, `field_ft_13`, `field_id_14`, `field_ft_14`, `field_id_15`, `field_ft_15`, `field_id_16`, `field_ft_16`) VALUES
(1, 1, 1, 'Melleagris gallopavo', 'none', 'Native|Males: Up to 3 feet tall, 4 feet long and up to 25 pounds\n\nFemales: Grow to about half the height and weight of males|Forests & Uplands; Halloumi croque monsieur cheese and biscuits. Brie cheddar macaroni cheese boursin macaroni cheese taleggio cheddar chalk and cheese. Port-salut melted cheese say cheese pecorino babybel pecorino roquefort cheesy grin. Say cheese jarlsberg chalk and cheese.|Halloumi croque monsieur cheese and biscuits. Brie cheddar macaroni cheese boursin macaroni cheese taleggio cheddar chalk and cheese. Port-salut melted cheese say cheese pecorino babybel pecorino roquefort cheesy grin. Say cheese jarlsberg chalk and cheese.|food and stuff|a good long while|pretty good', 'xhtml', 'Turkeys are ugly as sin as twice as bad. They''ve been known to eat small children when left unattended. Turkeys frequently steal cars, which is ridiculous because they have no thumbs. This goes to show the sheer vindictiveness of your average turkey.', 'none', 'Most turkeys are tenors. However a few might be considered countertenors, and a very small number fall in the treble range.\n\n<audio controls="controls">\n          Your browser does not support the <code>audio</code> element.\n          <source src="https://mdn.mozillademos.org/files/2587/AudioTest%20%281%29.ogg" type="audio/ogg">\n</audio>', 'none', '<ul>\n    <li>Turkeys can read</li>\n    <li>The first president of Costa Rica owned a pet turkey named “Sebastian”</li>\n    <li>Turkeys can’t look up</li>\n</ul>', 'none', '<ul>\n    <li>Animal Diversity Web: Meleagris gallopavo - University of Michigan Museum of Zoology</li>\n    <li>Animal Diversity Web: Meleagris gallopavo - University of Michigan Museum of Zoology</li>\n    <li>Animal Diversity Web: Meleagris gallopavo - University of Michigan Museum of Zoology</li>\n    <li>Animal Diversity Web: Meleagris gallopavo - University of Michigan Museum of Zoology</li>\n    <li>Animal Diversity Web: Meleagris gallopavo - University of Michigan Museum of Zoology</li>\n</ul>', 'none', 'The wild turkey is a bird and that''s really cool because birds. Halloumi croque monsieur cheese and biscuits. Brie cheddar macaroni cheese boursin macaroni cheese taleggio cheddar chalk and cheese. Port-salut melted cheese say cheese pecorino babybel pecorino roquefort cheesy grin. Say cheese jarlsberg chalk and cheese.', 'none', '', 'markdown', '', 'xhtml', '', 'xhtml', '', 'xhtml', ' ', 'xhtml', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml'),
(2, 1, 1, 'Science lizard', 'none', 'Invasive|Huge|Farms|All over', 'xhtml', 'Ut turpis lorem, commodo in elit a, posuere venenatis mi. Suspendisse iaculis fringilla porta. Nam a justo eu arcu pellentesque dapibus. Morbi vitae mi eu velit eleifend dictum. Aenean ultricies lectus leo, nec facilisis orci viverra vitae. Duis a pellentesque lorem, ac commodo turpis. Pellentesque interdum orci arcu, consequat tempor ex rutrum non. Fusce laoreet pellentesque orci ac sollicitudin. Sed et gravida tortor, fermentum malesuada magna. Pellentesque vel nisi odio. Aenean sit amet porta nisi, et pulvinar tellus. Aliquam erat volutpat.', 'none', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed lacinia tortor lectus, a porta nisl accumsan ut. In in massa non diam tempor dapibus. Aenean sodales mi nec ante commodo pulvinar. Morbi ipsum nisi, venenatis placerat ante mattis, fringilla cursus sapien. Vestibulum in diam quis velit pharetra consequat in non dui. Aliquam ut dolor quis erat blandit mattis. Nulla fringilla nisi id euismod ultrices. Curabitur lobortis risus ut lobortis vehicula. ', 'none', '<ul>\n    <li>Quisque eu massa tincidunt, interdum lectus interdum, vehicula est.</li>\n    <li>Etiam dictum ante quis velit convallis rhoncus.</li>\n    <li>Curabitur eget metus vitae velit laoreet gravida at sed velit.</li>\n    <li>Mauris tempor felis vitae risus sodales, in porta lectus mollis.</li>\n</ul>', 'xhtml', '<ul>\n    <li>Maecenas a diam sit amet nibh molestie maximus.</li>\n    <li>Nullam elementum lorem et est vulputate commodo.</li>\n    <li>Integer pretium tortor non semper maximus.</li>\n</ul>', 'xhtml', 'Integer interdum consectetur ipsum, eu pellentesque velit commodo non. Nulla facilisi. Nulla facilisi. Sed eu sapien eget nisl porttitor lobortis. Etiam suscipit sed arcu in euismod. Suspendisse potenti. Vivamus vestibulum felis ac eros eleifend, nec viverra turpis consequat. Nulla varius, nulla vitae blandit pellentesque, ligula neque posuere dui, iaculis venenatis nibh massa et erat. ', 'none', '', 'markdown', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'xhtml', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml'),
(3, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p class="lead">Algae are simple plants that lack roots, stems, leaves and a vascular system. Like all other plants, algae go through photosynthesis and need sunlight to grow.</p>\n\n  Some algae are <a title="" href="http://www.chesapeakebay.net/discover/bayecosystem/plankton">phytoplankton</a>: tiny, single-celled plants that cannot be seen with the naked eye. Other types are multi-cellular and grow in clumps or slimy mats. Some algae species can be confused with <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/bay_grasses_sav">bay grasses</a> because they look similar and grow in the same places.\n\n  Large algae blooms are often a sign of <a title="" href="http://www.chesapeakebay.net/issues/nutrients">nutrient pollution</a> in the water. Algae blooms are most common in spring and summer, when heavy rainstorms send more pollution into the Chesapeake Bay and its rivers.\n\n  Click on the images below to learn about some of the algae that grow in the Chesapeake Bay.', 'markdown', NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', '', 'none', 'Algae are simple plants that lack roots, stems, leaves and a vascular system. Like all other plants, algae go through photosynthesis and need sunlight to grow.', 'none', '', 'xhtml', '', 'xhtml'),
(4, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p class="lead">Bay grasses - also known as submerged aquatic vegetation or SAV - are plants that grow underwater in the Chesapeake Bay’s <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/shallow_waters">shallows</a>. More than 16 species of bay grasses grow in the Bay and its tributaries.</p>\n\n  Bay grasses are a very important part of the Bay ecosystem. <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/fish">Fish</a>, crabs, waterfowl are a few of the many animals that depend on bay grasses for food and habitat.\n\n  Different species of bay grasses grow in different parts of the Bay because of <a title="" href="http://www.chesapeakebay.net/discover/bayecosystem/physical">salinity</a>, or the amount of salt in the water. For example, <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/eelgrass">eelgrass</a> prefers the saltier waters of the lower Bay. Other bay grasses, such as <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/naiads">naiads</a> and <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/wild_celery">wild celery</a>, only grow in the fresh waters of the upper Bay and the Bay’s tributaries.\n\n  Click on the images below to learn about some of the bay grasses that grow in the Chesapeake Bay.', 'markdown', NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', '', 'none', 'Bay grasses - also known as submerged aquatic vegetation or SAV - are plants that grow underwater in the Chesapeake Bay’s shallows. More than 16 species of bay grasses grow in the Bay and its tributaries.', 'none', '', 'xhtml', '', 'xhtml'),
(5, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p class="lead">Hundreds of species of birds live in the Chesapeake Bay <a title="" href="http://www.chesapeakebay.net/discover/baywatershed">watershed</a>. Some birds live here year-round, while others migrate to the Bay region to feed or nest.</p>\n\n  Birds are some of the region’s most beautiful - but vulnerable -\n species. Although each bird has distinct behaviors and habitat needs,\n they all serve as important links in the Bay <a title="" href="http://www.chesapeakebay.net/discover/bayecosystem/foodwebs">food web</a>. However, birds are sensitive to pollution and habitat degradation.\n\n  Click on the images below to learn about some of the birds that live in the Chesapeake Bay region.', 'markdown', NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', '', 'none', 'Hundreds of species of birds live in the Chesapeake Bay watershed. Some birds live here year-round, while others migrate to the Bay region to feed or nest.', 'none', '', 'xhtml', '', 'xhtml'),
(6, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p class="lead">Approximately 350 species of fish live in the Chesapeake Bay. Some fish are year-round residents, while others swim into the Bay from the ocean to feed, reproduce or find shelter.</p>\n\n  Each of the Bay’s fish has a place in the <a title="" href="http://www.chesapeakebay.net/discover/bayecosystem/foodwebs">food web</a>. For example, <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/atlantic_menhaden">menhaden</a> and other filter-feeders are a vital link between the lower food web and higher-level predators. Menhaden feed on <a title="" href="http://www.chesapeakebay.net/discover/bayecosystem/plankton">plankton</a> and, in turn, are a critical food source for <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/bluefish">bluefish</a> and <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/striped_bass">striped bass</a>.\n\n  For centuries, the Bay and its rivers have provided rich fishing opportunities. Striped bass and <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/white_perch">white perch</a> are some of the many Chesapeake fish species that anglers and commercial fishermen seek out.\n\n  Click on the images below to learn about some of the fish that live in the Chesapeake Bay.', 'markdown', NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', '', 'none', 'Approximately 350 species of fish live in the Chesapeake Bay. Some fish are year-round residents, while others swim into the Bay from the ocean to feed, reproduce or find shelter.', 'none', '', 'xhtml', '', 'xhtml'),
(7, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p class="lead">Thousands of species of insects live in the Chesapeake Bay region. Insects are found in nearly every habitat, from deep <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/forests_uplands">woods</a> to sandy <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/beaches_tidal_flats">beaches</a> to our own backyards. Some insects live on the land, while others spend most of their time in the water.</p>\n\n  Although some people may think insects are gross or scary, they are actually very important to the environment. Insects have a critical place in the <a title="" href="http://www.chesapeakebay.net/discover/bayecosystem/foodwebs">food web</a>. They are a major food source for larger animals, including <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/fish">fish</a>, <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/birds">birds</a>, <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/mammals">mammals</a> and <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/reptiles_amphibians">reptiles</a>.\n\n  Click on the images below to learn about some of the insects that live in the Chesapeake Bay watershed.', 'markdown', NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', '', 'none', 'Thousands of species of insects live in the Chesapeake Bay region. Insects are found in nearly every habitat, from deep woods to sandy beaches to our own backyards. Some insects live on the land, while others spend most of their time in the water.', 'none', '', 'xhtml', '', 'xhtml'),
(8, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p class="lead">Invertebrates are animals without a backbone. Hundreds of species of invertebrates live in the Chesapeake Bay.</p>\n\n  Some invertebrates, like <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/eastern_oyster">oysters</a> and <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/blue_crab">blue crabs</a>, are well-known and easy to recognize. Other invertebrates are not quite as familiar to most of us. For example, worms and <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/copepods">copepods</a> are some of the most abundant animals in the Bay, but humans rarely see them. These small invertebrates are an important food source for larger <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/fish">fish</a> and shellfish.\n\n  Click on the images below to learn about some of the invertebrates that live in the Chesapeake Bay.', 'markdown', NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', '', 'none', 'Invertebrates are animals without a backbone. Hundreds of species of invertebrates live in the Chesapeake Bay.', 'none', '', 'xhtml', '', 'xhtml'),
(9, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p class="lead">Mammals are an extremely diverse class of animals, ranging from bats, squirrels and rabbits to <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/bobcat">bobcats</a>, <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/bottlenose_dolphin">dolphins</a> and humans.</p>\n\n  All mammals are warm-blooded vertebrates that give birth to and nurse live young; have highly evolved skeletons; are covered with hair at some point in their lives; and generally have two pairs of limbs (although some aquatic mammals have evolved without hind limbs).\n\n  Many different types of mammals live in or visit the Chesapeake Bay region. Some live either on land or in the water, while others spend time in both environments.\n\n  Click on the images below to learn about some of the mammals that live in the Chesapeake Bay watershed.', 'markdown', NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', '', 'none', 'Mammals are an extremely diverse class of animals, ranging from bats, squirrels and rabbits to bobcats, dolphins and humans.', 'none', '', 'xhtml', '', 'xhtml'),
(10, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p class="lead">More than 2,700 types of plants grow throughout the Chesapeake Bay <a title="" href="http://www.chesapeakebay.net/discover/baywatershed">watershed</a>. Plants grow in nearly every habitat: from <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/forests_uplands">upland forests</a> to the Bay’s shoreline to our own backyards.</p>\n\n  Plants are critical to the Bay ecosystem because they help keep our air and water clean. Plants also provide habitat for countless animals, including <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/fish">fish</a>, <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/birds">birds</a> and <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/mammals">mammals</a>.\n\n  Click on the images below to learn about some of the plants and trees that grow in the Chesapeake Bay watershed.', 'markdown', NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', '', 'none', 'More than 2,700 types of plants grow throughout the Chesapeake Bay watershed. Plants grow in nearly every habitat: from upland forests to the Bay’s shoreline to our own backyards.', 'none', '', 'xhtml', '', 'xhtml'),
(11, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<p class="lead">Reptiles and amphibians are cold-blooded vertebrates. They are sometimes called herps.</p>\n\n  Because reptiles and amphibians are cold-blooded, they must to bask in the sun to keep warm. Reptiles spend most of their time on land, whereas amphibians live both on land and in the water.\n\n  Hundreds of reptiles and amphibians live in the Chesapeake Bay region: from the frogs and salamanders that dwell along mountainous streams to the sea turtles that visit the Bay’s salty mouth.\n\n  Click on the images below to learn about some of the reptiles and amphibians that live in the Chesapeake Bay watershed.', 'markdown', NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', '', 'none', 'Reptiles and amphibians are cold-blooded vertebrates. They are sometimes called herps.', 'none', '', 'xhtml', '', 'xhtml'),
(12, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'markdown', 'Aquatic reefs are complex, diverse communities made of densely packed oysters. Healthy reefs form when oyster larvae attach to adult <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/eastern_oyster">oysters</a>, and layers of oysters grow&nbsp; upward and outward.\n\n Hundreds of aquatic animals find food and shelter in oyster reefs. With their many nooks and crannies, reefs provide a safe haven for small <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/fish">fish</a> and <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/invertebrates">invertebrates</a> to hide&nbsp; from predators. Larger species, including <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/white_perch">white perch</a>, <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/striped_bass">striped bass</a> and <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/blue_crab">blue crabs</a>, visit reefs to breed and find food.\n\n Reefs are the largest source of hard surface on the Bay''s bottom, which is otherwise mostly covered with soft <a title="" href="http://www.chesapeakebay.net/issues/sediment">sediment</a>. Oyster larvae, sponges and <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/barnacles">barnacles</a> are just a&nbsp; few of the many invertebrates that live attached to hard surfaces.\n\n Piers, rocks, jetties, wrecks and pilings are similar to aquatic reefs. They provide hard surfaces for invertebrates and attract larger predators in search of food.\n\n Click on the images below to learn about some of the critters that live on the Chesapeake Bay''s aquatic reefs and pilings.', 'xhtml', NULL, NULL, NULL, NULL, '', 'xhtml', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml'),
(13, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'markdown', 'Healthy forests provide food, shelter, nesting areas and safe migration paths for countless species. Decaying leaves and plants littered on the forest floor are a critical link in the <a title="" href="http://www.chesapeakebay.net/discover/bayecosystem/foodwebs">food web</a>.\n\n Forests don''t just benefit animals on land; they''re also critical to aquatic species. Forest buffers along the edges of waterways provide habitat for <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/birds">birds</a>, <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/mammals">mammals</a> and <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/reptiles_amphibians">reptiles</a>.&nbsp; They also help keep the water cool, which is important for spawning <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/brook_trout">brook trout</a> and other <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/fish">fish</a>.\n\n Forest-dwelling species are not limited to large forests. Many species, such as <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/white_tailed_deer">white-tailed deer</a> and <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/red_fox">red foxes</a>, can be found in smaller wooded areas in our cities, towns and&nbsp; suburbs. Some even venture into our own backyards!\n\n Click on the images below to learn about some of the critters that live in the Chesapeake Bay watershed''s forests and uplands.', 'xhtml', NULL, NULL, NULL, NULL, '', 'xhtml', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml'),
(14, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'markdown', '<a title="" href="http://www.chesapeakebay.net/issues/wetlands">Wetlands</a> are transitional areas between land and water. Marshes - a type of tidal wetland - are wet areas along the shoreline where aquatic grasses and sedges grow.\n\n Hundreds of species of <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/fish">fish</a>, <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/birds">birds</a>, <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/mammals">mammals</a>, <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/reptiles_amphibians">reptiles</a> and <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/invertebrates">invertebrates</a> depend on marshes and wetlands for food. Thousands of aquatic species, including worms,&nbsp; <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/marsh_periwinkle">periwinkles</a>, <a title="" href="http://www.chesapeakebay.net/fieldguide/categories/category/insects">insects</a>, <a title="" href="http://www.chesapeakebay.net/fieldguide/critter/atlantic_ribbed_mussel">ribbed mussels</a> and tiny crustaceans, thrive in wetlands. In turn, larger animals eat these small species.\n\n Marshes and wetlands also provide shelter for a variety of animals. Two-thirds of the nation''s commercial fish and shellfish depend on wetlands as nursery or spawning areas.&nbsp; Large flocks of waterfowl visit wetlands during their winter migrations to feed and rest. And mammals such as muskrats and beavers build their homes in wetlands.\n\n Click on the images below to learn about some of the critters that live in the Chesapeake Bay''s marshes and wetlands.', 'xhtml', NULL, NULL, NULL, NULL, '', 'xhtml', '', 'none', '', 'none', '', 'xhtml', '', 'xhtml'),
(15, 1, 1, '', 'none', ' ', 'xhtml', '', 'none', '', 'none', NULL, 'xhtml', NULL, 'xhtml', '', 'none', NULL, NULL, NULL, NULL, '', 'xhtml', '', 'xhtml', ' ', 'xhtml', NULL, NULL, NULL, NULL, '', 'xhtml', '', 'xhtml'),
(16, 1, 1, '', 'none', ' ', 'xhtml', '', 'none', '', 'none', NULL, 'xhtml', NULL, 'xhtml', '', 'none', NULL, NULL, NULL, NULL, '', 'xhtml', '', 'xhtml', ' ', 'xhtml', NULL, NULL, NULL, NULL, '', 'xhtml', '', 'xhtml'),
(17, 1, 1, '', 'none', ' ', 'xhtml', '', 'none', '', 'none', NULL, 'xhtml', NULL, 'xhtml', '', 'none', NULL, NULL, NULL, NULL, '', 'xhtml', '', 'xhtml', ' ', 'xhtml', NULL, NULL, NULL, NULL, '', 'xhtml', '', 'xhtml'),
(18, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', '', 'xhtml'),
(19, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', '', 'xhtml'),
(20, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', '', 'xhtml'),
(21, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', '', 'xhtml'),
(22, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', '', 'xhtml'),
(23, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'xhtml', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'xhtml', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'xhtml', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'xhtml', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 1, 1, 'carthago delenda est', 'none', 'Invasive|HUGE|Way down yonder on the Chatahoochee|Mid-atlantic|Atkins|6-15 years|G', 'xhtml', 'Grizzled, gnarly, and wizened. ', 'none', '', 'none', '<ul>\n    <li>The Rappahannock Greeneye is also known as the Lesser Wrangletooth</li>\n    <li>Andrew Jackson introduced the species in the 1840s</li>\n    <li>Greeneye’s can actually see into the infrared spectrum </li>\n</ul>', 'xhtml', NULL, 'xhtml', 'Six foot long and full o'' pepper, the Rappahannock Greeneye is a popular sportfish in the mid-Atlantic region. It is an invasive species in the Chesapeake Bay watershed, and poses a threat to native fishes, not to mention dogs and small children.', 'none', NULL, NULL, NULL, NULL, '', 'xhtml', '', 'xhtml', ' ', 'xhtml', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', NULL, NULL),
(29, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', NULL, NULL),
(30, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'xhtml', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_entries_autosave`
--

DROP TABLE IF EXISTS `exp_channel_entries_autosave`;
CREATE TABLE IF NOT EXISTS `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_fields`
--

DROP TABLE IF EXISTS `exp_channel_fields`;
CREATE TABLE IF NOT EXISTS `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL DEFAULT 'any',
  `field_settings` text,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `exp_channel_fields`
--

INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`) VALUES
(1, 1, 1, 'scientific_name', 'Scientific Name', '', 'text', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 1, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MzoiYWxsIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(2, 1, 1, 'quick_facts', 'Quick Facts', '', 'grid', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'y', 'n', 'xhtml', 'n', 2, 'any', 'YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(3, 1, 1, 'appearance', 'Appearance', '', 'textarea', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 3, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(4, 1, 1, 'voice', 'Voice', '', 'textarea', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 4, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6InkiO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(5, 1, 1, 'did_you_know', 'Did You Know?', '', 'rte', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 5, 'any', 'YTo4OntzOjI0OiJydGVfZmllbGRfdGV4dF9kaXJlY3Rpb24iO3M6MzoibHRyIjtzOjExOiJydGVfdGFfcm93cyI7czoxOiI2IjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(6, 1, 1, 'sources_and_additional_informati', 'Sources and Additional Information', '', 'rte', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 6, 'any', 'YTo4OntzOjI0OiJydGVfZmllbGRfdGV4dF9kaXJlY3Rpb24iO3M6MzoibHRyIjtzOjExOiJydGVfdGFfcm93cyI7czoxOiI2IjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(7, 1, 1, 'short_description', 'Short Description', '', 'textarea', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 7, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(8, 1, 2, 'type_description', 'Description', '', 'textarea', '', '0', 0, 0, 10, 128, 'n', 'ltr', 'n', 'n', 'markdown', 'y', 1, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToieSI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(9, 1, 3, 'habitat_description', 'Description', '', 'rte', '', '0', 0, 0, 10, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 1, 'any', 'YTo4OntzOjI0OiJydGVfZmllbGRfdGV4dF9kaXJlY3Rpb24iO3M6MzoibHRyIjtzOjExOiJydGVfdGFfcm93cyI7czoyOiIxMCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MTk6ImZpZWxkX3Nob3dfZ2xvc3NhcnkiO3M6MToibiI7czoyMToiZmllbGRfc2hvd19zcGVsbGNoZWNrIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjtzOjIwOiJmaWVsZF9zaG93X3dyaXRlbW9kZSI7czoxOiJuIjt9'),
(10, 1, 1, 'type', 'Type', '', 'relationship', '', '0', 0, 0, 6, 128, 'y', 'ltr', 'n', 'n', 'xhtml', 'n', 8, 'any', 'YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiI0Ijt9czo3OiJleHBpcmVkIjtpOjA7czo2OiJmdXR1cmUiO2k6MDtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MDp7fXM6NToibGltaXQiO3M6MzoiMTAwIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7aTowO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(11, 1, 1, 'habitat', 'Habitat', '', 'relationship', '', '0', 0, 0, 6, 128, 'y', 'ltr', 'n', 'n', 'xhtml', 'n', 9, 'any', 'YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiIzIjt9czo3OiJleHBpcmVkIjtpOjA7czo2OiJmdXR1cmUiO2k6MDtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MDp7fXM6NToibGltaXQiO3M6MzoiMTAwIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7czoxOiIxIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(15, 1, 4, 'parent_type', 'Parent Type', '', 'relationship', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 1, 'any', 'YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiIyIjt9czo3OiJleHBpcmVkIjtpOjA7czo2OiJmdXR1cmUiO2k6MDtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MDp7fXM6NToibGltaXQiO3M6MzoiMTAwIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7aTowO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(12, 1, 1, 'media', 'Media', '', 'grid', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 10, 'any', 'YTo4OntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ=='),
(13, 1, 2, 'type_image', 'Image', '', 'file', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 2, 'any', 'YToxMDp7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjU6ImltYWdlIjtzOjE5OiJhbGxvd2VkX2RpcmVjdG9yaWVzIjtzOjM6ImFsbCI7czoxMzoic2hvd19leGlzdGluZyI7czoxOiJuIjtzOjEyOiJudW1fZXhpc3RpbmciO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(14, 1, 2, 'type_short_description', 'Short Description', '', 'textarea', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 3, 'any', 'YTo2OntzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30='),
(16, 1, 2, 'subtypes', 'Subtypes', '', 'relationship', '', '0', 0, 0, 6, 128, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 4, 'any', 'YToxNjp7czo4OiJjaGFubmVscyI7YToxOntpOjA7czoxOiI0Ijt9czo3OiJleHBpcmVkIjtpOjA7czo2OiJmdXR1cmUiO2k6MDtzOjEwOiJjYXRlZ29yaWVzIjthOjA6e31zOjc6ImF1dGhvcnMiO2E6MDp7fXM6ODoic3RhdHVzZXMiO2E6MDp7fXM6NToibGltaXQiO3M6MzoiMTAwIjtzOjExOiJvcmRlcl9maWVsZCI7czo1OiJ0aXRsZSI7czo5OiJvcmRlcl9kaXIiO3M6MzoiYXNjIjtzOjE0OiJhbGxvd19tdWx0aXBsZSI7czoxOiIxIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30=');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_form_settings`
--

DROP TABLE IF EXISTS `exp_channel_form_settings`;
CREATE TABLE IF NOT EXISTS `exp_channel_form_settings` (
  `channel_form_settings_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `default_status` varchar(50) NOT NULL DEFAULT 'open',
  `require_captcha` char(1) NOT NULL DEFAULT 'n',
  `allow_guest_posts` char(1) NOT NULL DEFAULT 'n',
  `default_author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_form_settings_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_grid_field_12`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_12`;
CREATE TABLE IF NOT EXISTS `exp_channel_grid_field_12` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_5` text,
  `col_id_6` text,
  `col_id_7` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_channel_grid_field_12`
--

INSERT INTO `exp_channel_grid_field_12` (`row_id`, `entry_id`, `row_order`, `col_id_5`, `col_id_6`, `col_id_7`) VALUES
(1, 1, 0, '{filedir_1}wild-turkey.jpg', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_grid_field_2`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_2`;
CREATE TABLE IF NOT EXISTS `exp_channel_grid_field_2` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `col_id_1` text,
  `col_id_2` text,
  `col_id_3` text,
  `col_id_4` text,
  `col_id_8` text,
  `col_id_9` text,
  `col_id_10` text,
  `col_id_11` text,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `exp_channel_grid_field_2`
--

INSERT INTO `exp_channel_grid_field_2` (`row_id`, `entry_id`, `row_order`, `col_id_1`, `col_id_2`, `col_id_3`, `col_id_4`, `col_id_8`, `col_id_9`, `col_id_10`, `col_id_11`) VALUES
(1, 1, 0, 'Native', 'Males: Up to 3 feet tall, 4 feet long and up to 25 pounds\n\nFemales: Grow to about half the height and weight of males', 'Forests & Uplands; Halloumi croque monsieur cheese and biscuits. Brie cheddar macaroni cheese boursin macaroni cheese taleggio cheddar chalk and cheese. Port-salut melted cheese say cheese pecorino babybel pecorino roquefort cheesy grin. Say cheese jarlsberg chalk and cheese.', 'Halloumi croque monsieur cheese and biscuits. Brie cheddar macaroni cheese boursin macaroni cheese taleggio cheddar chalk and cheese. Port-salut melted cheese say cheese pecorino babybel pecorino roquefort cheesy grin. Say cheese jarlsberg chalk and cheese.', 'food and stuff', 'a good long while', 'pretty good', 'totes'),
(2, 2, 0, 'Invasive', 'Huge', 'Farms', 'All over', '', '', '', ''),
(3, 27, 0, 'Invasive', 'HUGE', 'Way down yonder on the Chatahoochee', 'Mid-atlantic', 'Atkins', '6-15 years', 'G', 'Mostly');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_member_groups`
--

DROP TABLE IF EXISTS `exp_channel_member_groups`;
CREATE TABLE IF NOT EXISTS `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_titles`
--

DROP TABLE IF EXISTS `exp_channel_titles`;
CREATE TABLE IF NOT EXISTS `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `url_title` varchar(75) CHARACTER SET utf8 NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 NOT NULL,
  `versioning_enabled` char(1) CHARACTER SET utf8 NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) CHARACTER SET utf8 NOT NULL DEFAULT 'y',
  `sticky` varchar(1) CHARACTER SET utf8 NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) CHARACTER SET utf8 NOT NULL,
  `month` char(2) CHARACTER SET utf8 NOT NULL,
  `day` char(3) CHARACTER SET utf8 NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=31 ;

--
-- Dumping data for table `exp_channel_titles`
--

INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES
(1, 1, 1, 1, NULL, '::1', 'Wild Turkey', 'wild-turkey', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1420664880, '2015', '01', '07', 0, 0, 20150112203012, 0, 0),
(2, 1, 1, 1, NULL, '::1', 'Lizard', 'lizard', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1420665540, '2015', '01', '07', 0, 0, 20150107212135, 0, 0),
(3, 1, 2, 1, NULL, '::1', 'Algae', 'algae', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1420744860, '2015', '01', '08', 0, 0, 20150112181849, 0, 0),
(4, 1, 2, 1, NULL, '::1', 'Bay Grasses (SAV)', 'bay-grasses-sav', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1420744980, '2015', '01', '08', 0, 0, 20150112181941, 0, 0),
(5, 1, 2, 1, NULL, '::1', 'Birds', 'birds', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1420745040, '2015', '01', '08', 0, 0, 20150112201355, 0, 0),
(6, 1, 2, 1, NULL, '::1', 'Fish', 'fish', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1420745040, '2015', '01', '08', 0, 0, 20150204171814, 0, 0),
(7, 1, 2, 1, NULL, '::1', 'Insects', 'insects', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1420745040, '2015', '01', '08', 0, 0, 20150112182037, 0, 0),
(8, 1, 2, 1, NULL, '::1', 'Invertebrates', 'invertebrates', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1420745100, '2015', '01', '08', 0, 0, 20150112182053, 0, 0),
(9, 1, 2, 1, NULL, '::1', 'Mammals', 'mammals', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1420745220, '2015', '01', '08', 0, 0, 20150112182119, 0, 0),
(10, 1, 2, 1, NULL, '::1', 'Plants & Trees', 'plants-trees', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1420745280, '2015', '01', '08', 0, 0, 20150112182144, 0, 0),
(11, 1, 2, 1, NULL, '::1', 'Reptiles & Amphibians', 'reptiles-amphibians', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1420745340, '2015', '01', '08', 0, 0, 20150112182158, 0, 0),
(12, 1, 3, 1, NULL, '::1', 'Aquatic Reefs & Pilings', 'aquatic-reefs-pilings', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1420745400, '2015', '01', '08', 0, 0, 20150108193103, 0, 0),
(13, 1, 3, 1, NULL, '::1', 'Forests & Uplands', 'forests-uplands', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1420745460, '2015', '01', '08', 0, 0, 20150108193201, 0, 0),
(14, 1, 3, 1, NULL, '::1', 'Marshes & Wetlands', 'marshes-wetlands', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1420745520, '2015', '01', '08', 0, 0, 20150108193317, 0, 0),
(15, 1, 1, 1, NULL, '::1', 'American Black Duck', 'american-black-duck', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1421092320, '2015', '01', '12', 0, 0, 20150112202948, 0, 0),
(16, 1, 1, 1, NULL, '::1', 'American Coot', 'american-coot', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1421092380, '2015', '01', '12', 0, 0, 20150112195430, 0, 0),
(17, 1, 1, 1, NULL, '::1', 'Bald Eagle', 'bald-eagle', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1421092440, '2015', '01', '12', 0, 0, 20150112202923, 0, 0),
(18, 1, 4, 1, NULL, '::1', 'Waterfowl', 'waterfowl', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1421093220, '2015', '01', '12', 0, 0, 20150112200738, 0, 0),
(19, 1, 4, 1, NULL, '::1', 'Other', 'other-bird', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1421093220, '2015', '01', '12', 0, 0, 20150112200806, 0, 0),
(20, 1, 4, 1, NULL, '::1', 'Sea & Shorebirds', 'sea-shorebirds', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1421093280, '2015', '01', '12', 0, 0, 20150204175034, 0, 0),
(21, 1, 4, 1, NULL, '::1', 'Wading', 'wading', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1421093280, '2015', '01', '12', 0, 0, 20150112200832, 0, 0),
(22, 1, 4, 1, NULL, '::1', 'Raptors', 'raptors', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1421093280, '2015', '01', '12', 0, 0, 20150112200845, 0, 0),
(23, 1, 3, 1, NULL, '::1', 'Beaches & Tidal Flats', 'beaches-tidal-flats', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1421773260, '2015', '01', '20', 0, 0, 20150120170147, 0, 0),
(24, 1, 3, 1, NULL, '::1', 'Open Waters', 'open-waters', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1421773260, '2015', '01', '20', 0, 0, 20150120170205, 0, 0),
(25, 1, 3, 1, NULL, '::1', 'Shallow Waters', 'shallow-waters', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1421773320, '2015', '01', '20', 0, 0, 20150120170211, 0, 0),
(26, 1, 3, 1, NULL, '::1', 'Streams & Rivers', 'streams-rivers', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1421773320, '2015', '01', '20', 0, 0, 20150120170221, 0, 0),
(27, 1, 1, 1, NULL, '::1', 'Rappahannock Greeneye', 'rappahannock-greeneye', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1423068780, '2015', '02', '04', 0, 0, 20150204171043, 0, 0),
(28, 1, 4, 1, NULL, '::1', 'Freshwater Fish', 'freshwater-fish', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1423069740, '2015', '02', '04', 0, 0, 20150204170957, 0, 0),
(29, 1, 4, 1, NULL, '::1', 'Estuarine Fish', 'estuarine-fish', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1423069740, '2015', '02', '04', 0, 0, 20150204171006, 0, 0),
(30, 1, 4, 1, NULL, '::1', 'Migratory Fish', 'migratory-fish', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1423069800, '2015', '02', '04', 0, 0, 20150204171018, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels`
--

DROP TABLE IF EXISTS `exp_channels`;
CREATE TABLE IF NOT EXISTS `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(255) DEFAULT NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) DEFAULT NULL,
  `status_group` int(4) unsigned DEFAULT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned DEFAULT NULL,
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) DEFAULT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) NOT NULL DEFAULT 'n',
  `channel_notify` char(1) NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) DEFAULT NULL,
  `comment_url` varchar(80) DEFAULT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) DEFAULT NULL,
  `show_button_cluster` char(1) NOT NULL DEFAULT 'y',
  `rss_url` varchar(80) DEFAULT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) DEFAULT NULL,
  `url_title_prefix` varchar(80) DEFAULT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_channels`
--

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `status_group`, `deft_status`, `field_group`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_use_captcha`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `show_button_cluster`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `url_title_prefix`, `live_look_template`) VALUES
(1, 1, 'field_guide_entries', 'Field Guide Entries', 'http://localhost/entry', '', 'en', 6, 0, 1423068780, 0, '', 1, 'open', 1, 1, '', 'y', 'y', NULL, 'all', 'y', 'n', 'n', '', '', 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', 'y', '', 'n', 10, '', '', 0),
(2, 1, 'field_guide_types', 'Field Guide Types', 'http://localhost/index.php', NULL, 'en', 9, 0, 1420745340, 0, '', NULL, 'open', 2, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, 'y', NULL, 'n', 10, '', '', 0),
(3, 1, 'field_guide_habitats', 'Field Guide Habitats', 'http://localhost/index.php', NULL, 'en', 7, 0, 1421773320, 0, '', NULL, 'open', 3, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, 'y', NULL, 'n', 10, '', '', 0),
(4, 1, 'field_guide_subtype', 'Field Guide Subtype', 'http://localhost/', '', 'en', 8, 0, 1423069800, 0, '', NULL, 'open', 4, NULL, '', 'y', 'y', NULL, 'all', 'y', 'n', 'n', '', '', 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', 'y', '', 'n', 10, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_comment_subscriptions`
--

DROP TABLE IF EXISTS `exp_comment_subscriptions`;
CREATE TABLE IF NOT EXISTS `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(75) DEFAULT NULL,
  `subscription_date` varchar(10) DEFAULT NULL,
  `notification_sent` char(1) DEFAULT 'n',
  `hash` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_comments`
--

DROP TABLE IF EXISTS `exp_comments`;
CREATE TABLE IF NOT EXISTS `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `channel_id` int(4) unsigned DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT '0',
  `status` char(1) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `url` varchar(75) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`),
  KEY `comment_date_idx` (`comment_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_content_types`
--

DROP TABLE IF EXISTS `exp_content_types`;
CREATE TABLE IF NOT EXISTS `exp_content_types` (
  `content_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_type_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_content_types`
--

INSERT INTO `exp_content_types` (`content_type_id`, `name`) VALUES
(1, 'grid'),
(2, 'channel');

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_log`
--

DROP TABLE IF EXISTS `exp_cp_log`;
CREATE TABLE IF NOT EXISTS `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `exp_cp_log`
--

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES
(1, 1, 1, 'admin', '::1', 1420663271, 'Logged in'),
(2, 1, 1, 'admin', '::1', 1420663294, 'Field Group Created:&nbsp;Field Guide Entry'),
(3, 1, 1, 'admin', '::1', 1420664897, 'Channel Created:&nbsp;&nbsp;Field Guide Entries'),
(4, 1, 1, 'admin', '::1', 1420741416, 'Logged in'),
(5, 1, 1, 'admin', '::1', 1420744292, 'Field Group Created:&nbsp;Field Guide Category'),
(6, 1, 1, 'admin', '::1', 1420744374, 'Channel Created:&nbsp;&nbsp;Field Guide Types'),
(7, 1, 1, 'admin', '::1', 1420744695, 'Field Group Created:&nbsp;Field Guide Habitat'),
(8, 1, 1, 'admin', '::1', 1420744807, 'Channel Created:&nbsp;&nbsp;Field Guide Habitats'),
(9, 1, 1, 'admin', '::1', 1420745701, 'Category Group Created:&nbsp;&nbsp;Birds'),
(10, 1, 1, 'admin', '::1', 1420749176, 'Logged in'),
(11, 1, 1, 'admin', '::1', 1420813623, 'Logged in'),
(12, 1, 1, 'admin', '::1', 1420818683, 'Logged in'),
(13, 1, 1, 'admin', '::1', 1420833073, 'Logged in'),
(14, 1, 1, 'admin', '::1', 1421071572, 'Logged in'),
(15, 1, 1, 'admin', '::1', 1421078869, 'Logged in'),
(16, 1, 1, 'admin', '::1', 1421086200, 'Logged in'),
(17, 1, 1, 'admin', '::1', 1421086222, 'Logged in'),
(18, 1, 1, 'admin', '::1', 1421091204, 'Category Group Created:&nbsp;&nbsp;Test Category Group'),
(19, 1, 1, 'admin', '::1', 1421092999, 'Channel Created:&nbsp;&nbsp;Bird Subtype'),
(20, 1, 1, 'admin', '::1', 1421093013, 'Field Group Created:&nbsp;Bird Subtype'),
(21, 1, 1, 'admin', '::1', 1421158522, 'Logged in'),
(22, 1, 1, 'admin', '::1', 1421173065, 'Logged in'),
(23, 1, 1, 'admin', '::1', 1421176219, 'Logged in'),
(24, 1, 1, 'admin', '::1', 1421335329, 'Logged in'),
(25, 1, 1, 'admin', '::1', 1421768711, 'Logged in'),
(26, 1, 1, 'admin', '::1', 1421779176, 'Logged in'),
(27, 1, 1, 'admin', '::1', 1421780879, 'Logged in'),
(28, 1, 1, 'admin', '::1', 1421785744, 'Logged in'),
(29, 1, 1, 'admin', '::1', 1421788900, 'Logged in'),
(30, 1, 1, 'admin', '::1', 1421861104, 'Logged in'),
(31, 1, 1, 'admin', '::1', 1422645682, 'Logged in'),
(32, 1, 1, 'admin', '::1', 1422889524, 'Logged in'),
(33, 1, 1, 'admin', '::1', 1422893545, 'Logged in'),
(34, 1, 1, 'admin', '::1', 1422893962, 'Logged in'),
(35, 1, 1, 'admin', '::1', 1422979617, 'Logged in'),
(36, 1, 1, 'admin', '::1', 1422980667, 'Logged in'),
(37, 1, 1, 'admin', '::1', 1422983727, 'Logged in'),
(38, 1, 1, 'admin', '::1', 1423068794, 'Logged in'),
(39, 1, 1, 'admin', '::1', 1423147993, 'Logged in'),
(40, 1, 1, 'admin', '::1', 1423497036, 'Logged in'),
(41, 1, 1, 'admin', '::1', 1423507152, 'Logged in'),
(42, 1, 1, 'admin', '::1', 1423511797, 'Logged in'),
(43, 1, 1, 'admin', '::1', 1423513158, 'Logged in'),
(44, 1, 1, 'admin', '::1', 1423578181, 'Logged in'),
(45, 1, 1, 'admin', '::1', 1423589132, 'Logged in'),
(46, 1, 1, 'admin', '::1', 1423591727, 'Logged in'),
(47, 1, 1, 'admin', '::1', 1423593803, 'Logged in');

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_search_index`
--

DROP TABLE IF EXISTS `exp_cp_search_index`;
CREATE TABLE IF NOT EXISTS `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `keywords` text,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_developer_log`
--

DROP TABLE IF EXISTS `exp_developer_log`;
CREATE TABLE IF NOT EXISTS `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) NOT NULL DEFAULT 'n',
  `description` text,
  `function` varchar(100) DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `deprecated_since` varchar(10) DEFAULT NULL,
  `use_instead` varchar(100) DEFAULT NULL,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `template_name` varchar(100) DEFAULT NULL,
  `template_group` varchar(100) DEFAULT NULL,
  `addon_module` varchar(100) DEFAULT NULL,
  `addon_method` varchar(100) DEFAULT NULL,
  `snippets` text,
  `hash` char(32) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache`
--

DROP TABLE IF EXISTS `exp_email_cache`;
CREATE TABLE IF NOT EXISTS `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(75) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL DEFAULT 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `priority` char(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_mg`
--

DROP TABLE IF EXISTS `exp_email_cache_mg`;
CREATE TABLE IF NOT EXISTS `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_ml`
--

DROP TABLE IF EXISTS `exp_email_cache_ml`;
CREATE TABLE IF NOT EXISTS `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_console_cache`
--

DROP TABLE IF EXISTS `exp_email_console_cache`;
CREATE TABLE IF NOT EXISTS `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `recipient` varchar(75) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_versioning`
--

DROP TABLE IF EXISTS `exp_entry_versioning`;
CREATE TABLE IF NOT EXISTS `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_extensions`
--

DROP TABLE IF EXISTS `exp_extensions`;
CREATE TABLE IF NOT EXISTS `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_extensions`
--

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`) VALUES
(1, 'Rte_ext', 'myaccount_nav_setup', 'myaccount_nav_setup', '', 10, '1.0.1', 'y'),
(2, 'Rte_ext', 'cp_menu_array', 'cp_menu_array', '', 10, '1.0.1', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_formatting`
--

DROP TABLE IF EXISTS `exp_field_formatting`;
CREATE TABLE IF NOT EXISTS `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `exp_field_formatting`
--

INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES
(1, 1, 'none'),
(2, 1, 'br'),
(3, 1, 'markdown'),
(4, 1, 'xhtml'),
(5, 2, 'none'),
(6, 2, 'br'),
(7, 2, 'markdown'),
(8, 2, 'xhtml'),
(9, 3, 'none'),
(10, 3, 'br'),
(11, 3, 'markdown'),
(12, 3, 'xhtml'),
(13, 4, 'none'),
(14, 4, 'br'),
(15, 4, 'markdown'),
(16, 4, 'xhtml'),
(17, 5, 'none'),
(18, 5, 'br'),
(19, 5, 'markdown'),
(20, 5, 'xhtml'),
(21, 6, 'none'),
(22, 6, 'br'),
(23, 6, 'markdown'),
(24, 6, 'xhtml'),
(25, 7, 'none'),
(26, 7, 'br'),
(27, 7, 'markdown'),
(28, 7, 'xhtml'),
(29, 8, 'none'),
(30, 8, 'br'),
(31, 8, 'markdown'),
(32, 8, 'xhtml'),
(33, 9, 'none'),
(34, 9, 'br'),
(35, 9, 'markdown'),
(36, 9, 'xhtml'),
(37, 10, 'none'),
(38, 10, 'br'),
(39, 10, 'markdown'),
(40, 10, 'xhtml'),
(41, 11, 'none'),
(42, 11, 'br'),
(43, 11, 'markdown'),
(44, 11, 'xhtml'),
(45, 12, 'none'),
(46, 12, 'br'),
(47, 12, 'markdown'),
(48, 12, 'xhtml'),
(49, 13, 'none'),
(50, 13, 'br'),
(51, 13, 'markdown'),
(52, 13, 'xhtml'),
(53, 14, 'none'),
(54, 14, 'br'),
(55, 14, 'markdown'),
(56, 14, 'xhtml'),
(57, 15, 'none'),
(58, 15, 'br'),
(59, 15, 'markdown'),
(60, 15, 'xhtml'),
(61, 16, 'none'),
(62, 16, 'br'),
(63, 16, 'markdown'),
(64, 16, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_groups`
--

DROP TABLE IF EXISTS `exp_field_groups`;
CREATE TABLE IF NOT EXISTS `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `exp_field_groups`
--

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'Field Guide Entry'),
(2, 1, 'Field Guide Type'),
(3, 1, 'Field Guide Habitat'),
(4, 1, 'Field Guide Subtype');

-- --------------------------------------------------------

--
-- Table structure for table `exp_fieldtypes`
--

DROP TABLE IF EXISTS `exp_fieldtypes`;
CREATE TABLE IF NOT EXISTS `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `exp_fieldtypes`
--

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES
(1, 'select', '1.0', 'YTowOnt9', 'n'),
(2, 'text', '1.0', 'YTowOnt9', 'n'),
(3, 'textarea', '1.0', 'YTowOnt9', 'n'),
(4, 'date', '1.0', 'YTowOnt9', 'n'),
(5, 'file', '1.0', 'YTowOnt9', 'n'),
(6, 'grid', '1.0', 'YTowOnt9', 'n'),
(7, 'multi_select', '1.0', 'YTowOnt9', 'n'),
(8, 'checkboxes', '1.0', 'YTowOnt9', 'n'),
(9, 'radio', '1.0', 'YTowOnt9', 'n'),
(10, 'relationship', '1.0', 'YTowOnt9', 'n'),
(11, 'rte', '1.0', 'YTowOnt9', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_categories`
--

DROP TABLE IF EXISTS `exp_file_categories`;
CREATE TABLE IF NOT EXISTS `exp_file_categories` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) DEFAULT 'n',
  KEY `file_id` (`file_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_dimensions`
--

DROP TABLE IF EXISTS `exp_file_dimensions`;
CREATE TABLE IF NOT EXISTS `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT '',
  `short_name` varchar(255) DEFAULT '',
  `resize_type` varchar(50) DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_watermarks`
--

DROP TABLE IF EXISTS `exp_file_watermarks`;
CREATE TABLE IF NOT EXISTS `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) DEFAULT NULL,
  `wm_type` varchar(10) DEFAULT 'text',
  `wm_image_path` varchar(100) DEFAULT NULL,
  `wm_test_image_path` varchar(100) DEFAULT NULL,
  `wm_use_font` char(1) DEFAULT 'y',
  `wm_font` varchar(30) DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) DEFAULT 'top',
  `wm_hor_alignment` varchar(10) DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) DEFAULT NULL,
  `wm_use_drop_shadow` char(1) DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_files`
--

DROP TABLE IF EXISTS `exp_files`;
CREATE TABLE IF NOT EXISTS `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `rel_path` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text,
  `credit` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_files`
--

INSERT INTO `exp_files` (`file_id`, `site_id`, `title`, `upload_location_id`, `rel_path`, `mime_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`) VALUES
(1, 1, 'wild-turkey.jpg', 1, 'C:/wamp/www/images/Entry Images/wild-turkey.jpg', 'image/jpeg', 'wild-turkey.jpg', 160750, NULL, NULL, NULL, 1, 1420813911, 1, 1420813970, '553 829');

-- --------------------------------------------------------

--
-- Table structure for table `exp_global_variables`
--

DROP TABLE IF EXISTS `exp_global_variables`;
CREATE TABLE IF NOT EXISTS `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_grid_columns`
--

DROP TABLE IF EXISTS `exp_grid_columns`;
CREATE TABLE IF NOT EXISTS `exp_grid_columns` (
  `col_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `col_order` int(3) unsigned DEFAULT NULL,
  `col_type` varchar(50) DEFAULT NULL,
  `col_label` varchar(50) DEFAULT NULL,
  `col_name` varchar(32) DEFAULT NULL,
  `col_instructions` text,
  `col_required` char(1) DEFAULT NULL,
  `col_search` char(1) DEFAULT NULL,
  `col_width` int(3) unsigned DEFAULT NULL,
  `col_settings` text,
  PRIMARY KEY (`col_id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `exp_grid_columns`
--

INSERT INTO `exp_grid_columns` (`col_id`, `field_id`, `content_type`, `col_order`, `col_type`, `col_label`, `col_name`, `col_instructions`, `col_required`, `col_search`, `col_width`, `col_settings`) VALUES
(1, 2, 'channel', 0, 'text', 'Native or Invasive?', 'native_or_invasive', '', 'n', 'y', 0, '{"field_fmt":"none","field_content_type":"all","field_text_direction":"ltr","field_maxl":"256","field_required":"n"}'),
(2, 2, 'channel', 1, 'textarea', 'Size', 'size', '', 'n', 'y', 0, '{"field_fmt":"none","field_text_direction":"ltr","field_ta_rows":"6","show_formatting_buttons":"1","field_required":"n"}'),
(3, 2, 'channel', 2, 'textarea', 'Habitat', 'habitat', '', 'n', 'y', 0, '{"field_fmt":"none","field_text_direction":"ltr","field_ta_rows":"6","field_required":"n"}'),
(4, 2, 'channel', 3, 'textarea', 'Range', 'range', '', 'n', 'y', 0, '{"field_fmt":"none","field_text_direction":"ltr","field_ta_rows":"6","field_required":"n"}'),
(5, 12, 'channel', 0, 'file', 'Image', 'image', '', 'n', 'n', 0, '{"field_content_type":"image","allowed_directories":"1","show_existing":"y","num_existing":"50","field_required":"n"}'),
(6, 12, 'channel', 1, 'file', 'Audio', 'audio', '', 'n', 'n', 0, '{"field_content_type":"all","allowed_directories":"all","show_existing":"y","num_existing":"50","field_required":"n"}'),
(7, 12, 'channel', 2, 'file', 'Video', 'video', '', 'n', 'n', 0, '{"field_content_type":"all","allowed_directories":"all","show_existing":"y","num_existing":"50","field_required":"n"}'),
(8, 2, 'channel', 4, 'textarea', 'Diet', 'diet', '', 'n', 'y', 0, '{"field_fmt":"none","field_text_direction":"ltr","field_ta_rows":"6","field_required":"n"}'),
(9, 2, 'channel', 5, 'text', 'Lifespan', 'lifespan', '', 'n', 'y', 0, '{"field_fmt":"none","field_content_type":"all","field_text_direction":"ltr","field_maxl":"256","field_required":"n"}'),
(10, 2, 'channel', 6, 'text', 'Status', 'status', '', 'n', 'y', 0, '{"field_fmt":"none","field_content_type":"all","field_text_direction":"ltr","field_maxl":"256","field_required":"n"}'),
(11, 2, 'channel', 7, 'text', 'Stable?', 'stable', '', 'n', 'n', 0, '{"field_fmt":"none","field_content_type":"all","field_text_direction":"ltr","field_maxl":"256","field_required":"n"}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_html_buttons`
--

DROP TABLE IF EXISTS `exp_html_buttons`;
CREATE TABLE IF NOT EXISTS `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  `classname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `exp_html_buttons`
--

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES
(1, 1, 0, 'b', '<strong>', '</strong>', 'b', 1, '1', 'btn_b'),
(2, 1, 0, 'i', '<em>', '</em>', 'i', 2, '1', 'btn_i'),
(3, 1, 0, 'blockquote', '<blockquote>', '</blockquote>', 'q', 3, '1', 'btn_blockquote'),
(4, 1, 0, 'a', '<a href="[![Link:!:http://]!]"(!( title="[![Title]!]")!)>', '</a>', 'a', 4, '1', 'btn_a'),
(5, 1, 0, 'img', '<img src="[![Link:!:http://]!]" alt="[![Alternative text]!]" />', '', '', 5, '1', 'btn_img'),
(27, 1, 1, 'ol', '<ol>', '</ol>', 'o', 6, '1', 'btn_ol'),
(26, 1, 1, 'img', '<img src="[![Link:!:http://]!]" alt="[![Alternative text]!]" />', '', '', 5, '1', 'btn_img'),
(25, 1, 1, 'a', '<a href="[![Link:!:http://]!]"(!( title="[![Title]!]")!)>', '</a>', 'a', 4, '1', 'btn_a'),
(22, 1, 1, 'b', '<strong>', '</strong>', 'b', 1, '1', 'btn_b'),
(23, 1, 1, 'i', '<em>', '</em>', 'i', 2, '1', 'btn_i'),
(24, 1, 1, 'blockquote', '<blockquote>', '</blockquote>', 'q', 3, '1', 'btn_blockquote'),
(21, 1, 1, 'ul', '<ul>', '</ul>', 'u', 0, '1', 'btn_ul');

-- --------------------------------------------------------

--
-- Table structure for table `exp_layout_publish`
--

DROP TABLE IF EXISTS `exp_layout_publish`;
CREATE TABLE IF NOT EXISTS `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_group` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `field_layout` text,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_bulletin_board`
--

DROP TABLE IF EXISTS `exp_member_bulletin_board`;
CREATE TABLE IF NOT EXISTS `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_data`
--

DROP TABLE IF EXISTS `exp_member_data`;
CREATE TABLE IF NOT EXISTS `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_data`
--

INSERT INTO `exp_member_data` (`member_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_fields`
--

DROP TABLE IF EXISTS `exp_member_fields`;
CREATE TABLE IF NOT EXISTS `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`m_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_groups`
--

DROP TABLE IF EXISTS `exp_member_groups`;
CREATE TABLE IF NOT EXISTS `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) NOT NULL DEFAULT 'y',
  `can_access_content` char(1) NOT NULL DEFAULT 'n',
  `can_access_publish` char(1) NOT NULL DEFAULT 'n',
  `can_access_edit` char(1) NOT NULL DEFAULT 'n',
  `can_access_files` char(1) NOT NULL DEFAULT 'n',
  `can_access_fieldtypes` char(1) NOT NULL DEFAULT 'n',
  `can_access_design` char(1) NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) NOT NULL DEFAULT 'n',
  `can_access_modules` char(1) NOT NULL DEFAULT 'n',
  `can_access_extensions` char(1) NOT NULL DEFAULT 'n',
  `can_access_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_access_plugins` char(1) NOT NULL DEFAULT 'n',
  `can_access_members` char(1) NOT NULL DEFAULT 'n',
  `can_access_admin` char(1) NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_content_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_tools` char(1) NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) NOT NULL DEFAULT 'n',
  `can_access_data` char(1) NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) NOT NULL DEFAULT 'n',
  `can_admin_upload_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) NOT NULL DEFAULT 'n',
  `can_admin_members` char(1) NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) NOT NULL DEFAULT 'n',
  `can_admin_modules` char(1) NOT NULL DEFAULT 'n',
  `can_admin_templates` char(1) NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) NOT NULL DEFAULT 'n',
  `can_send_email` char(1) NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) NOT NULL DEFAULT 'n',
  `can_email_mailinglist` char(1) NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) DEFAULT NULL,
  `can_post_comments` char(1) NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `can_search` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `include_in_mailinglists` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_groups`
--

INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_content`, `can_access_publish`, `can_access_edit`, `can_access_files`, `can_access_fieldtypes`, `can_access_design`, `can_access_addons`, `can_access_modules`, `can_access_extensions`, `can_access_accessories`, `can_access_plugins`, `can_access_members`, `can_access_admin`, `can_access_sys_prefs`, `can_access_content_prefs`, `can_access_tools`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_upload_prefs`, `can_admin_design`, `can_admin_members`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_modules`, `can_admin_templates`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_email`, `can_send_cached_email`, `can_email_member_groups`, `can_email_mailinglist`, `can_email_from_profile`, `can_view_profiles`, `can_edit_html_buttons`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `include_in_mailinglists`) VALUES
(1, 1, 'Super Admins', '', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', '', 'y', 'y', 'y', 0, 'y', 20, 60, 'y', 'y', 'y', 'y', 'y'),
(2, 1, 'Banned', '', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '', 'n', 'n', 'n', 60, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(3, 1, 'Guests', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(4, 1, 'Pending', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n'),
(5, 1, 'Members', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'y', 'n', '', 'y', 'n', 'y', 10, 'y', 20, 60, 'y', 'n', 'n', 'y', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_homepage`
--

DROP TABLE IF EXISTS `exp_member_homepage`;
CREATE TABLE IF NOT EXISTS `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_member_homepage`
--

INSERT INTO `exp_member_homepage` (`member_id`, `recent_entries`, `recent_entries_order`, `recent_comments`, `recent_comments_order`, `recent_members`, `recent_members_order`, `site_statistics`, `site_statistics_order`, `member_search_form`, `member_search_form_order`, `notepad`, `notepad_order`, `bulletin_board`, `bulletin_board_order`, `pmachine_news_feed`, `pmachine_news_feed_order`) VALUES
(1, 'l', 1, 'l', 2, 'n', 0, 'r', 1, 'n', 0, 'r', 2, 'r', 0, 'l', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_search`
--

DROP TABLE IF EXISTS `exp_member_search`;
CREATE TABLE IF NOT EXISTS `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_members`
--

DROP TABLE IF EXISTS `exp_members`;
CREATE TABLE IF NOT EXISTS `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL DEFAULT '',
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) DEFAULT NULL,
  `authcode` varchar(10) DEFAULT NULL,
  `email` varchar(75) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `occupation` varchar(80) DEFAULT NULL,
  `interests` varchar(120) DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) DEFAULT NULL,
  `yahoo_im` varchar(50) DEFAULT NULL,
  `msn_im` varchar(50) DEFAULT NULL,
  `icq` varchar(50) DEFAULT NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `time_format` char(2) NOT NULL DEFAULT '12',
  `date_format` varchar(8) NOT NULL DEFAULT '%n/%j/%y',
  `include_seconds` char(1) NOT NULL DEFAULT 'n',
  `cp_theme` varchar(32) DEFAULT NULL,
  `profile_theme` varchar(32) DEFAULT NULL,
  `forum_theme` varchar(32) DEFAULT NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL DEFAULT '28',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `quick_links` text,
  `quick_tabs` text,
  `show_sidebar` char(1) NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `rte_enabled` char(1) NOT NULL DEFAULT 'y',
  `rte_toolset_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_members`
--

INSERT INTO `exp_members` (`member_id`, `group_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `authcode`, `email`, `url`, `location`, `occupation`, `interests`, `bday_d`, `bday_m`, `bday_y`, `aol_im`, `yahoo_im`, `msn_im`, `icq`, `bio`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `time_format`, `date_format`, `include_seconds`, `cp_theme`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `rte_enabled`, `rte_toolset_id`) VALUES
(1, 1, 'admin', 'Bill', '03a9fb9f9666d48c6db05a8a95da08078d84184f0b46bb0706b8dd6d2874f57caab3e91aa1f8ca4a44706ff7e723e75038e2948246566e10965eb6330339ab37', 'inI=&:q}W<ZkXoue"[&vrKDvT?Pi3(?c=I.P\\)KfmI;s=lnf^q+rxAj9//{U=1{:k5Z~/xeun(DL9#zr6XEQF''@<IG8MFBrU^t]RZKS[p|(oC{\\%\\Xvq?J{vUzkG3~J}', 'de333257859649c445832d6c04e4c5f85b49dbfd', '7445bd08ccfb790795e6e35b070dcab6ccc7c40f', NULL, 'wwhorton@ca.umces.edu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '::1', 1420663238, 1423581320, 1423598505, 30, 0, 0, 0, 1423069818, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'America/New_York', '12', '%n/%j/%y', 'n', NULL, NULL, NULL, NULL, '28', NULL, '18', '', NULL, 'n', 0, 'y', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_attachments`
--

DROP TABLE IF EXISTS `exp_message_attachments`;
CREATE TABLE IF NOT EXISTS `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(150) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_copies`
--

DROP TABLE IF EXISTS `exp_message_copies`;
CREATE TABLE IF NOT EXISTS `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_data`
--

DROP TABLE IF EXISTS `exp_message_data`;
CREATE TABLE IF NOT EXISTS `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_folders`
--

DROP TABLE IF EXISTS `exp_message_folders`;
CREATE TABLE IF NOT EXISTS `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_message_folders`
--

INSERT INTO `exp_message_folders` (`member_id`, `folder1_name`, `folder2_name`, `folder3_name`, `folder4_name`, `folder5_name`, `folder6_name`, `folder7_name`, `folder8_name`, `folder9_name`, `folder10_name`) VALUES
(1, 'InBox', 'Sent', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_listed`
--

DROP TABLE IF EXISTS `exp_message_listed`;
CREATE TABLE IF NOT EXISTS `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_module_member_groups`
--

DROP TABLE IF EXISTS `exp_module_member_groups`;
CREATE TABLE IF NOT EXISTS `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_modules`
--

DROP TABLE IF EXISTS `exp_modules`;
CREATE TABLE IF NOT EXISTS `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `exp_modules`
--

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES
(1, 'Comment', '2.3.2', 'y', 'n'),
(2, 'Emoticon', '2.0', 'n', 'n'),
(3, 'Jquery', '1.0', 'n', 'n'),
(4, 'Rss', '2.0', 'n', 'n'),
(5, 'Search', '2.2.2', 'n', 'n'),
(6, 'Channel', '2.0.1', 'n', 'n'),
(7, 'Stats', '2.0', 'n', 'n'),
(8, 'Rte', '1.0.1', 'y', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_online_users`
--

DROP TABLE IF EXISTS `exp_online_users`;
CREATE TABLE IF NOT EXISTS `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=102 ;

--
-- Dumping data for table `exp_online_users`
--

INSERT INTO `exp_online_users` (`online_id`, `site_id`, `member_id`, `in_forum`, `name`, `ip_address`, `date`, `anon`) VALUES
(99, 1, 0, 'n', '', '::1', 1423598469, ''),
(97, 1, 1, 'n', 'Bill', '::1', 1423598506, ''),
(84, 1, 1, 'n', 'Bill', '::1', 1423598506, ''),
(96, 1, 1, 'n', 'Bill', '::1', 1423598506, ''),
(91, 1, 1, 'n', 'Bill', '::1', 1423598506, ''),
(90, 1, 1, 'n', 'Bill', '::1', 1423598506, ''),
(101, 1, 0, 'n', '', '::1', 1423598469, ''),
(87, 1, 1, 'n', 'Bill', '::1', 1423598506, ''),
(100, 1, 0, 'n', '', '::1', 1423598469, '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_password_lockout`
--

DROP TABLE IF EXISTS `exp_password_lockout`;
CREATE TABLE IF NOT EXISTS `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_password_lockout`
--

INSERT INTO `exp_password_lockout` (`lockout_id`, `login_date`, `ip_address`, `user_agent`, `username`) VALUES
(1, 1422889518, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'wwhorton');

-- --------------------------------------------------------

--
-- Table structure for table `exp_relationships`
--

DROP TABLE IF EXISTS `exp_relationships`;
CREATE TABLE IF NOT EXISTS `exp_relationships` (
  `relationship_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `child_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_col_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_row_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `parent_id` (`parent_id`),
  KEY `child_id` (`child_id`),
  KEY `field_id` (`field_id`),
  KEY `grid_row_id` (`grid_row_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `exp_relationships`
--

INSERT INTO `exp_relationships` (`relationship_id`, `parent_id`, `child_id`, `field_id`, `grid_field_id`, `grid_col_id`, `grid_row_id`, `order`) VALUES
(41, 1, 19, 10, 0, 0, 0, 0),
(43, 1, 14, 11, 0, 0, 0, 2),
(42, 1, 13, 11, 0, 0, 0, 1),
(39, 15, 18, 10, 0, 0, 0, 0),
(40, 15, 14, 11, 0, 0, 0, 1),
(18, 16, 5, 10, 0, 0, 0, 0),
(19, 16, 14, 11, 0, 0, 0, 1),
(36, 17, 22, 10, 0, 0, 0, 0),
(38, 17, 14, 11, 0, 0, 0, 2),
(37, 17, 13, 11, 0, 0, 0, 1),
(23, 18, 5, 15, 0, 0, 0, 0),
(24, 19, 5, 15, 0, 0, 0, 0),
(58, 20, 5, 15, 0, 0, 0, 0),
(26, 21, 5, 15, 0, 0, 0, 0),
(27, 22, 5, 15, 0, 0, 0, 0),
(31, 5, 19, 16, 0, 0, 0, 2),
(32, 5, 22, 16, 0, 0, 0, 1),
(33, 5, 20, 16, 0, 0, 0, 3),
(34, 5, 21, 16, 0, 0, 0, 4),
(35, 5, 18, 16, 0, 0, 0, 5),
(50, 27, 29, 10, 0, 0, 0, 0),
(52, 27, 26, 11, 0, 0, 0, 2),
(51, 27, 24, 11, 0, 0, 0, 1),
(47, 28, 6, 15, 0, 0, 0, 0),
(48, 29, 6, 15, 0, 0, 0, 0),
(49, 30, 6, 15, 0, 0, 0, 0),
(53, 6, 29, 16, 0, 0, 0, 1),
(54, 6, 28, 16, 0, 0, 0, 2),
(55, 6, 30, 16, 0, 0, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `exp_remember_me`
--

DROP TABLE IF EXISTS `exp_remember_me`;
CREATE TABLE IF NOT EXISTS `exp_remember_me` (
  `remember_me_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT '0',
  `user_agent` varchar(120) DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_reset_password`
--

DROP TABLE IF EXISTS `exp_reset_password`;
CREATE TABLE IF NOT EXISTS `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_revision_tracker`
--

DROP TABLE IF EXISTS `exp_revision_tracker`;
CREATE TABLE IF NOT EXISTS `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_rte_tools`
--

DROP TABLE IF EXISTS `exp_rte_tools`;
CREATE TABLE IF NOT EXISTS `exp_rte_tools` (
  `tool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `class` varchar(75) DEFAULT NULL,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`tool_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `exp_rte_tools`
--

INSERT INTO `exp_rte_tools` (`tool_id`, `name`, `class`, `enabled`) VALUES
(1, 'Blockquote', 'Blockquote_rte', 'y'),
(2, 'Bold', 'Bold_rte', 'y'),
(3, 'Headings', 'Headings_rte', 'y'),
(4, 'Image', 'Image_rte', 'y'),
(5, 'Italic', 'Italic_rte', 'y'),
(6, 'Link', 'Link_rte', 'y'),
(7, 'Ordered List', 'Ordered_list_rte', 'y'),
(8, 'Underline', 'Underline_rte', 'y'),
(9, 'Unordered List', 'Unordered_list_rte', 'y'),
(10, 'View Source', 'View_source_rte', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_rte_toolsets`
--

DROP TABLE IF EXISTS `exp_rte_toolsets`;
CREATE TABLE IF NOT EXISTS `exp_rte_toolsets` (
  `toolset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `tools` text,
  `enabled` char(1) DEFAULT 'y',
  PRIMARY KEY (`toolset_id`),
  KEY `member_id` (`member_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_rte_toolsets`
--

INSERT INTO `exp_rte_toolsets` (`toolset_id`, `member_id`, `name`, `tools`, `enabled`) VALUES
(1, 0, 'Default', '3|2|5|1|9|7|6|4|10', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_search`
--

DROP TABLE IF EXISTS `exp_search`;
CREATE TABLE IF NOT EXISTS `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_search`
--

INSERT INTO `exp_search` (`search_id`, `site_id`, `search_date`, `keywords`, `member_id`, `ip_address`, `total_results`, `per_page`, `query`, `custom_fields`, `result_page`) VALUES
('2bcd543341164c1fd085447318064b80', 1, 1423154440, 'birds', 1, '::1', 1, 50, 's:1392:\\"SELECT DISTINCT(t.entry_id), t.entry_id, t.channel_id, t.forum_topic_id, t.author_id, t.ip_address, t.title, t.url_title, t.status, t.view_count_one, t.view_count_two, t.view_count_three, t.view_count_four, t.allow_comments, t.comment_expiration_date, t.sticky, t.entry_date, t.year, t.month, t.day, t.entry_date, t.edit_date, t.expiration_date, t.recent_comment_date, t.comment_total, t.site_id as entry_site_id,\n				w.channel_title, w.channel_name, w.search_results_url, w.search_excerpt, w.channel_url, w.comment_url, w.comment_moderate, w.channel_html_formatting, w.channel_allow_img_urls, w.channel_auto_link_urls, w.comment_system_enabled,\n				m.username, m.email, m.url, m.screen_name, m.location, m.occupation, m.interests, m.aol_im, m.yahoo_im, m.msn_im, m.icq, m.signature, m.sig_img_filename, m.sig_img_width, m.sig_img_height, m.avatar_filename, m.avatar_width, m.avatar_height, m.photo_filename, m.photo_width, m.photo_height, m.group_id, m.member_id, m.bday_d, m.bday_m, m.bday_y, m.bio,\n				md.*,\n				wd.*\n			FROM MDBMPREFIXchannel_titles		AS t\n			LEFT JOIN MDBMPREFIXchannels 		AS w  ON t.channel_id = w.channel_id\n			LEFT JOIN MDBMPREFIXchannel_data	AS wd ON t.entry_id = wd.entry_id\n			LEFT JOIN MDBMPREFIXmembers		AS m  ON m.member_id = t.author_id\n			LEFT JOIN MDBMPREFIXmember_data	AS md ON md.member_id = m.member_id\n			WHERE t.entry_id IN (1)  ORDER BY entry_date  desc\\";', 'a:10:{s:15:\\"scientific_name\\";a:2:{i:0;s:1:\\"1\\";i:1;s:1:\\"y\\";}s:11:\\"quick_facts\\";a:2:{i:0;s:1:\\"2\\";i:1;s:1:\\"y\\";}s:10:\\"appearance\\";a:2:{i:0;s:1:\\"3\\";i:1;s:1:\\"y\\";}s:5:\\"voice\\";a:2:{i:0;s:1:\\"4\\";i:1;s:1:\\"y\\";}s:12:\\"did_you_know\\";a:2:{i:0;s:1:\\"5\\";i:1;s:1:\\"n\\";}s:32:\\"sources_and_additional_informati\\";a:2:{i:0;s:1:\\"6\\";i:1;s:1:\\"n\\";}s:17:\\"short_description\\";a:2:{i:0;s:1:\\"7\\";i:1;s:1:\\"y\\";}s:4:\\"type\\";a:2:{i:0;s:2:\\"10\\";i:1;s:1:\\"n\\";}s:7:\\"habitat\\";a:2:{i:0;s:2:\\"11\\";i:1;s:1:\\"n\\";}s:5:\\"media\\";a:2:{i:0;s:2:\\"12\\";i:1;s:1:\\"n\\";}}', 'search/results');

-- --------------------------------------------------------

--
-- Table structure for table `exp_search_log`
--

DROP TABLE IF EXISTS `exp_search_log`;
CREATE TABLE IF NOT EXISTS `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `exp_search_log`
--

INSERT INTO `exp_search_log` (`id`, `site_id`, `member_id`, `screen_name`, `ip_address`, `search_date`, `search_type`, `search_terms`) VALUES
(1, 1, 1, 'Bill', '::1', 1421861153, 'site', 'Farms'),
(2, 1, 1, 'Bill', '::1', 1421861180, 'site', 'crabs'),
(3, 1, 1, 'Bill', '::1', 1421861223, 'site', 'crabs'),
(4, 1, 1, 'Bill', '::1', 1421861232, 'site', 'turkey'),
(5, 1, 0, '', '::1', 1422388695, 'site', 'turkey'),
(6, 1, 1, 'Bill', '::1', 1423154440, 'site', 'birds'),
(7, 1, 1, 'Bill', '::1', 1423169342, 'site', 'heron');

-- --------------------------------------------------------

--
-- Table structure for table `exp_security_hashes`
--

DROP TABLE IF EXISTS `exp_security_hashes`;
CREATE TABLE IF NOT EXISTS `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `exp_security_hashes`
--

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`) VALUES
(1, 1420663271, 'd52541c7ce50f6e1b10dfe8955acae85f7596fc3', '4cf67a0e98b7f1cc5e0943d844db70fce90f5ff0'),
(2, 1420741417, '4647e7264c3bf67ae65a9476453eb31888b8822a', '1b199a259514234fa34a03cc96ca0fbf3cc80d52'),
(3, 1420749176, 'c6ae30ddc1ce1fce5c54af76a2c1bb043eaefd4d', 'b034d59f78e762660bdca2cbc006a088d8135f60'),
(4, 1420813623, '62f3e97570be9aa649430814475f5bc71eb69ace', '44ede085a097f988d096d421a3b640e5a959f05e'),
(5, 1420818683, 'fdd3a97e0a170d104242e45d0f01cbf37c0a0c6a', 'bea6f8cfc1b9f5a671c72f5a79955d56f22e30af'),
(6, 1420833073, '9724e39b83b92188b645dd1411f6f6867847fee1', 'b79c278b579d66b460384a2f0ba2d0b04dfd465a'),
(7, 1421071572, 'a2b0419945b3a1fdd39ee83d9669024fb033b9b5', '6fe0e0bf9d5e943fed092c1246166e317f44af32'),
(8, 1421078869, '55fc34662b145c2f92580a208587f88b3db98e4a', '7fa5e020be499522dff51681519612b401cc7840'),
(9, 1421086200, 'a75256c58fefb1e4bcfd1f288a9b703c78f399d3', '61010c0d5841d6b30542aab3b99fd96ddbb2807f'),
(10, 1421086222, 'c0018645b6b3fa10c1139a64e0b768c4789c8c0c', '2e6e849725d857d2b75e560e6555ae456a8cf586'),
(12, 1421173065, 'fd1bfa951dfbc745faad5c63c4b3a5c005e58f7b', 'b8beea409daa91bbadb541669390e6ddba203dc4'),
(13, 1421176220, '3191dde8b1197cab2ddb2860bb4ce03b5c12dd02', '6f4418bc73b926976aa33c172881d415615d5dc4'),
(14, 1421335329, 'a69cd937879a610aee8d0f58d1251f5f1e27cba5', 'fb7650ac28afb4165419156e05005a472ec996ca'),
(15, 1421768711, '2fbc0a0565b81d9e5d3b13a7771a88b49ac45495', '34abc2699049990a97319e704137b268f1b76e6b'),
(16, 1421779176, '7cccc7cd2eb4ce05ff9fc719f9d94e1193e71ed6', '92652e091e7d83b5563ce0a4ccbdc2ec75943b0f'),
(17, 1421780879, '3ab8ac86b1294f1b8f0505e305397704d8a6092d', '89e8d7a635f946b6d0f75b62ab5095c5320e11fc'),
(18, 1421785744, 'f85833df1b6bd0b28229918af2d76b2aa65a6588', '62eef7efa43acd33c6b250580d07e7bb2ba18b93'),
(19, 1421788900, 'ac0f106b93f103351f3c0397d77df41d3ec39faa', '7defb28be47ba66fc0cb624b57f07fbcc763ef14'),
(20, 1421861104, 'f431100fd93131583ad7bc6d4b25926c6579b47a', '9139de0f63d9c4ba24ff9a7cabd857006de66a4f'),
(21, 1422645682, 'feae1742aad130d89cc8daaab62777b7216ffe1d', '260270eb3a8a14fbcb1e4a99477d0a333d91aa4e'),
(22, 1422889524, '18a0db093237ae11179251ab1ce67f2989bd6b02', '92568d3472420e0d734bdf88088e57b6a61e88a1'),
(23, 1422893545, '579e2186517637ac260a794f1f4c1cf03ebce361', '5da09e00809f36cc5f693af2e5c5516a5bbaf89e'),
(24, 1422893963, '52e5e13ae96bdfa52222366597c5d2cb28f3a13b', 'f939e07eaf413bc51d2a34516bac5d462c6a1b07'),
(25, 1422979617, '0969d3d652803cb1427ecee35f5188fa8ee5df21', '94e16af593fa78d792b217015759ab98a649781f'),
(26, 1422980667, '15b2eba7e935cdb6ad113133c793dbb0d2f5baa7', '542e5073a7d05ffc001f7a7e0f2530b12650f518'),
(27, 1422983727, 'b85057148b5d001c5b5e0c8b0fff17412fcc3609', 'd9ebb0a6d244709f42b53a73e25a8c15f4cc5688'),
(28, 1422991271, '0c96c4be0f9395642b2d045264a88bd1c96ed674', 'e8abb78ad6dc7c252c165598ba128a25142b7877'),
(29, 1423068795, '9889d3cadca7d59855ccb67a248da9ea09676e1d', '9daf7d2ddc98418a95e13b9468cacba4f1623e86'),
(30, 1423147993, 'f1dd99e9b8ebceb7b2eb0ddc9ae40bb36fa97e9b', 'd4c95e337babfaeb076b65bf389d1fba1c4e241d'),
(31, 1423497036, 'd3abc3d5ac72337d7b8210085c72c5e20f16c4ad', '68309ce620066e607e2fcb006355be183b5afbf4'),
(32, 1423507152, '075220af3e604a384f29ba5f03d9423b30da6439', '7a27c61b74b20421131d7797fe1074bd0f8b7461'),
(33, 1423511797, 'd084ce3a71bfa9ac8b3e0d6d499f6ab37745d1de', 'eed174fea9a13dd567b979a490ffaea7991d91a3'),
(34, 1423513158, 'acd4c929bc44dbf8080789764b7b9d83309547f2', '2fb2e59848cb8e5a8ae0287b3b306dd240a952f4'),
(35, 1423578182, '03ab73d6f1f958a5125e58c59f449004aef25de9', '689853922c0396755d7f9270144736607de23624'),
(36, 1423589132, '9295e0a5d790bf9cac7bd54969d86bc5068e2c22', 'ee33ab21a1d9f7f4eb3a2fb6f52527fd5a120adf'),
(37, 1423591727, 'a9daf47e91c3c882f64480ce333cfdf890172131', '64d362b1aaf8f6a89ffbe61f1168931069917bed'),
(38, 1423593803, '94c981dec7430235e2b4ee60c85294ee5975f906', 'a14e75dbe2334147192a509a27a0e0f20c269322');

-- --------------------------------------------------------

--
-- Table structure for table `exp_sessions`
--

DROP TABLE IF EXISTS `exp_sessions`;
CREATE TABLE IF NOT EXISTS `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `fingerprint` varchar(40) NOT NULL,
  `sess_start` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exp_sessions`
--

INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `fingerprint`, `sess_start`, `last_activity`) VALUES
('94c981dec7430235e2b4ee60c85294ee5975f906', 1, 1, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'edf257c185b76fb88732889b0b052b17', 1423593803, 1423598506),
('a9daf47e91c3c882f64480ce333cfdf890172131', 1, 1, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'edf257c185b76fb88732889b0b052b17', 1423591727, 1423593726),
('9295e0a5d790bf9cac7bd54969d86bc5068e2c22', 1, 1, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0', 'edf257c185b76fb88732889b0b052b17', 1423589132, 1423591679);

-- --------------------------------------------------------

--
-- Table structure for table `exp_sites`
--

DROP TABLE IF EXISTS `exp_sites`;
CREATE TABLE IF NOT EXISTS `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text,
  `site_system_preferences` mediumtext NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_sites`
--

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_system_preferences`, `site_mailinglist_preferences`, `site_member_preferences`, `site_template_preferences`, `site_channel_preferences`, `site_bootstrap_checksums`) VALUES
(1, 'Chesapeake Bay Program Field Guide', 'default_site', NULL, 'YTo4OTp7czoxMDoic2l0ZV9pbmRleCI7czowOiIiO3M6ODoic2l0ZV91cmwiO3M6MTc6Imh0dHA6Ly9sb2NhbGhvc3QvIjtzOjE2OiJ0aGVtZV9mb2xkZXJfdXJsIjtzOjI0OiJodHRwOi8vbG9jYWxob3N0L3RoZW1lcy8iO3M6MTU6IndlYm1hc3Rlcl9lbWFpbCI7czoyMToid3dob3J0b25AY2EudW1jZXMuZWR1IjtzOjE0OiJ3ZWJtYXN0ZXJfbmFtZSI7czowOiIiO3M6MjA6ImNoYW5uZWxfbm9tZW5jbGF0dXJlIjtzOjc6ImNoYW5uZWwiO3M6MTA6Im1heF9jYWNoZXMiO3M6MzoiMTUwIjtzOjExOiJjYXB0Y2hhX3VybCI7czozMzoiaHR0cDovL2xvY2FsaG9zdC9pbWFnZXMvY2FwdGNoYXMvIjtzOjEyOiJjYXB0Y2hhX3BhdGgiO3M6Mjg6IkM6XHdhbXBcd3d3XGltYWdlc1xjYXB0Y2hhc1wiO3M6MTI6ImNhcHRjaGFfZm9udCI7czoxOiJ5IjtzOjEyOiJjYXB0Y2hhX3JhbmQiO3M6MToieSI7czoyMzoiY2FwdGNoYV9yZXF1aXJlX21lbWJlcnMiO3M6MToibiI7czoxNzoiZW5hYmxlX2RiX2NhY2hpbmciO3M6MToibiI7czoxODoiZW5hYmxlX3NxbF9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImZvcmNlX3F1ZXJ5X3N0cmluZyI7czoxOiJuIjtzOjEzOiJzaG93X3Byb2ZpbGVyIjtzOjE6Im4iO3M6MTg6InRlbXBsYXRlX2RlYnVnZ2luZyI7czoxOiJuIjtzOjE1OiJpbmNsdWRlX3NlY29uZHMiO3M6MToibiI7czoxMzoiY29va2llX2RvbWFpbiI7czowOiIiO3M6MTE6ImNvb2tpZV9wYXRoIjtzOjA6IiI7czoyMDoid2Vic2l0ZV9zZXNzaW9uX3R5cGUiO3M6MToiYyI7czoxNToiY3Bfc2Vzc2lvbl90eXBlIjtzOjI6ImNzIjtzOjIxOiJhbGxvd191c2VybmFtZV9jaGFuZ2UiO3M6MToieSI7czoxODoiYWxsb3dfbXVsdGlfbG9naW5zIjtzOjE6InkiO3M6MTY6InBhc3N3b3JkX2xvY2tvdXQiO3M6MToieSI7czoyNToicGFzc3dvcmRfbG9ja291dF9pbnRlcnZhbCI7czoxOiIxIjtzOjIwOiJyZXF1aXJlX2lwX2Zvcl9sb2dpbiI7czoxOiJ5IjtzOjIyOiJyZXF1aXJlX2lwX2Zvcl9wb3N0aW5nIjtzOjE6InkiO3M6MjQ6InJlcXVpcmVfc2VjdXJlX3Bhc3N3b3JkcyI7czoxOiJuIjtzOjE5OiJhbGxvd19kaWN0aW9uYXJ5X3B3IjtzOjE6InkiO3M6MjM6Im5hbWVfb2ZfZGljdGlvbmFyeV9maWxlIjtzOjA6IiI7czoxNzoieHNzX2NsZWFuX3VwbG9hZHMiO3M6MToieSI7czoxNToicmVkaXJlY3RfbWV0aG9kIjtzOjc6InJlZnJlc2giO3M6OToiZGVmdF9sYW5nIjtzOjc6ImVuZ2xpc2giO3M6ODoieG1sX2xhbmciO3M6MjoiZW4iO3M6MTI6InNlbmRfaGVhZGVycyI7czoxOiJ5IjtzOjExOiJnemlwX291dHB1dCI7czoxOiJuIjtzOjEzOiJsb2dfcmVmZXJyZXJzIjtzOjE6Im4iO3M6MTM6Im1heF9yZWZlcnJlcnMiO3M6MzoiNTAwIjtzOjExOiJkYXRlX2Zvcm1hdCI7czo4OiIlbi8lai8leSI7czoxMToidGltZV9mb3JtYXQiO3M6MjoiMTIiO3M6MTM6InNlcnZlcl9vZmZzZXQiO3M6MDoiIjtzOjIxOiJkZWZhdWx0X3NpdGVfdGltZXpvbmUiO3M6MTY6IkFtZXJpY2EvTmV3X1lvcmsiO3M6MTM6Im1haWxfcHJvdG9jb2wiO3M6NDoibWFpbCI7czoxMToic210cF9zZXJ2ZXIiO3M6MDoiIjtzOjEzOiJzbXRwX3VzZXJuYW1lIjtzOjA6IiI7czoxMzoic210cF9wYXNzd29yZCI7czowOiIiO3M6MTE6ImVtYWlsX2RlYnVnIjtzOjE6Im4iO3M6MTM6ImVtYWlsX2NoYXJzZXQiO3M6NToidXRmLTgiO3M6MTU6ImVtYWlsX2JhdGNobW9kZSI7czoxOiJuIjtzOjE2OiJlbWFpbF9iYXRjaF9zaXplIjtzOjA6IiI7czoxMToibWFpbF9mb3JtYXQiO3M6NToicGxhaW4iO3M6OToid29yZF93cmFwIjtzOjE6InkiO3M6MjI6ImVtYWlsX2NvbnNvbGVfdGltZWxvY2siO3M6MToiNSI7czoyMjoibG9nX2VtYWlsX2NvbnNvbGVfbXNncyI7czoxOiJ5IjtzOjg6ImNwX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MjE6ImVtYWlsX21vZHVsZV9jYXB0Y2hhcyI7czoxOiJuIjtzOjE2OiJsb2dfc2VhcmNoX3Rlcm1zIjtzOjE6InkiO3M6MTk6ImRlbnlfZHVwbGljYXRlX2RhdGEiO3M6MToieSI7czoyNDoicmVkaXJlY3Rfc3VibWl0dGVkX2xpbmtzIjtzOjE6Im4iO3M6MTY6ImVuYWJsZV9jZW5zb3JpbmciO3M6MToibiI7czoxNDoiY2Vuc29yZWRfd29yZHMiO3M6MDoiIjtzOjE4OiJjZW5zb3JfcmVwbGFjZW1lbnQiO3M6MDoiIjtzOjEwOiJiYW5uZWRfaXBzIjtzOjA6IiI7czoxMzoiYmFubmVkX2VtYWlscyI7czowOiIiO3M6MTY6ImJhbm5lZF91c2VybmFtZXMiO3M6MDoiIjtzOjE5OiJiYW5uZWRfc2NyZWVuX25hbWVzIjtzOjA6IiI7czoxMDoiYmFuX2FjdGlvbiI7czo4OiJyZXN0cmljdCI7czoxMToiYmFuX21lc3NhZ2UiO3M6MzQ6IlRoaXMgc2l0ZSBpcyBjdXJyZW50bHkgdW5hdmFpbGFibGUiO3M6MTU6ImJhbl9kZXN0aW5hdGlvbiI7czoyMToiaHR0cDovL3d3dy55YWhvby5jb20vIjtzOjE2OiJlbmFibGVfZW1vdGljb25zIjtzOjE6InkiO3M6MTI6ImVtb3RpY29uX3VybCI7czozMjoiaHR0cDovL2xvY2FsaG9zdC9pbWFnZXMvc21pbGV5cy8iO3M6MTk6InJlY291bnRfYmF0Y2hfdG90YWwiO3M6NDoiMTAwMCI7czoxNzoibmV3X3ZlcnNpb25fY2hlY2siO3M6MToieSI7czoxNzoiZW5hYmxlX3Rocm90dGxpbmciO3M6MToibiI7czoxNzoiYmFuaXNoX21hc2tlZF9pcHMiO3M6MToieSI7czoxNDoibWF4X3BhZ2VfbG9hZHMiO3M6MjoiMTAiO3M6MTM6InRpbWVfaW50ZXJ2YWwiO3M6MToiOCI7czoxMjoibG9ja291dF90aW1lIjtzOjI6IjMwIjtzOjE1OiJiYW5pc2htZW50X3R5cGUiO3M6NzoibWVzc2FnZSI7czoxNDoiYmFuaXNobWVudF91cmwiO3M6MDoiIjtzOjE4OiJiYW5pc2htZW50X21lc3NhZ2UiO3M6NTA6IllvdSBoYXZlIGV4Y2VlZGVkIHRoZSBhbGxvd2VkIHBhZ2UgbG9hZCBmcmVxdWVuY3kuIjtzOjE3OiJlbmFibGVfc2VhcmNoX2xvZyI7czoxOiJ5IjtzOjE5OiJtYXhfbG9nZ2VkX3NlYXJjaGVzIjtzOjM6IjUwMCI7czoxNzoidGhlbWVfZm9sZGVyX3BhdGgiO3M6MTk6IkM6L3dhbXAvd3d3L3RoZW1lcy8iO3M6MTA6ImlzX3NpdGVfb24iO3M6MToieSI7czoxMToicnRlX2VuYWJsZWQiO3M6MToieSI7czoyMjoicnRlX2RlZmF1bHRfdG9vbHNldF9pZCI7czoxOiIxIjtzOjEyOiJjYWNoZV9kcml2ZXIiO3M6NDoiZmlsZSI7fQ==', 'YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==', 'YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToibiI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNSI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjY6Im1lbWJlciI7czoxMjoibWVtYmVyX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MTQ6ImVuYWJsZV9hdmF0YXJzIjtzOjE6InkiO3M6MjA6ImFsbG93X2F2YXRhcl91cGxvYWRzIjtzOjE6Im4iO3M6MTA6ImF2YXRhcl91cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3QvaW1hZ2VzL2F2YXRhcnMvIjtzOjExOiJhdmF0YXJfcGF0aCI7czoyNzoiQzpcd2FtcFx3d3dcaW1hZ2VzXGF2YXRhcnNcIjtzOjE2OiJhdmF0YXJfbWF4X3dpZHRoIjtzOjM6IjEwMCI7czoxNzoiYXZhdGFyX21heF9oZWlnaHQiO3M6MzoiMTAwIjtzOjEzOiJhdmF0YXJfbWF4X2tiIjtzOjI6IjUwIjtzOjEzOiJlbmFibGVfcGhvdG9zIjtzOjE6Im4iO3M6OToicGhvdG9fdXJsIjtzOjM4OiJodHRwOi8vbG9jYWxob3N0L2ltYWdlcy9tZW1iZXJfcGhvdG9zLyI7czoxMDoicGhvdG9fcGF0aCI7czozMzoiQzpcd2FtcFx3d3dcaW1hZ2VzXG1lbWJlcl9waG90b3NcIjtzOjE1OiJwaG90b19tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE2OiJwaG90b19tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMjoicGhvdG9fbWF4X2tiIjtzOjI6IjUwIjtzOjE2OiJhbGxvd19zaWduYXR1cmVzIjtzOjE6InkiO3M6MTM6InNpZ19tYXhsZW5ndGgiO3M6MzoiNTAwIjtzOjIxOiJzaWdfYWxsb3dfaW1nX2hvdGxpbmsiO3M6MToibiI7czoyMDoic2lnX2FsbG93X2ltZ191cGxvYWQiO3M6MToibiI7czoxMToic2lnX2ltZ191cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3QvaW1hZ2VzL3NpZ25hdHVyZV9hdHRhY2htZW50cy8iO3M6MTI6InNpZ19pbWdfcGF0aCI7czo0MToiQzpcd2FtcFx3d3dcaW1hZ2VzXHNpZ25hdHVyZV9hdHRhY2htZW50c1wiO3M6MTc6InNpZ19pbWdfbWF4X3dpZHRoIjtzOjM6IjQ4MCI7czoxODoic2lnX2ltZ19tYXhfaGVpZ2h0IjtzOjI6IjgwIjtzOjE0OiJzaWdfaW1nX21heF9rYiI7czoyOiIzMCI7czoxOToicHJ2X21zZ191cGxvYWRfcGF0aCI7czozNDoiQzpcd2FtcFx3d3dcaW1hZ2VzXHBtX2F0dGFjaG1lbnRzXCI7czoyMzoicHJ2X21zZ19tYXhfYXR0YWNobWVudHMiO3M6MToiMyI7czoyMjoicHJ2X21zZ19hdHRhY2hfbWF4c2l6ZSI7czozOiIyNTAiO3M6MjA6InBydl9tc2dfYXR0YWNoX3RvdGFsIjtzOjM6IjEwMCI7czoxOToicHJ2X21zZ19odG1sX2Zvcm1hdCI7czo0OiJzYWZlIjtzOjE4OiJwcnZfbXNnX2F1dG9fbGlua3MiO3M6MToieSI7czoxNzoicHJ2X21zZ19tYXhfY2hhcnMiO3M6NDoiNjAwMCI7czoxOToibWVtYmVybGlzdF9vcmRlcl9ieSI7czoxMToidG90YWxfcG9zdHMiO3M6MjE6Im1lbWJlcmxpc3Rfc29ydF9vcmRlciI7czo0OiJkZXNjIjtzOjIwOiJtZW1iZXJsaXN0X3Jvd19saW1pdCI7czoyOiIyMCI7fQ==', 'YTo3OntzOjIyOiJlbmFibGVfdGVtcGxhdGVfcm91dGVzIjtzOjE6InkiO3M6MTE6InN0cmljdF91cmxzIjtzOjE6InkiO3M6ODoic2l0ZV80MDQiO3M6MDoiIjtzOjE5OiJzYXZlX3RtcGxfcmV2aXNpb25zIjtzOjE6Im4iO3M6MTg6Im1heF90bXBsX3JldmlzaW9ucyI7czoxOiI1IjtzOjE1OiJzYXZlX3RtcGxfZmlsZXMiO3M6MToieSI7czoxODoidG1wbF9maWxlX2Jhc2VwYXRoIjtzOjM0OiJzeXN0ZW0vZXhwcmVzc2lvbmVuZ2luZS90ZW1wbGF0ZXMvIjt9', 'YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czo0OiJkYXNoIjtzOjE3OiJ1c2VfY2F0ZWdvcnlfbmFtZSI7czoxOiJuIjtzOjIyOiJyZXNlcnZlZF9jYXRlZ29yeV93b3JkIjtzOjg6ImNhdGVnb3J5IjtzOjIzOiJhdXRvX2NvbnZlcnRfaGlnaF9hc2NpaSI7czoxOiJuIjtzOjIyOiJuZXdfcG9zdHNfY2xlYXJfY2FjaGVzIjtzOjE6InkiO3M6MjM6ImF1dG9fYXNzaWduX2NhdF9wYXJlbnRzIjtzOjE6InkiO30=', 'YToxOntzOjIxOiJDOlx3YW1wXHd3d1xpbmRleC5waHAiO3M6MzI6IjI0ODYwNjExYTFlODM2ZmJlMjA2YTQ1Y2QxMjMzNDVjIjt9');

-- --------------------------------------------------------

--
-- Table structure for table `exp_snippets`
--

DROP TABLE IF EXISTS `exp_snippets`;
CREATE TABLE IF NOT EXISTS `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_snippets`
--

INSERT INTO `exp_snippets` (`snippet_id`, `site_id`, `snippet_name`, `snippet_contents`) VALUES
(1, 1, 'sort_menu', '        <dl class="tabs row collapse hide-for-small-up" data-tab>\n		<dd class="active small-6 columns"><a href="#panel1">Sort by Type</a></dd>\n		<dd class="small-6 columns"><a href="#panel2">Sort by Habitat</a></dd>\n	</dl>\n            <label><h3>Sort by:</h3>\n            <select id="sortMenu">\n              <option value="#panel1" selected >Type</option>\n              <option value="#panel2">Habitat</option>\n            </select>\n	<div class="tabs-content">\n		<div class="content active" id="panel1">\n			<ul class="accordion" id="typeSort" data-accordion>\n			{exp:channel:entries channel="field_guide_types" sort="asc" dynamic="no"}\n				<li class="accordion-navigation">\n					<a href="#panel{entry_id}a">{title}<i>+</i></a>\n					<div id="panel{entry_id}a" class="content">\n						<ul class="accordion" data-accordion style="list-style: none;">\n						<li class="sortLink"><a href="{site_url}category/{url_title}">All {title}</a></li>\n						{subtypes}\n							<li class="accordion-navigation">\n								<a href="#panel{subtypes:entry_id}a">{subtypes:title}<i>+</i></a>\n								<div id="panel{subtypes:entry_id}a" class="content">\n									<ul style="list-style: none;">\n									{subtypes:parents field="type" sort="asc"}\n										<li class="sortLink">\n											<a href="{site_url}entry/{subtypes:parents:url_title}">{subtypes:parents:title}</a>\n										</li>\n									{/subtypes:parents}\n									</ul>\n								</div>\n							</li>\n						{/subtypes}\n						</ul>\n					</div>\n				</li>\n			{/exp:channel:entries}\n			</ul>\n		</div>\n		<div class="content" id="panel2">\n			<ul class="accordion" data-accordion>\n			{exp:channel:entries channel="field_guide_habitats" sort="asc" dynamic="no"}\n				<li class="accordion-navigation">\n					<a href="#panel{entry_id}a">{title}</a>\n					<div id="panel{entry_id}a" class="content">\n						<ul class="accordion" data-accordion style="list-style: none;">\n						{parents field="habitat" sort="asc"}\n							<li>\n								<a href="{site_url}entry/{parents:url_title}">{parents:title}</a>\n							</li>\n						{/parents}\n						</ul>\n					</div>\n				</li>\n			{/exp:channel:entries}\n			</ul>\n		</div>\n	</div>\n'),
(2, 1, 'top_nav', '<li class="has-dropdown">\n  <a href="#">Browse by habitat</a>\n  <ul class="dropdown">\n  <li class="divider"></li>\n  {exp:channel:entries channel="field_guide_habitats" sort="asc" dynamic="no"}\n    <li class="has-dropdown">\n      <a href="#">{title}</a>\n      <ul class="dropdown">\n      <li class="divider"></li>\n      {parents field="habitat" sort="asc"}\n        <li>\n          <a href="{site_url}entry/{parents:url_title}">{parents:title}</a>\n        </li>\n      {/parents}\n      </ul>\n    </li>\n  {/exp:channel:entries}\n  </ul>\n</li>\n\n<li class="has-dropdown">\n  <a href="#">Browse by type</a>\n  <ul class="dropdown">\n  <li class="divider"></li>\n  {exp:channel:entries channel="field_guide_types" sort="asc" dynamic="no"}\n    <li class="has-dropdown">\n      <a href="#">{title}</a>\n      <ul class="dropdown">\n      <li class="divider"></li>\n      {subtypes}\n        <li class="has-dropdown">\n          <a href="#">{subtypes:title}</a>\n          <ul class="dropdown">\n          <li class="divider"></li>\n          {subtypes:parents field="type"}\n            <li>\n              <a href="{site_url}entry/{subtypes:parents:url_title}">{subtypes:parents:title}</a>\n            </li>\n          {/subtypes:parents}\n          </ul>\n        </li>\n      {/subtypes}\n      </ul>\n    </li>\n  {/exp:channel:entries}\n  </ul>\n</li>');

-- --------------------------------------------------------

--
-- Table structure for table `exp_specialty_templates`
--

DROP TABLE IF EXISTS `exp_specialty_templates`;
CREATE TABLE IF NOT EXISTS `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `exp_specialty_templates`
--

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES
(1, 1, 'y', 'offline_template', '', '<html>\n<head>\n\n<title>System Offline</title>\n\n<style type="text/css">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>'),
(2, 1, 'y', 'message_template', '', '<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=''content-type'' content=''text/html; charset={charset}'' />\n\n{meta_refresh}\n\n<style type="text/css">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id="content">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>'),
(3, 1, 'y', 'admin_notify_reg', 'Notification of new member registration', 'New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}'),
(4, 1, 'y', 'admin_notify_entry', 'A new channel entry has been posted', 'A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit:\n{entry_url}\n'),
(5, 1, 'y', 'admin_notify_mailinglist', 'Someone has subscribed to your mailing list', 'A new mailing list subscription has been accepted.\n\nEmail Address: {email}\nMailing List: {mailing_list}'),
(6, 1, 'y', 'admin_notify_comment', 'You have just received a comment', 'You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at:\n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}'),
(7, 1, 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}'),
(8, 1, 'y', 'forgot_password_instructions', 'Login information', '{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nThen log in with your username: {username}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}'),
(9, 1, 'y', 'validated_member_notify', 'Your membership account has been activated', '{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}'),
(10, 1, 'y', 'decline_member_validation', 'Your membership account has been declined', '{name},\n\nWe''re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}'),
(11, 1, 'y', 'mailinglist_activation_instructions', 'Email Confirmation', 'Thank you for joining the "{mailing_list}" mailing list!\n\nPlease click the link below to confirm your email.\n\nIf you do not want to be added to our list, ignore this email.\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}'),
(12, 1, 'y', 'comment_notification', 'Someone just responded to your comment', '{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}'),
(13, 1, 'y', 'comments_opened_notification', 'New comments have been added', 'Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment}\n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}'),
(14, 1, 'y', 'private_message_notification', 'Someone has sent you a Private Message', '\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}'),
(15, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_stats`
--

DROP TABLE IF EXISTS `exp_stats`;
CREATE TABLE IF NOT EXISTS `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_stats`
--

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES
(1, 1, 1, 1, 'Bill', 30, 0, 0, 0, 1423069800, 0, 0, 1423598506, 12, 1421336037, 1424203130);

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_groups`
--

DROP TABLE IF EXISTS `exp_status_groups`;
CREATE TABLE IF NOT EXISTS `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_status_groups`
--

INSERT INTO `exp_status_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 1, 'Statuses');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_no_access`
--

DROP TABLE IF EXISTS `exp_status_no_access`;
CREATE TABLE IF NOT EXISTS `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_statuses`
--

DROP TABLE IF EXISTS `exp_statuses`;
CREATE TABLE IF NOT EXISTS `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exp_statuses`
--

INSERT INTO `exp_statuses` (`status_id`, `site_id`, `group_id`, `status`, `status_order`, `highlight`) VALUES
(1, 1, 1, 'open', 1, '009933'),
(2, 1, 1, 'closed', 2, '990000');

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_groups`
--

DROP TABLE IF EXISTS `exp_template_groups`;
CREATE TABLE IF NOT EXISTS `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `group_name_idx` (`group_name`),
  KEY `group_order_idx` (`group_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `exp_template_groups`
--

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`) VALUES
(1, 1, 'main', 1, 'y'),
(2, 1, 'site', 2, 'n'),
(3, 1, 'entry', 3, 'n'),
(4, 1, 'category', 4, 'n'),
(5, 1, 'API', 5, 'n'),
(6, 1, 'search', 6, 'n'),
(7, 1, 'habitat', 7, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_member_groups`
--

DROP TABLE IF EXISTS `exp_template_member_groups`;
CREATE TABLE IF NOT EXISTS `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_no_access`
--

DROP TABLE IF EXISTS `exp_template_no_access`;
CREATE TABLE IF NOT EXISTS `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_routes`
--

DROP TABLE IF EXISTS `exp_template_routes`;
CREATE TABLE IF NOT EXISTS `exp_template_routes` (
  `route_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `route` varchar(512) DEFAULT NULL,
  `route_parsed` varchar(512) DEFAULT NULL,
  `route_required` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`route_id`),
  KEY `template_id` (`template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_templates`
--

DROP TABLE IF EXISTS `exp_templates`;
CREATE TABLE IF NOT EXISTS `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) NOT NULL DEFAULT '',
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `protect_javascript` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `exp_templates`
--

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`) VALUES
(1, 1, 1, 'index', 'y', 'webpage', '{layout="site/wrapper"}\r\n    <div class="row">\r\n      <div class="small-12 medium-8 columns">\r\n			<h1>Bay Field Guide</h1>\r\n        <div class="row">\r\n          <div class="small-12 columns">\r\n          <p class="lead">The Bay Field Guide profiles many of the plants and animals that live in the Chesapeake Bay watershed. Explore the Field Guide to learn about more than 200 species of <a href="#">algae</a>, <a href="#">bay grasses</a>, <a href="#">birds</a>, <a href="#">fish</a>, <a href="#">insects</a>, <a href="#">invertebrates</a>, <a href="#">mammals</a>, <a href="#">plants and trees</a>, and <a href="#">reptiles and amphibians</a>. Each month, the Field Guide grows as we add a new Critter of the Month.</p>\r\n          <p>You can browse the Field Guide by type of critter or by habitat. You can also click on the images below to explore some of the newest and most popular species in our Field Guide.</p>\r\n          </div> <!-- end columns -->\r\n        </div> <!-- end row -->\r\n\r\n        <div class="row">\r\n          <div class="small-12 columns">\r\n            <h2>Critter of the Month</h2>\r\n            <a href="#"><img src="http://placehold.it/3000x2000" height="500" width="750"></a>\r\n            <h3><a href="#">Wild Turkey </br><i>Meleagris gallopavo</i></a></h3>\r\n            <p>The wild turkey is a large, dark, ground-dwelling bird with a long neck and a fan-shaped tail. It lives in open, wooded areas throughout the Chesapeake Bay watershed.</p>\r\n          </div> <!-- end columns -->\r\n        </div> <!-- end row -->\r\n\r\n        <div class="row accent-gray">\r\n          <div class="small-12 columns">\r\n            <dl class="tabs" data-tab>\r\n							<dd class="small-6 columns active"><a href="#panel1"><h5>Browse by Type</h5></a></dd>\r\n							<dd class="small-6 columns"><a href="#panel2"><h5>Browse by Habitat</h5></a></dd> \r\n						</dl>\r\n					<div class="tabs-content">\r\n						<div class="content active" id="panel1">\r\n								<ul class="small-block-grid-1 medium-block-grid-2">\r\n								{exp:channel:entries channel="field_guide_types" sort="asc"}\r\n									<li class="accent-white">\r\n										<img src="{image}" height="500" width="750">\r\n										<h3><a href="{site_url}category/{url_title}">{title}</a></h3>\r\n										<p>{type_short_description}</p>\r\n									</li>\r\n								{/exp:channel:entries}\r\n								</ul>\r\n						</div>\r\n						<div class="content" id="panel2">\r\n								<ul class="small-block-grid-1 medium-block-grid-2">\r\n								{exp:channel:entries channel="field_guide_habitats" sort="asc"}\r\n									<li class="accent-white">\r\n										<img src="{image}" height="500" width="750">\r\n										<h3><a href="{site_url}category/{url_title}">{title}</a></h3>\r\n										<p>{habitat_short_description}</p>\r\n									</li>\r\n								{/exp:channel:entries}\r\n								</ul>\r\n						</div>\r\n					</div>\r\n          </div> <!-- end columns -->\r\n        </div> <!-- end row -->\r\n\r\n      </div> <!-- end left columns -->\r\n\r\n      <div class="small-12 medium-4 columns hide-for-small-down">\r\n				<div class="row">\r\n					<div class="show-for-medium-up">\r\n						<div class="medium-10 columns">\r\n							<input type="text" placeholder="search chesapeakebay.net">\r\n						</div>\r\n						<div class="medium-2 columns">\r\n							<a href="#" class="" style="color: black; font-size: 24px;">\r\n								<i class="fi-magnifying-glass"></i>\r\n							</a>\r\n						</div>\r\n					</div>\r\n				</div>\r\n        {sort_menu}\r\n      </div> <!-- end right columns -->\r\n    \r\n    </div> <!-- end row -->', '', 1422890003, 1, 'n', 0, '', 'n', 'n', 'o', 956, 'n'),
(2, 1, 2, 'index', 'n', 'webpage', '', NULL, 1420741509, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n');
INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`) VALUES
(3, 1, 2, 'style', 'y', 'css', '/*! normalize.css v3.0.2 | MIT License | git.io/normalize */\n/**\n * 1. Set default font family to sans-serif.\n * 2. Prevent iOS text size adjust after orientation change, without disabling\n *    user zoom.\n */\nhtml {\n  font-family: sans-serif;\n  /* 1 */\n  -ms-text-size-adjust: 100%;\n  /* 2 */\n  -webkit-text-size-adjust: 100%;\n  /* 2 */ }\n\n/**\n * Remove default margin.\n */\nbody {\n  margin: 0; }\n\n/* HTML5 display definitions\n   ========================================================================== */\n/**\n * Correct `block` display not defined for any HTML5 element in IE 8/9.\n * Correct `block` display not defined for `details` or `summary` in IE 10/11\n * and Firefox.\n * Correct `block` display not defined for `main` in IE 11.\n */\narticle, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section, summary {\n  display: block; }\n\n/**\n * 1. Correct `inline-block` display not defined in IE 8/9.\n * 2. Normalize vertical alignment of `progress` in Chrome, Firefox, and Opera.\n */\naudio, canvas, progress, video {\n  display: inline-block;\n  /* 1 */\n  vertical-align: baseline;\n  /* 2 */ }\n\n/**\n * Prevent modern browsers from displaying `audio` without controls.\n * Remove excess height in iOS 5 devices.\n */\naudio:not([controls]) {\n  display: none;\n  height: 0; }\n\n/**\n * Address `[hidden]` styling not present in IE 8/9/10.\n * Hide the `template` element in IE 8/9/11, Safari, and Firefox < 22.\n */\n[hidden], template {\n  display: none; }\n\n/* Links\n   ========================================================================== */\n/**\n * Remove the gray background color from active links in IE 10.\n */\na {\n  background-color: transparent; }\n\n/**\n * Improve readability when focused and also mouse hovered in all browsers.\n */\na:active, a:hover {\n  outline: 0; }\n\n/* Text-level semantics\n   ========================================================================== */\n/**\n * Address styling not present in IE 8/9/10/11, Safari, and Chrome.\n */\nabbr[title] {\n  border-bottom: 1px dotted; }\n\n/**\n * Address style set to `bolder` in Firefox 4+, Safari, and Chrome.\n */\nb, strong {\n  font-weight: bold; }\n\n/**\n * Address styling not present in Safari and Chrome.\n */\ndfn {\n  font-style: italic; }\n\n/**\n * Address variable `h1` font-size and margin within `section` and `article`\n * contexts in Firefox 4+, Safari, and Chrome.\n */\nh1 {\n  font-size: 2em;\n  margin: 0.67em 0; }\n\n/**\n * Address styling not present in IE 8/9.\n */\nmark {\n  background: #ff0;\n  color: #000; }\n\n/**\n * Address inconsistent and variable font size in all browsers.\n */\nsmall {\n  font-size: 80%; }\n\n/**\n * Prevent `sub` and `sup` affecting `line-height` in all browsers.\n */\nsub, sup {\n  font-size: 75%;\n  line-height: 0;\n  position: relative;\n  vertical-align: baseline; }\n\nsup {\n  top: -0.5em; }\n\nsub {\n  bottom: -0.25em; }\n\n/* Embedded content\n   ========================================================================== */\n/**\n * Remove border when inside `a` element in IE 8/9/10.\n */\nimg {\n  border: 0; }\n\n/**\n * Correct overflow not hidden in IE 9/10/11.\n */\nsvg:not(:root) {\n  overflow: hidden; }\n\n/* Grouping content\n   ========================================================================== */\n/**\n * Address margin not present in IE 8/9 and Safari.\n */\nfigure {\n  margin: 1em 40px; }\n\n/**\n * Address differences between Firefox and other browsers.\n */\nhr {\n  -moz-box-sizing: content-box;\n  box-sizing: content-box;\n  height: 0; }\n\n/**\n * Contain overflow in all browsers.\n */\npre {\n  overflow: auto; }\n\n/**\n * Address odd `em`-unit font size rendering in all browsers.\n */\ncode, kbd, pre, samp {\n  font-family: monospace, monospace;\n  font-size: 1em; }\n\n/* Forms\n   ========================================================================== */\n/**\n * Known limitation: by default, Chrome and Safari on OS X allow very limited\n * styling of `select`, unless a `border` property is set.\n */\n/**\n * 1. Correct color not being inherited.\n *    Known issue: affects color of disabled elements.\n * 2. Correct font properties not being inherited.\n * 3. Address margins set differently in Firefox 4+, Safari, and Chrome.\n */\nbutton, input, optgroup, select, textarea {\n  color: inherit;\n  /* 1 */\n  font: inherit;\n  /* 2 */\n  margin: 0;\n  /* 3 */ }\n\n/**\n * Address `overflow` set to `hidden` in IE 8/9/10/11.\n */\nbutton {\n  overflow: visible; }\n\n/**\n * Address inconsistent `text-transform` inheritance for `button` and `select`.\n * All other form control elements do not inherit `text-transform` values.\n * Correct `button` style inheritance in Firefox, IE 8/9/10/11, and Opera.\n * Correct `select` style inheritance in Firefox.\n */\nbutton, select {\n  text-transform: none; }\n\n/**\n * 1. Avoid the WebKit bug in Android 4.0.* where (2) destroys native `audio`\n *    and `video` controls.\n * 2. Correct inability to style clickable `input` types in iOS.\n * 3. Improve usability and consistency of cursor style between image-type\n *    `input` and others.\n */\nbutton, html input[type="button"], input[type="reset"], input[type="submit"] {\n  -webkit-appearance: button;\n  /* 2 */\n  cursor: pointer;\n  /* 3 */ }\n\n/**\n * Re-set default cursor for disabled elements.\n */\nbutton[disabled], html input[disabled] {\n  cursor: default; }\n\n/**\n * Remove inner padding and border in Firefox 4+.\n */\nbutton::-moz-focus-inner, input::-moz-focus-inner {\n  border: 0;\n  padding: 0; }\n\n/**\n * Address Firefox 4+ setting `line-height` on `input` using `!important` in\n * the UA stylesheet.\n */\ninput {\n  line-height: normal; }\n\n/**\n * It''s recommended that you don''t attempt to style these elements.\n * Firefox''s implementation doesn''t respect box-sizing, padding, or width.\n *\n * 1. Address box sizing set to `content-box` in IE 8/9/10.\n * 2. Remove excess padding in IE 8/9/10.\n */\ninput[type="checkbox"], input[type="radio"] {\n  box-sizing: border-box;\n  /* 1 */\n  padding: 0;\n  /* 2 */ }\n\n/**\n * Fix the cursor style for Chrome''s increment/decrement buttons. For certain\n * `font-size` values of the `input`, it causes the cursor style of the\n * decrement button to change from `default` to `text`.\n */\ninput[type="number"]::-webkit-inner-spin-button, input[type="number"]::-webkit-outer-spin-button {\n  height: auto; }\n\n/**\n * 1. Address `appearance` set to `searchfield` in Safari and Chrome.\n * 2. Address `box-sizing` set to `border-box` in Safari and Chrome\n *    (include `-moz` to future-proof).\n */\ninput[type="search"] {\n  -webkit-appearance: textfield;\n  /* 1 */\n  -moz-box-sizing: content-box;\n  -webkit-box-sizing: content-box;\n  /* 2 */\n  box-sizing: content-box; }\n\n/**\n * Remove inner padding and search cancel button in Safari and Chrome on OS X.\n * Safari (but not Chrome) clips the cancel button when the search input has\n * padding (and `textfield` appearance).\n */\ninput[type="search"]::-webkit-search-cancel-button, input[type="search"]::-webkit-search-decoration {\n  -webkit-appearance: none; }\n\n/**\n * Define consistent border, margin, and padding.\n */\nfieldset {\n  border: 1px solid #c0c0c0;\n  margin: 0 2px;\n  padding: 0.35em 0.625em 0.75em; }\n\n/**\n * 1. Correct `color` not being inherited in IE 8/9/10/11.\n * 2. Remove padding so people aren''t caught out if they zero out fieldsets.\n */\nlegend {\n  border: 0;\n  /* 1 */\n  padding: 0;\n  /* 2 */ }\n\n/**\n * Remove default vertical scrollbar in IE 8/9/10/11.\n */\ntextarea {\n  overflow: auto; }\n\n/**\n * Don''t inherit the `font-weight` (applied by a rule above).\n * NOTE: the default cannot safely be changed in Chrome and Safari on OS X.\n */\noptgroup {\n  font-weight: bold; }\n\n/* Tables\n   ========================================================================== */\n/**\n * Remove most spacing between table cells.\n */\ntable {\n  border-collapse: collapse;\n  border-spacing: 0; }\n\ntd, th {\n  padding: 0; }\n\nmeta.foundation-version {\n  font-family: "/5.5.0/"; }\n\nmeta.foundation-mq-small {\n  font-family: "/only screen/";\n  width: 0; }\n\nmeta.foundation-mq-small-only {\n  font-family: "/only screen and (max-width: 40em)/";\n  width: 0; }\n\nmeta.foundation-mq-medium {\n  font-family: "/only screen and (min-width:40.063em)/";\n  width: 40.063em; }\n\nmeta.foundation-mq-medium-only {\n  font-family: "/only screen and (min-width:40.063em) and (max-width:64em)/";\n  width: 40.063em; }\n\nmeta.foundation-mq-large {\n  font-family: "/only screen and (min-width:64.063em)/";\n  width: 64.063em; }\n\nmeta.foundation-mq-large-only {\n  font-family: "/only screen and (min-width:64.063em) and (max-width:90em)/";\n  width: 64.063em; }\n\nmeta.foundation-mq-xlarge {\n  font-family: "/only screen and (min-width:90.063em)/";\n  width: 90.063em; }\n\nmeta.foundation-mq-xlarge-only {\n  font-family: "/only screen and (min-width:90.063em) and (max-width:120em)/";\n  width: 90.063em; }\n\nmeta.foundation-mq-xxlarge {\n  font-family: "/only screen and (min-width:120.063em)/";\n  width: 120.063em; }\n\nmeta.foundation-data-attribute-namespace {\n  font-family: false; }\n\nhtml, body {\n  height: 100%; }\n\n*, *:before, *:after {\n  -webkit-box-sizing: border-box;\n  -moz-box-sizing: border-box;\n  box-sizing: border-box; }\n\nhtml, body {\n  font-size: 100%; }\n\nbody {\n  background: #fff;\n  color: #222;\n  padding: 0;\n  margin: 0;\n  font-family: "Helvetica Neue", Helvetica, Roboto, Arial, sans-serif;\n  font-weight: normal;\n  font-style: normal;\n  line-height: 1.5;\n  position: relative;\n  cursor: auto; }\n\na:hover {\n  cursor: pointer; }\n\nimg {\n  max-width: 100%;\n  height: auto; }\n\nimg {\n  -ms-interpolation-mode: bicubic; }\n\n#map_canvas img, #map_canvas embed, #map_canvas object, .map_canvas img, .map_canvas embed, .map_canvas object {\n  max-width: none !important; }\n\n.left {\n  float: left !important; }\n\n.right {\n  float: right !important; }\n\n.clearfix:before, .clearfix:after {\n  content: " ";\n  display: table; }\n.clearfix:after {\n  clear: both; }\n\n.hide {\n  display: none !important;\n  visibility: hidden; }\n\n.invisible {\n  visibility: hidden; }\n\n.antialiased {\n  -webkit-font-smoothing: antialiased;\n  -moz-osx-font-smoothing: grayscale; }\n\nimg {\n  display: inline-block;\n  vertical-align: middle; }\n\ntextarea {\n  height: auto;\n  min-height: 50px; }\n\nselect {\n  width: 100%; }\n\n.row {\n  width: 100%;\n  margin-left: auto;\n  margin-right: auto;\n  margin-top: 0;\n  margin-bottom: 0;\n  max-width: 62.5rem; }\n  .row:before, .row:after {\n    content: " ";\n    display: table; }\n  .row:after {\n    clear: both; }\n  .row.collapse > .column, .row.collapse > .columns {\n    padding-left: 0;\n    padding-right: 0; }\n  .row.collapse .row {\n    margin-left: 0;\n    margin-right: 0; }\n  .row .row {\n    width: auto;\n    margin-left: -0.9375rem;\n    margin-right: -0.9375rem;\n    margin-top: 0;\n    margin-bottom: 0;\n    max-width: none; }\n    .row .row:before, .row .row:after {\n      content: " ";\n      display: table; }\n    .row .row:after {\n      clear: both; }\n    .row .row.collapse {\n      width: auto;\n      margin: 0;\n      max-width: none; }\n      .row .row.collapse:before, .row .row.collapse:after {\n        content: " ";\n        display: table; }\n      .row .row.collapse:after {\n        clear: both; }\n\n.column, .columns {\n  padding-left: 0.9375rem;\n  padding-right: 0.9375rem;\n  width: 100%;\n  float: left; }\n\n[class*="column"] + [class*="column"]:last-child {\n  float: right; }\n\n[class*="column"] + [class*="column"].end {\n  float: left; }\n\n@media only screen {\n  .small-push-0 {\n    position: relative;\n    left: 0%;\n    right: auto; }\n\n  .small-pull-0 {\n    position: relative;\n    right: 0%;\n    left: auto; }\n\n  .small-push-1 {\n    position: relative;\n    left: 8.3333333333%;\n    right: auto; }\n\n  .small-pull-1 {\n    position: relative;\n    right: 8.3333333333%;\n    left: auto; }\n\n  .small-push-2 {\n    position: relative;\n    left: 16.6666666667%;\n    right: auto; }\n\n  .small-pull-2 {\n    position: relative;\n    right: 16.6666666667%;\n    left: auto; }\n\n  .small-push-3 {\n    position: relative;\n    left: 25%;\n    right: auto; }\n\n  .small-pull-3 {\n    position: relative;\n    right: 25%;\n    left: auto; }\n\n  .small-push-4 {\n    position: relative;\n    left: 33.3333333333%;\n    right: auto; }\n\n  .small-pull-4 {\n    position: relative;\n    right: 33.3333333333%;\n    left: auto; }\n\n  .small-push-5 {\n    position: relative;\n    left: 41.6666666667%;\n    right: auto; }\n\n  .small-pull-5 {\n    position: relative;\n    right: 41.6666666667%;\n    left: auto; }\n\n  .small-push-6 {\n    position: relative;\n    left: 50%;\n    right: auto; }\n\n  .small-pull-6 {\n    position: relative;\n    right: 50%;\n    left: auto; }\n\n  .small-push-7 {\n    position: relative;\n    left: 58.3333333333%;\n    right: auto; }\n\n  .small-pull-7 {\n    position: relative;\n    right: 58.3333333333%;\n    left: auto; }\n\n  .small-push-8 {\n    position: relative;\n    left: 66.6666666667%;\n    right: auto; }\n\n  .small-pull-8 {\n    position: relative;\n    right: 66.6666666667%;\n    left: auto; }\n\n  .small-push-9 {\n    position: relative;\n    left: 75%;\n    right: auto; }\n\n  .small-pull-9 {\n    position: relative;\n    right: 75%;\n    left: auto; }\n\n  .small-push-10 {\n    position: relative;\n    left: 83.3333333333%;\n    right: auto; }\n\n  .small-pull-10 {\n    position: relative;\n    right: 83.3333333333%;\n    left: auto; }\n\n  .small-push-11 {\n    position: relative;\n    left: 91.6666666667%;\n    right: auto; }\n\n  .small-pull-11 {\n    position: relative;\n    right: 91.6666666667%;\n    left: auto; }\n\n  .column, .columns {\n    position: relative;\n    padding-left: 0.9375rem;\n    padding-right: 0.9375rem;\n    float: left; }\n\n  .small-1 {\n    width: 8.3333333333%; }\n\n  .small-2 {\n    width: 16.6666666667%; }\n\n  .small-3 {\n    width: 25%; }\n\n  .small-4 {\n    width: 33.3333333333%; }\n\n  .small-5 {\n    width: 41.6666666667%; }\n\n  .small-6 {\n    width: 50%; }\n\n  .small-7 {\n    width: 58.3333333333%; }\n\n  .small-8 {\n    width: 66.6666666667%; }\n\n  .small-9 {\n    width: 75%; }\n\n  .small-10 {\n    width: 83.3333333333%; }\n\n  .small-11 {\n    width: 91.6666666667%; }\n\n  .small-12 {\n    width: 100%; }\n\n  .small-offset-0 {\n    margin-left: 0% !important; }\n\n  .small-offset-1 {\n    margin-left: 8.3333333333% !important; }\n\n  .small-offset-2 {\n    margin-left: 16.6666666667% !important; }\n\n  .small-offset-3 {\n    margin-left: 25% !important; }\n\n  .small-offset-4 {\n    margin-left: 33.3333333333% !important; }\n\n  .small-offset-5 {\n    margin-left: 41.6666666667% !important; }\n\n  .small-offset-6 {\n    margin-left: 50% !important; }\n\n  .small-offset-7 {\n    margin-left: 58.3333333333% !important; }\n\n  .small-offset-8 {\n    margin-left: 66.6666666667% !important; }\n\n  .small-offset-9 {\n    margin-left: 75% !important; }\n\n  .small-offset-10 {\n    margin-left: 83.3333333333% !important; }\n\n  .small-offset-11 {\n    margin-left: 91.6666666667% !important; }\n\n  .small-reset-order {\n    margin-left: 0;\n    margin-right: 0;\n    left: auto;\n    right: auto;\n    float: left; }\n\n  .column.small-centered, .columns.small-centered {\n    margin-left: auto;\n    margin-right: auto;\n    float: none; }\n\n  .column.small-uncentered, .columns.small-uncentered {\n    margin-left: 0;\n    margin-right: 0;\n    float: left; }\n\n  .column.small-centered:last-child, .columns.small-centered:last-child {\n    float: none; }\n\n  .column.small-uncentered:last-child, .columns.small-uncentered:last-child {\n    float: left; }\n\n  .column.small-uncentered.opposite, .columns.small-uncentered.opposite {\n    float: right; }\n\n  .row.small-collapse > .column, .row.small-collapse > .columns {\n    padding-left: 0;\n    padding-right: 0; }\n  .row.small-collapse .row {\n    margin-left: 0;\n    margin-right: 0; }\n  .row.small-uncollapse > .column, .row.small-uncollapse > .columns {\n    padding-left: 0.9375rem;\n    padding-right: 0.9375rem;\n    float: left; }\n }\n\n@media only screen and (min-width:40.063em) {\n  .medium-push-0 {\n    position: relative;\n    left: 0%;\n    right: auto; }\n\n  .medium-pull-0 {\n    position: relative;\n    right: 0%;\n    left: auto; }\n\n  .medium-push-1 {\n    position: relative;\n    left: 8.3333333333%;\n    right: auto; }\n\n  .medium-pull-1 {\n    position: relative;\n    right: 8.3333333333%;\n    left: auto; }\n\n  .medium-push-2 {\n    position: relative;\n    left: 16.6666666667%;\n    right: auto; }\n\n  .medium-pull-2 {\n    position: relative;\n    right: 16.6666666667%;\n    left: auto; }\n\n  .medium-push-3 {\n    position: relative;\n    left: 25%;\n    right: auto; }\n\n  .medium-pull-3 {\n    position: relative;\n    right: 25%;\n    left: auto; }\n\n  .medium-push-4 {\n    position: relative;\n    left: 33.3333333333%;\n    right: auto; }\n\n  .medium-pull-4 {\n    position: relative;\n    right: 33.3333333333%;\n    left: auto; }\n\n  .medium-push-5 {\n    position: relative;\n    left: 41.6666666667%;\n    right: auto; }\n\n  .medium-pull-5 {\n    position: relative;\n    right: 41.6666666667%;\n    left: auto; }\n\n  .medium-push-6 {\n    position: relative;\n    left: 50%;\n    right: auto; }\n\n  .medium-pull-6 {\n    position: relative;\n    right: 50%;\n    left: auto; }\n\n  .medium-push-7 {\n    position: relative;\n    left: 58.3333333333%;\n    right: auto; }\n\n  .medium-pull-7 {\n    position: relative;\n    right: 58.3333333333%;\n    left: auto; }\n\n  .medium-push-8 {\n    position: relative;\n    left: 66.6666666667%;\n    right: auto; }\n\n  .medium-pull-8 {\n    position: relative;\n    right: 66.6666666667%;\n    left: auto; }\n\n  .medium-push-9 {\n    position: relative;\n    left: 75%;\n    right: auto; }\n\n  .medium-pull-9 {\n    position: relative;\n    right: 75%;\n    left: auto; }\n\n  .medium-push-10 {\n    position: relative;\n    left: 83.3333333333%;\n    right: auto; }\n\n  .medium-pull-10 {\n    position: relative;\n    right: 83.3333333333%;\n    left: auto; }\n\n  .medium-push-11 {\n    position: relative;\n    left: 91.6666666667%;\n    right: auto; }\n\n  .medium-pull-11 {\n    position: relative;\n    right: 91.6666666667%;\n    left: auto; }\n\n  .column, .columns {\n    position: relative;\n    padding-left: 0.9375rem;\n    padding-right: 0.9375rem;\n    float: left; }\n\n  .medium-1 {\n    width: 8.3333333333%; }\n\n  .medium-2 {\n    width: 16.6666666667%; }\n\n  .medium-3 {\n    width: 25%; }\n\n  .medium-4 {\n    width: 33.3333333333%; }\n\n  .medium-5 {\n    width: 41.6666666667%; }\n\n  .medium-6 {\n    width: 50%; }\n\n  .medium-7 {\n    width: 58.3333333333%; }\n\n  .medium-8 {\n    width: 66.6666666667%; }\n\n  .medium-9 {\n    width: 75%; }\n\n  .medium-10 {\n    width: 83.3333333333%; }\n\n  .medium-11 {\n    width: 91.6666666667%; }\n\n  .medium-12 {\n    width: 100%; }\n\n  .medium-offset-0 {\n    margin-left: 0% !important; }\n\n  .medium-offset-1 {\n    margin-left: 8.3333333333% !important; }\n\n  .medium-offset-2 {\n    margin-left: 16.6666666667% !important; }\n\n  .medium-offset-3 {\n    margin-left: 25% !important; }\n\n  .medium-offset-4 {\n    margin-left: 33.3333333333% !important; }\n\n  .medium-offset-5 {\n    margin-left: 41.6666666667% !important; }\n\n  .medium-offset-6 {\n    margin-left: 50% !important; }\n\n  .medium-offset-7 {\n    margin-left: 58.3333333333% !important; }\n\n  .medium-offset-8 {\n    margin-left: 66.6666666667% !important; }\n\n  .medium-offset-9 {\n    margin-left: 75% !important; }\n\n  .medium-offset-10 {\n    margin-left: 83.3333333333% !important; }\n\n  .medium-offset-11 {\n    margin-left: 91.6666666667% !important; }\n\n  .medium-reset-order {\n    margin-left: 0;\n    margin-right: 0;\n    left: auto;\n    right: auto;\n    float: left; }\n\n  .column.medium-centered, .columns.medium-centered {\n    margin-left: auto;\n    margin-right: auto;\n    float: none; }\n\n  .column.medium-uncentered, .columns.medium-uncentered {\n    margin-left: 0;\n    margin-right: 0;\n    float: left; }\n\n  .column.medium-centered:last-child, .columns.medium-centered:last-child {\n    float: none; }\n\n  .column.medium-uncentered:last-child, .columns.medium-uncentered:last-child {\n    float: left; }\n\n  .column.medium-uncentered.opposite, .columns.medium-uncentered.opposite {\n    float: right; }\n\n  .row.medium-collapse > .column, .row.medium-collapse > .columns {\n    padding-left: 0;\n    padding-right: 0; }\n  .row.medium-collapse .row {\n    margin-left: 0;\n    margin-right: 0; }\n  .row.medium-uncollapse > .column, .row.medium-uncollapse > .columns {\n    padding-left: 0.9375rem;\n    padding-right: 0.9375rem;\n    float: left; }\n\n  .push-0 {\n    position: relative;\n    left: 0%;\n    right: auto; }\n\n  .pull-0 {\n    position: relative;\n    right: 0%;\n    left: auto; }\n\n  .push-1 {\n    position: relative;\n    left: 8.3333333333%;\n    right: auto; }\n\n  .pull-1 {\n    position: relative;\n    right: 8.3333333333%;\n    left: auto; }\n\n  .push-2 {\n    position: relative;\n    left: 16.6666666667%;\n    right: auto; }\n\n  .pull-2 {\n    position: relative;\n    right: 16.6666666667%;\n    left: auto; }\n\n  .push-3 {\n    position: relative;\n    left: 25%;\n    right: auto; }\n\n  .pull-3 {\n    position: relative;\n    right: 25%;\n    left: auto; }\n\n  .push-4 {\n    position: relative;\n    left: 33.3333333333%;\n    right: auto; }\n\n  .pull-4 {\n    position: relative;\n    right: 33.3333333333%;\n    left: auto; }\n\n  .push-5 {\n    position: relative;\n    left: 41.6666666667%;\n    right: auto; }\n\n  .pull-5 {\n    position: relative;\n    right: 41.6666666667%;\n    left: auto; }\n\n  .push-6 {\n    position: relative;\n    left: 50%;\n    right: auto; }\n\n  .pull-6 {\n    position: relative;\n    right: 50%;\n    left: auto; }\n\n  .push-7 {\n    position: relative;\n    left: 58.3333333333%;\n    right: auto; }\n\n  .pull-7 {\n    position: relative;\n    right: 58.3333333333%;\n    left: auto; }\n\n  .push-8 {\n    position: relative;\n    left: 66.6666666667%;\n    right: auto; }\n\n  .pull-8 {\n    position: relative;\n    right: 66.6666666667%;\n    left: auto; }\n\n  .push-9 {\n    position: relative;\n    left: 75%;\n    right: auto; }\n\n  .pull-9 {\n    position: relative;\n    right: 75%;\n    left: auto; }\n\n  .push-10 {\n    position: relative;\n    left: 83.3333333333%;\n    right: auto; }\n\n  .pull-10 {\n    position: relative;\n    right: 83.3333333333%;\n    left: auto; }\n\n  .push-11 {\n    position: relative;\n    left: 91.6666666667%;\n    right: auto; }\n\n  .pull-11 {\n    position: relative;\n    right: 91.6666666667%;\n    left: auto; }\n }\n\n@media only screen and (min-width:64.063em) {\n  .large-push-0 {\n    position: relative;\n    left: 0%;\n    right: auto; }\n\n  .large-pull-0 {\n    position: relative;\n    right: 0%;\n    left: auto; }\n\n  .large-push-1 {\n    position: relative;\n    left: 8.3333333333%;\n    right: auto; }\n\n  .large-pull-1 {\n    position: relative;\n    right: 8.3333333333%;\n    left: auto; }\n\n  .large-push-2 {\n    position: relative;\n    left: 16.6666666667%;\n    right: auto; }\n\n  .large-pull-2 {\n    position: relative;\n    right: 16.6666666667%;\n    left: auto; }\n\n  .large-push-3 {\n    position: relative;\n    left: 25%;\n    right: auto; }\n\n  .large-pull-3 {\n    position: relative;\n    right: 25%;\n    left: auto; }\n\n  .large-push-4 {\n    position: relative;\n    left: 33.3333333333%;\n    right: auto; }\n\n  .large-pull-4 {\n    position: relative;\n    right: 33.3333333333%;\n    left: auto; }\n\n  .large-push-5 {\n    position: relative;\n    left: 41.6666666667%;\n    right: auto; }\n\n  .large-pull-5 {\n    position: relative;\n    right: 41.6666666667%;\n    left: auto; }\n\n  .large-push-6 {\n    position: relative;\n    left: 50%;\n    right: auto; }\n\n  .large-pull-6 {\n    position: relative;\n    right: 50%;\n    left: auto; }\n\n  .large-push-7 {\n    position: relative;\n    left: 58.3333333333%;\n    right: auto; }\n\n  .large-pull-7 {\n    position: relative;\n    right: 58.3333333333%;\n    left: auto; }\n\n  .large-push-8 {\n    position: relative;\n    left: 66.6666666667%;\n    right: auto; }\n\n  .large-pull-8 {\n    position: relative;\n    right: 66.6666666667%;\n    left: auto; }\n\n  .large-push-9 {\n    position: relative;\n    left: 75%;\n    right: auto; }\n\n  .large-pull-9 {\n    position: relative;\n    right: 75%;\n    left: auto; }\n\n  .large-push-10 {\n    position: relative;\n    left: 83.3333333333%;\n    right: auto; }\n\n  .large-pull-10 {\n    position: relative;\n    right: 83.3333333333%;\n    left: auto; }\n\n  .large-push-11 {\n    position: relative;\n    left: 91.6666666667%;\n    right: auto; }\n\n  .large-pull-11 {\n    position: relative;\n    right: 91.6666666667%;\n    left: auto; }\n\n  .column, .columns {\n    position: relative;\n    padding-left: 0.9375rem;\n    padding-right: 0.9375rem;\n    float: left; }\n\n  .large-1 {\n    width: 8.3333333333%; }\n\n  .large-2 {\n    width: 16.6666666667%; }\n\n  .large-3 {\n    width: 25%; }\n\n  .large-4 {\n    width: 33.3333333333%; }\n\n  .large-5 {\n    width: 41.6666666667%; }\n\n  .large-6 {\n    width: 50%; }\n\n  .large-7 {\n    width: 58.3333333333%; }\n\n  .large-8 {\n    width: 66.6666666667%; }\n\n  .large-9 {\n    width: 75%; }\n\n  .large-10 {\n    width: 83.3333333333%; }\n\n  .large-11 {\n    width: 91.6666666667%; }\n\n  .large-12 {\n    width: 100%; }\n\n  .large-offset-0 {\n    margin-left: 0% !important; }\n\n  .large-offset-1 {\n    margin-left: 8.3333333333% !important; }\n\n  .large-offset-2 {\n    margin-left: 16.6666666667% !important; }\n\n  .large-offset-3 {\n    margin-left: 25% !important; }\n\n  .large-offset-4 {\n    margin-left: 33.3333333333% !important; }\n\n  .large-offset-5 {\n    margin-left: 41.6666666667% !important; }\n\n  .large-offset-6 {\n    margin-left: 50% !important; }\n\n  .large-offset-7 {\n    margin-left: 58.3333333333% !important; }\n\n  .large-offset-8 {\n    margin-left: 66.6666666667% !important; }\n\n  .large-offset-9 {\n    margin-left: 75% !important; }\n\n  .large-offset-10 {\n    margin-left: 83.3333333333% !important; }\n\n  .large-offset-11 {\n    margin-left: 91.6666666667% !important; }\n\n  .large-reset-order {\n    margin-left: 0;\n    margin-right: 0;\n    left: auto;\n    right: auto;\n    float: left; }\n\n  .column.large-centered, .columns.large-centered {\n    margin-left: auto;\n    margin-right: auto;\n    float: none; }\n\n  .column.large-uncentered, .columns.large-uncentered {\n    margin-left: 0;\n    margin-right: 0;\n    float: left; }\n\n  .column.large-centered:last-child, .columns.large-centered:last-child {\n    float: none; }\n\n  .column.large-uncentered:last-child, .columns.large-uncentered:last-child {\n    float: left; }\n\n  .column.large-uncentered.opposite, .columns.large-uncentered.opposite {\n    float: right; }\n\n  .row.large-collapse > .column, .row.large-collapse > .columns {\n    padding-left: 0;\n    padding-right: 0; }\n  .row.large-collapse .row {\n    margin-left: 0;\n    margin-right: 0; }\n  .row.large-uncollapse > .column, .row.large-uncollapse > .columns {\n    padding-left: 0.9375rem;\n    padding-right: 0.9375rem;\n    float: left; }\n\n  .push-0 {\n    position: relative;\n    left: 0%;\n    right: auto; }\n\n  .pull-0 {\n    position: relative;\n    right: 0%;\n    left: auto; }\n\n  .push-1 {\n    position: relative;\n    left: 8.3333333333%;\n    right: auto; }\n\n  .pull-1 {\n    position: relative;\n    right: 8.3333333333%;\n    left: auto; }\n\n  .push-2 {\n    position: relative;\n    left: 16.6666666667%;\n    right: auto; }\n\n  .pull-2 {\n    position: relative;\n    right: 16.6666666667%;\n    left: auto; }\n\n  .push-3 {\n    position: relative;\n    left: 25%;\n    right: auto; }\n\n  .pull-3 {\n    position: relative;\n    right: 25%;\n    left: auto; }\n\n  .push-4 {\n    position: relative;\n    left: 33.3333333333%;\n    right: auto; }\n\n  .pull-4 {\n    position: relative;\n    right: 33.3333333333%;\n    left: auto; }\n\n  .push-5 {\n    position: relative;\n    left: 41.6666666667%;\n    right: auto; }\n\n  .pull-5 {\n    position: relative;\n    right: 41.6666666667%;\n    left: auto; }\n\n  .push-6 {\n    position: relative;\n    left: 50%;\n    right: auto; }\n\n  .pull-6 {\n    position: relative;\n    right: 50%;\n    left: auto; }\n\n  .push-7 {\n    position: relative;\n    left: 58.3333333333%;\n    right: auto; }\n\n  .pull-7 {\n    position: relative;\n    right: 58.3333333333%;\n    left: auto; }\n\n  .push-8 {\n    position: relative;\n    left: 66.6666666667%;\n    right: auto; }\n\n  .pull-8 {\n    position: relative;\n    right: 66.6666666667%;\n    left: auto; }\n\n  .push-9 {\n    position: relative;\n    left: 75%;\n    right: auto; }\n\n  .pull-9 {\n    position: relative;\n    right: 75%;\n    left: auto; }\n\n  .push-10 {\n    position: relative;\n    left: 83.3333333333%;\n    right: auto; }\n\n  .pull-10 {\n    position: relative;\n    right: 83.3333333333%;\n    left: auto; }\n\n  .push-11 {\n    position: relative;\n    left: 91.6666666667%;\n    right: auto; }\n\n  .pull-11 {\n    position: relative;\n    right: 91.6666666667%;\n    left: auto; }\n }\n\n.accordion {\n  margin-bottom: 0; }\n  .accordion:before, .accordion:after {\n    content: " ";\n    display: table; }\n  .accordion:after {\n    clear: both; }\n  .accordion .accordion-navigation, .accordion dd {\n    display: block;\n    margin-bottom: 0 !important; }\n    .accordion .accordion-navigation.active > a, .accordion dd.active > a {\n      background: #e8e8e8; }\n    .accordion .accordion-navigation > a, .accordion dd > a {\n      background: #EFEFEF;\n      color: #222222;\n      padding: 1rem;\n      display: block;\n      font-family: "Helvetica Neue", Helvetica, Roboto, Arial, sans-serif;\n      font-size: 1rem; }\n      .accordion .accordion-navigation > a:hover, .accordion dd > a:hover {\n        background: #e3e3e3; }\n    .accordion .accordion-navigation > .content, .accordion dd > .content {\n      display: none;\n      padding: 0.9375rem; }\n      .accordion .accordion-navigation > .content.active, .accordion dd > .content.active {\n        display: block;\n        background: #FFFFFF; }\n\n.alert-box {\n  border-style: solid;\n  border-width: 1px;\n  display: block;\n  font-weight: normal;\n  margin-bottom: 1.25rem;\n  position: relative;\n  padding: 0.875rem 1.5rem 0.875rem 0.875rem;\n  font-size: 0.8125rem;\n  transition: opacity 300ms ease-out;\n  background-color: #008CBA;\n  border-color: #0078a0;\n  color: #FFFFFF; }\n  .alert-box .close {\n    font-size: 1.375rem;\n    padding: 9px 6px 4px;\n    line-height: 0;\n    position: absolute;\n    top: 50%;\n    margin-top: -0.6875rem;\n    right: 0.25rem;\n    color: #333333;\n    opacity: 0.3;\n    background: inherit; }\n    .alert-box .close:hover, .alert-box .close:focus {\n      opacity: 0.5; }\n  .alert-box.radius {\n    border-radius: 3px; }\n  .alert-box.round {\n    border-radius: 1000px; }\n  .alert-box.success {\n    background-color: #43AC6A;\n    border-color: #3a945b;\n    color: #FFFFFF; }\n  .alert-box.alert {\n    background-color: #f04124;\n    border-color: #de2d0f;\n    color: #FFFFFF; }\n  .alert-box.secondary {\n    background-color: #e7e7e7;\n    border-color: #c7c7c7;\n    color: #4f4f4f; }\n  .alert-box.warning {\n    background-color: #f08a24;\n    border-color: #de770f;\n    color: #FFFFFF; }\n  .alert-box.info {\n    background-color: #a0d3e8;\n    border-color: #74bfdd;\n    color: #4f4f4f; }\n  .alert-box.alert-close {\n    opacity: 0; }\n\n[class*="block-grid-"] {\n  display: block;\n  padding: 0;\n  margin: 0 -0.625rem; }\n  [class*="block-grid-"]:before, [class*="block-grid-"]:after {\n    content: " ";\n    display: table; }\n  [class*="block-grid-"]:after {\n    clear: both; }\n  [class*="block-grid-"] > li {\n    display: block;\n    height: auto;\n    float: left;\n    padding: 0 0.625rem 1.25rem; }\n\n@media only screen {\n  .small-block-grid-1 > li {\n    width: 100%;\n    list-style: none; }\n    .small-block-grid-1 > li:nth-of-type(1n) {\n      clear: none; }\n    .small-block-grid-1 > li:nth-of-type(1n+1) {\n      clear: both; }\n\n  .small-block-grid-2 > li {\n    width: 50%;\n    list-style: none; }\n    .small-block-grid-2 > li:nth-of-type(1n) {\n      clear: none; }\n    .small-block-grid-2 > li:nth-of-type(2n+1) {\n      clear: both; }\n\n  .small-block-grid-3 > li {\n    width: 33.3333333333%;\n    list-style: none; }\n    .small-block-grid-3 > li:nth-of-type(1n) {\n      clear: none; }\n    .small-block-grid-3 > li:nth-of-type(3n+1) {\n      clear: both; }\n\n  .small-block-grid-4 > li {\n    width: 25%;\n    list-style: none; }\n    .small-block-grid-4 > li:nth-of-type(1n) {\n      clear: none; }\n    .small-block-grid-4 > li:nth-of-type(4n+1) {\n      clear: both; }\n\n  .small-block-grid-5 > li {\n    width: 20%;\n    list-style: none; }\n    .small-block-grid-5 > li:nth-of-type(1n) {\n      clear: none; }\n    .small-block-grid-5 > li:nth-of-type(5n+1) {\n      clear: both; }\n\n  .small-block-grid-6 > li {\n    width: 16.6666666667%;\n    list-style: none; }\n    .small-block-grid-6 > li:nth-of-type(1n) {\n      clear: none; }\n    .small-block-grid-6 > li:nth-of-type(6n+1) {\n      clear: both; }\n\n  .small-block-grid-7 > li {\n    width: 14.2857142857%;\n    list-style: none; }\n    .small-block-grid-7 > li:nth-of-type(1n) {\n      clear: none; }\n    .small-block-grid-7 > li:nth-of-type(7n+1) {\n      clear: both; }\n\n  .small-block-grid-8 > li {\n    width: 12.5%;\n    list-style: none; }\n    .small-block-grid-8 > li:nth-of-type(1n) {\n      clear: none; }\n    .small-block-grid-8 > li:nth-of-type(8n+1) {\n      clear: both; }\n\n  .small-block-grid-9 > li {\n    width: 11.1111111111%;\n    list-style: none; }\n    .small-block-grid-9 > li:nth-of-type(1n) {\n      clear: none; }\n    .small-block-grid-9 > li:nth-of-type(9n+1) {\n      clear: both; }\n\n  .small-block-grid-10 > li {\n    width: 10%;\n    list-style: none; }\n    .small-block-grid-10 > li:nth-of-type(1n) {\n      clear: none; }\n    .small-block-grid-10 > li:nth-of-type(10n+1) {\n      clear: both; }\n\n  .small-block-grid-11 > li {\n    width: 9.0909090909%;\n    list-style: none; }\n    .small-block-grid-11 > li:nth-of-type(1n) {\n      clear: none; }\n    .small-block-grid-11 > li:nth-of-type(11n+1) {\n      clear: both; }\n\n  .small-block-grid-12 > li {\n    width: 8.3333333333%;\n    list-style: none; }\n    .small-block-grid-12 > li:nth-of-type(1n) {\n      clear: none; }\n    .small-block-grid-12 > li:nth-of-type(12n+1) {\n      clear: both; }\n }\n\n@media only screen and (min-width:40.063em) {\n  .medium-block-grid-1 > li {\n    width: 100%;\n    list-style: none; }\n    .medium-block-grid-1 > li:nth-of-type(1n) {\n      clear: none; }\n    .medium-block-grid-1 > li:nth-of-type(1n+1) {\n      clear: both; }\n\n  .medium-block-grid-2 > li {\n    width: 50%;\n    list-style: none; }\n    .medium-block-grid-2 > li:nth-of-type(1n) {\n      clear: none; }\n    .medium-block-grid-2 > li:nth-of-type(2n+1) {\n      clear: both; }\n\n  .medium-block-grid-3 > li {\n    width: 33.3333333333%;\n    list-style: none; }\n    .medium-block-grid-3 > li:nth-of-type(1n) {\n      clear: none; }\n    .medium-block-grid-3 > li:nth-of-type(3n+1) {\n      clear: both; }\n\n  .medium-block-grid-4 > li {\n    width: 25%;\n    list-style: none; }\n    .medium-block-grid-4 > li:nth-of-type(1n) {\n      clear: none; }\n    .medium-block-grid-4 > li:nth-of-type(4n+1) {\n      clear: both; }\n\n  .medium-block-grid-5 > li {\n    width: 20%;\n    list-style: none; }\n    .medium-block-grid-5 > li:nth-of-type(1n) {\n      clear: none; }\n    .medium-block-grid-5 > li:nth-of-type(5n+1) {\n      clear: both; }\n\n  .medium-block-grid-6 > li {\n    width: 16.6666666667%;\n    list-style: none; }\n    .medium-block-grid-6 > li:nth-of-type(1n) {\n      clear: none; }\n    .medium-block-grid-6 > li:nth-of-type(6n+1) {\n      clear: both; }\n\n  .medium-block-grid-7 > li {\n    width: 14.2857142857%;\n    list-style: none; }\n    .medium-block-grid-7 > li:nth-of-type(1n) {\n      clear: none; }\n    .medium-block-grid-7 > li:nth-of-type(7n+1) {\n      clear: both; }\n\n  .medium-block-grid-8 > li {\n    width: 12.5%;\n    list-style: none; }\n    .medium-block-grid-8 > li:nth-of-type(1n) {\n      clear: none; }\n    .medium-block-grid-8 > li:nth-of-type(8n+1) {\n      clear: both; }\n\n  .medium-block-grid-9 > li {\n    width: 11.1111111111%;\n    list-style: none; }\n    .medium-block-grid-9 > li:nth-of-type(1n) {\n      clear: none; }\n    .medium-block-grid-9 > li:nth-of-type(9n+1) {\n      clear: both; }\n\n  .medium-block-grid-10 > li {\n    width: 10%;\n    list-style: none; }\n    .medium-block-grid-10 > li:nth-of-type(1n) {\n      clear: none; }\n    .medium-block-grid-10 > li:nth-of-type(10n+1) {\n      clear: both; }\n\n  .medium-block-grid-11 > li {\n    width: 9.0909090909%;\n    list-style: none; }\n    .medium-block-grid-11 > li:nth-of-type(1n) {\n      clear: none; }\n    .medium-block-grid-11 > li:nth-of-type(11n+1) {\n      clear: both; }\n\n  .medium-block-grid-12 > li {\n    width: 8.3333333333%;\n    list-style: none; }\n    .medium-block-grid-12 > li:nth-of-type(1n) {\n      clear: none; }\n    .medium-block-grid-12 > li:nth-of-type(12n+1) {\n      clear: both; }\n }\n\n@media only screen and (min-width:64.063em) {\n  .large-block-grid-1 > li {\n    width: 100%;\n    list-style: none; }\n    .large-block-grid-1 > li:nth-of-type(1n) {\n      clear: none; }\n    .large-block-grid-1 > li:nth-of-type(1n+1) {\n      clear: both; }\n\n  .large-block-grid-2 > li {\n    width: 50%;\n    list-style: none; }\n    .large-block-grid-2 > li:nth-of-type(1n) {\n      clear: none; }\n    .large-block-grid-2 > li:nth-of-type(2n+1) {\n      clear: both; }\n\n  .large-block-grid-3 > li {\n    width: 33.3333333333%;\n    list-style: none; }\n    .large-block-grid-3 > li:nth-of-type(1n) {\n      clear: none; }\n    .large-block-grid-3 > li:nth-of-type(3n+1) {\n      clear: both; }\n\n  .large-block-grid-4 > li {\n    width: 25%;\n    list-style: none; }\n    .large-block-grid-4 > li:nth-of-type(1n) {\n      clear: none; }\n    .large-block-grid-4 > li:nth-of-type(4n+1) {\n      clear: both; }\n\n  .large-block-grid-5 > li {\n    width: 20%;\n    list-style: none; }\n    .large-block-grid-5 > li:nth-of-type(1n) {\n      clear: none; }\n    .large-block-grid-5 > li:nth-of-type(5n+1) {\n      clear: both; }\n\n  .large-block-grid-6 > li {\n    width: 16.6666666667%;\n    list-style: none; }\n    .large-block-grid-6 > li:nth-of-type(1n) {\n      clear: none; }\n    .large-block-grid-6 > li:nth-of-type(6n+1) {\n      clear: both; }\n\n  .large-block-grid-7 > li {\n    width: 14.2857142857%;\n    list-style: none; }\n    .large-block-grid-7 > li:nth-of-type(1n) {\n      clear: none; }\n    .large-block-grid-7 > li:nth-of-type(7n+1) {\n      clear: both; }\n\n  .large-block-grid-8 > li {\n    width: 12.5%;\n    list-style: none; }\n    .large-block-grid-8 > li:nth-of-type(1n) {\n      clear: none; }\n    .large-block-grid-8 > li:nth-of-type(8n+1) {\n      clear: both; }\n\n  .large-block-grid-9 > li {\n    width: 11.1111111111%;\n    list-style: none; }\n    .large-block-grid-9 > li:nth-of-type(1n) {\n      clear: none; }\n    .large-block-grid-9 > li:nth-of-type(9n+1) {\n      clear: both; }\n\n  .large-block-grid-10 > li {\n    width: 10%;\n    list-style: none; }\n    .large-block-grid-10 > li:nth-of-type(1n) {\n      clear: none; }\n    .large-block-grid-10 > li:nth-of-type(10n+1) {\n      clear: both; }\n\n  .large-block-grid-11 > li {\n    width: 9.0909090909%;\n    list-style: none; }\n    .large-block-grid-11 > li:nth-of-type(1n) {\n      clear: none; }\n    .large-block-grid-11 > li:nth-of-type(11n+1) {\n      clear: both; }\n\n  .large-block-grid-12 > li {\n    width: 8.3333333333%;\n    list-style: none; }\n    .large-block-grid-12 > li:nth-of-type(1n) {\n      clear: none; }\n    .large-block-grid-12 > li:nth-of-type(12n+1) {\n      clear: both; }\n }\n\n.breadcrumbs {\n  display: block;\n  padding: 0.5625rem 0.875rem 0.5625rem;\n  overflow: hidden;\n  margin-left: 0;\n  list-style: none;\n  border-style: solid;\n  border-width: 1px;\n  background-color: #f4f4f4;\n  border-color: gainsboro;\n  border-radius: 3px; }\n  .breadcrumbs > * {\n    margin: 0;\n    float: left;\n    font-size: 0.6875rem;\n    line-height: 0.6875rem;\n    text-transform: uppercase;\n    color: #008CBA; }\n    .breadcrumbs > *:hover a, .breadcrumbs > *:focus a {\n      text-decoration: underline; }\n    .breadcrumbs > * a {\n      color: #008CBA; }\n    .breadcrumbs > *.current {\n      cursor: default;\n      color: #333333; }\n      .breadcrumbs > *.current a {\n        cursor: default;\n        color: #333333; }\n      .breadcrumbs > *.current:hover, .breadcrumbs > *.current:hover a, .breadcrumbs > *.current:focus, .breadcrumbs > *.current:focus a {\n        text-decoration: none; }\n    .breadcrumbs > *.unavailable {\n      color: #999999; }\n      .breadcrumbs > *.unavailable a {\n        color: #999999; }\n      .breadcrumbs > *.unavailable:hover, .breadcrumbs > *.unavailable:hover a, .breadcrumbs > *.unavailable:focus, .breadcrumbs > *.unavailable a:focus {\n        text-decoration: none;\n        color: #999999;\n        cursor: default; }\n    .breadcrumbs > *:before {\n      content: "/";\n      color: #AAAAAA;\n      margin: 0 0.75rem;\n      position: relative;\n      top: 1px; }\n    .breadcrumbs > *:first-child:before {\n      content: " ";\n      margin: 0; }\n\n/* Accessibility - hides the forward slash */\n[aria-label="breadcrumbs"] [aria-hidden="true"]:after {\n  content: "/"; }\n\nbutton, .button {\n  border-style: solid;\n  border-width: 0;\n  cursor: pointer;\n  font-family: "Helvetica Neue", Helvetica, Roboto, Arial, sans-serif;\n  font-weight: normal;\n  line-height: normal;\n  margin: 0 0 1.25rem;\n  position: relative;\n  text-decoration: none;\n  text-align: center;\n  -webkit-appearance: none;\n  border-radius: 0;\n  display: inline-block;\n  padding-top: 1rem;\n  padding-right: 2rem;\n  padding-bottom: 1.0625rem;\n  padding-left: 2rem;\n  font-size: 1rem;\n  background-color: #008CBA;\n  border-color: #007095;\n  color: #FFFFFF;\n  transition: background-color 300ms ease-out; }\n  button:hover, button:focus, .button:hover, .button:focus {\n    background-color: #007095; }\n  button:hover, button:focus, .button:hover, .button:focus {\n    color: #FFFFFF; }\n  button.secondary, .button.secondary {\n    background-color: #e7e7e7;\n    border-color: #b9b9b9;\n    color: #333333; }\n    button.secondary:hover, button.secondary:focus, .button.secondary:hover, .button.secondary:focus {\n      background-color: #b9b9b9; }\n    button.secondary:hover, button.secondary:focus, .button.secondary:hover, .button.secondary:focus {\n      color: #333333; }\n  button.success, .button.success {\n    background-color: #43AC6A;\n    border-color: #368a55;\n    color: #FFFFFF; }\n    button.success:hover, button.success:focus, .button.success:hover, .button.success:focus {\n      background-color: #368a55; }\n    button.success:hover, button.success:focus, .button.success:hover, .button.success:focus {\n      color: #FFFFFF; }\n  button.alert, .button.alert {\n    background-color: #f04124;\n    border-color: #cf2a0e;\n    color: #FFFFFF; }\n    button.alert:hover, button.alert:focus, .button.alert:hover, .button.alert:focus {\n      background-color: #cf2a0e; }\n    button.alert:hover, button.alert:focus, .button.alert:hover, .button.alert:focus {\n      color: #FFFFFF; }\n  button.warning, .button.warning {\n    background-color: #f08a24;\n    border-color: #cf6e0e;\n    color: #FFFFFF; }\n    button.warning:hover, button.warning:focus, .button.warning:hover, .button.warning:focus {\n      background-color: #cf6e0e; }\n    button.warning:hover, button.warning:focus, .button.warning:hover, .button.warning:focus {\n      color: #FFFFFF; }\n  button.info, .button.info {\n    background-color: #a0d3e8;\n    border-color: #61b6d9;\n    color: #333333; }\n    button.info:hover, button.info:focus, .button.info:hover, .button.info:focus {\n      background-color: #61b6d9; }\n    button.info:hover, button.info:focus, .button.info:hover, .button.info:focus {\n      color: #FFFFFF; }\n  button.large, .button.large {\n    padding-top: 1.125rem;\n    padding-right: 2.25rem;\n    padding-bottom: 1.1875rem;\n    padding-left: 2.25rem;\n    font-size: 1.25rem; }\n  button.small, .button.small {\n    padding-top: 0.875rem;\n    padding-right: 1.75rem;\n    padding-bottom: 0.9375rem;\n    padding-left: 1.75rem;\n    font-size: 0.8125rem; }\n  button.tiny, .button.tiny {\n    padding-top: 0.625rem;\n    padding-right: 1.25rem;\n    padding-bottom: 0.6875rem;\n    padding-left: 1.25rem;\n    font-size: 0.6875rem; }\n  button.expand, .button.expand {\n    padding-right: 0;\n    padding-left: 0;\n    width: 100%; }\n  button.left-align, .button.left-align {\n    text-align: left;\n    text-indent: 0.75rem; }\n  button.right-align, .button.right-align {\n    text-align: right;\n    padding-right: 0.75rem; }\n  button.radius, .button.radius {\n    border-radius: 3px; }\n  button.round, .button.round {\n    border-radius: 1000px; }\n  button.disabled, button[disabled], .button.disabled, .button[disabled] {\n    background-color: #008CBA;\n    border-color: #007095;\n    color: #FFFFFF;\n    cursor: default;\n    opacity: 0.7;\n    box-shadow: none; }\n    button.disabled:hover, button.disabled:focus, button[disabled]:hover, button[disabled]:focus, .button.disabled:hover, .button.disabled:focus, .button[disabled]:hover, .button[disabled]:focus {\n      background-color: #007095; }\n    button.disabled:hover, button.disabled:focus, button[disabled]:hover, button[disabled]:focus, .button.disabled:hover, .button.disabled:focus, .button[disabled]:hover, .button[disabled]:focus {\n      color: #FFFFFF; }\n    button.disabled:hover, button.disabled:focus, button[disabled]:hover, button[disabled]:focus, .button.disabled:hover, .button.disabled:focus, .button[disabled]:hover, .button[disabled]:focus {\n      background-color: #008CBA; }\n    button.disabled.secondary, button[disabled].secondary, .button.disabled.secondary, .button[disabled].secondary {\n      background-color: #e7e7e7;\n      border-color: #b9b9b9;\n      color: #333333;\n      cursor: default;\n      opacity: 0.7;\n      box-shadow: none; }\n      button.disabled.secondary:hover, button.disabled.secondary:focus, button[disabled].secondary:hover, button[disabled].secondary:focus, .button.disabled.secondary:hover, .button.disabled.secondary:focus, .button[disabled].secondary:hover, .button[disabled].secondary:focus {\n        background-color: #b9b9b9; }\n      button.disabled.secondary:hover, button.disabled.secondary:focus, button[disabled].secondary:hover, button[disabled].secondary:focus, .button.disabled.secondary:hover, .button.disabled.secondary:focus, .button[disabled].secondary:hover, .button[disabled].secondary:focus {\n        color: #333333; }\n      button.disabled.secondary:hover, button.disabled.secondary:focus, button[disabled].secondary:hover, button[disabled].secondary:focus, .button.disabled.secondary:hover, .button.disabled.secondary:focus, .button[disabled].secondary:hover, .button[disabled].secondary:focus {\n        background-color: #e7e7e7; }\n    button.disabled.success, button[disabled].success, .button.disabled.success, .button[disabled].success {\n      background-color: #43AC6A;\n      border-color: #368a55;\n      color: #FFFFFF;\n      cursor: default;\n      opacity: 0.7;\n      box-shadow: none; }\n      button.disabled.success:hover, button.disabled.success:focus, button[disabled].success:hover, button[disabled].success:focus, .button.disabled.success:hover, .button.disabled.success:focus, .button[disabled].success:hover, .button[disabled].success:focus {\n        background-color: #368a55; }\n      button.disabled.success:hover, button.disabled.success:focus, button[disabled].success:hover, button[disabled].success:focus, .button.disabled.success:hover, .button.disabled.success:focus, .button[disabled].success:hover, .button[disabled].success:focus {\n        color: #FFFFFF; }\n      button.disabled.success:hover, button.disabled.success:focus, button[disabled].success:hover, button[disabled].success:focus, .button.disabled.success:hover, .button.disabled.success:focus, .button[disabled].success:hover, .button[disabled].success:focus {\n        background-color: #43AC6A; }\n    button.disabled.alert, button[disabled].alert, .button.disabled.alert, .button[disabled].alert {\n      background-color: #f04124;\n      border-color: #cf2a0e;\n      color: #FFFFFF;\n      cursor: default;\n      opacity: 0.7;\n      box-shadow: none; }\n      button.disabled.alert:hover, button.disabled.alert:focus, button[disabled].alert:hover, button[disabled].alert:focus, .button.disabled.alert:hover, .button.disabled.alert:focus, .button[disabled].alert:hover, .button[disabled].alert:focus {\n        background-color: #cf2a0e; }\n      button.disabled.alert:hover, button.disabled.alert:focus, button[disabled].alert:hover, button[disabled].alert:focus, .button.disabled.alert:hover, .button.disabled.alert:focus, .button[disabled].alert:hover, .button[disabled].alert:focus {\n        color: #FFFFFF; }\n      button.disabled.alert:hover, button.disabled.alert:focus, button[disabled].alert:hover, button[disabled].alert:focus, .button.disabled.alert:hover, .button.disabled.alert:focus, .button[disabled].alert:hover, .button[disabled].alert:focus {\n        background-color: #f04124; }\n    button.disabled.warning, button[disabled].warning, .button.disabled.warning, .button[disabled].warning {\n      background-color: #f08a24;\n      border-color: #cf6e0e;\n      color: #FFFFFF;\n      cursor: default;\n      opacity: 0.7;\n      box-shadow: none; }\n      button.disabled.warning:hover, button.disabled.warning:focus, button[disabled].warning:hover, button[disabled].warning:focus, .button.disabled.warning:hover, .button.disabled.warning:focus, .button[disabled].warning:hover, .button[disabled].warning:focus {\n        background-color: #cf6e0e; }\n      button.disabled.warning:hover, button.disabled.warning:focus, button[disabled].warning:hover, button[disabled].warning:focus, .button.disabled.warning:hover, .button.disabled.warning:focus, .button[disabled].warning:hover, .button[disabled].warning:focus {\n        color: #FFFFFF; }\n      button.disabled.warning:hover, button.disabled.warning:focus, button[disabled].warning:hover, button[disabled].warning:focus, .button.disabled.warning:hover, .button.disabled.warning:focus, .button[disabled].warning:hover, .button[disabled].warning:focus {\n        background-color: #f08a24; }\n    button.disabled.info, button[disabled].info, .button.disabled.info, .button[disabled].info {\n      background-color: #a0d3e8;\n      border-color: #61b6d9;\n      color: #333333;\n      cursor: default;\n      opacity: 0.7;\n      box-shadow: none; }\n      button.disabled.info:hover, button.disabled.info:focus, button[disabled].info:hover, button[disabled].info:focus, .button.disabled.info:hover, .button.disabled.info:focus, .button[disabled].info:hover, .button[disabled].info:focus {\n        background-color: #61b6d9; }\n      button.disabled.info:hover, button.disabled.info:focus, button[disabled].info:hover, button[disabled].info:focus, .button.disabled.info:hover, .button.disabled.info:focus, .button[disabled].info:hover, .button[disabled].info:focus {\n        color: #FFFFFF; }\n      button.disabled.info:hover, button.disabled.info:focus, button[disabled].info:hover, button[disabled].info:focus, .button.disabled.info:hover, .button.disabled.info:focus, .button[disabled].info:hover, .button[disabled].info:focus {\n        background-color: #a0d3e8; }\n\nbutton::-moz-focus-inner {\n  border: 0;\n  padding: 0; }\n\n@media only screen and (min-width:40.063em) {\n  button, .button {\n    display: inline-block; }\n }\n\n.button-group {\n  list-style: none;\n  margin: 0;\n  left: 0; }\n  .button-group:before, .button-group:after {\n    content: " ";\n    display: table; }\n  .button-group:after {\n    clear: both; }\n  .button-group > li {\n    margin: 0 -2px;\n    display: inline-block; }\n    .button-group > li > button, .button-group > li .button {\n      border-left: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5); }\n    .button-group > li:first-child button, .button-group > li:first-child .button {\n      border-left: 0; }\n  .button-group.stack > li {\n    margin: 0 -2px;\n    display: inline-block;\n    display: block;\n    margin: 0;\n    float: none; }\n    .button-group.stack > li > button, .button-group.stack > li .button {\n      border-left: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5); }\n    .button-group.stack > li:first-child button, .button-group.stack > li:first-child .button {\n      border-left: 0; }\n    .button-group.stack > li > button, .button-group.stack > li .button {\n      border-top: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5);\n      border-left-width: 0;\n      margin: 0;\n      display: block; }\n    .button-group.stack > li:first-child button, .button-group.stack > li:first-child .button {\n      border-top: 0; }\n  .button-group.stack-for-small > li {\n    margin: 0 -2px;\n    display: inline-block; }\n    .button-group.stack-for-small > li > button, .button-group.stack-for-small > li .button {\n      border-left: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5); }\n    .button-group.stack-for-small > li:first-child button, .button-group.stack-for-small > li:first-child .button {\n      border-left: 0; }\n    @media only screen and (max-width: 40em) {\n      .button-group.stack-for-small > li {\n        margin: 0 -2px;\n        display: inline-block;\n        display: block;\n        margin: 0; }\n        .button-group.stack-for-small > li > button, .button-group.stack-for-small > li .button {\n          border-left: 1px solid;\n          border-color: rgba(255, 255, 255, 0.5); }\n        .button-group.stack-for-small > li:first-child button, .button-group.stack-for-small > li:first-child .button {\n          border-left: 0; }\n        .button-group.stack-for-small > li > button, .button-group.stack-for-small > li .button {\n          border-top: 1px solid;\n          border-color: rgba(255, 255, 255, 0.5);\n          border-left-width: 0;\n          margin: 0;\n          display: block; }\n        .button-group.stack-for-small > li:first-child button, .button-group.stack-for-small > li:first-child .button {\n          border-top: 0; } }\n  .button-group.radius > * {\n    margin: 0 -2px;\n    display: inline-block; }\n    .button-group.radius > * > button, .button-group.radius > * .button {\n      border-left: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5); }\n    .button-group.radius > *:first-child button, .button-group.radius > *:first-child .button {\n      border-left: 0; }\n    .button-group.radius > *, .button-group.radius > * > a, .button-group.radius > * > button, .button-group.radius > * > .button {\n      border-radius: 0; }\n    .button-group.radius > *:first-child, .button-group.radius > *:first-child > a, .button-group.radius > *:first-child > button, .button-group.radius > *:first-child > .button {\n      -webkit-border-bottom-left-radius: 3px;\n      -webkit-border-top-left-radius: 3px;\n      border-bottom-left-radius: 3px;\n      border-top-left-radius: 3px; }\n    .button-group.radius > *:last-child, .button-group.radius > *:last-child > a, .button-group.radius > *:last-child > button, .button-group.radius > *:last-child > .button {\n      -webkit-border-bottom-right-radius: 3px;\n      -webkit-border-top-right-radius: 3px;\n      border-bottom-right-radius: 3px;\n      border-top-right-radius: 3px; }\n  .button-group.radius.stack > * {\n    margin: 0 -2px;\n    display: inline-block;\n    display: block;\n    margin: 0; }\n    .button-group.radius.stack > * > button, .button-group.radius.stack > * .button {\n      border-left: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5); }\n    .button-group.radius.stack > *:first-child button, .button-group.radius.stack > *:first-child .button {\n      border-left: 0; }\n    .button-group.radius.stack > * > button, .button-group.radius.stack > * .button {\n      border-top: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5);\n      border-left-width: 0;\n      margin: 0;\n      display: block; }\n    .button-group.radius.stack > *:first-child button, .button-group.radius.stack > *:first-child .button {\n      border-top: 0; }\n    .button-group.radius.stack > *, .button-group.radius.stack > * > a, .button-group.radius.stack > * > button, .button-group.radius.stack > * > .button {\n      border-radius: 0; }\n    .button-group.radius.stack > *:first-child, .button-group.radius.stack > *:first-child > a, .button-group.radius.stack > *:first-child > button, .button-group.radius.stack > *:first-child > .button {\n      -webkit-top-left-radius: 3px;\n      -webkit-top-right-radius: 3px;\n      border-top-left-radius: 3px;\n      border-top-right-radius: 3px; }\n    .button-group.radius.stack > *:last-child, .button-group.radius.stack > *:last-child > a, .button-group.radius.stack > *:last-child > button, .button-group.radius.stack > *:last-child > .button {\n      -webkit-bottom-left-radius: 3px;\n      -webkit-bottom-right-radius: 3px;\n      border-bottom-left-radius: 3px;\n      border-bottom-right-radius: 3px; }\n  @media only screen and (min-width:40.063em) {\n    .button-group.radius.stack-for-small > * {\n      margin: 0 -2px;\n      display: inline-block; }\n      .button-group.radius.stack-for-small > * > button, .button-group.radius.stack-for-small > * .button {\n        border-left: 1px solid;\n        border-color: rgba(255, 255, 255, 0.5); }\n      .button-group.radius.stack-for-small > *:first-child button, .button-group.radius.stack-for-small > *:first-child .button {\n        border-left: 0; }\n      .button-group.radius.stack-for-small > *, .button-group.radius.stack-for-small > * > a, .button-group.radius.stack-for-small > * > button, .button-group.radius.stack-for-small > * > .button {\n        border-radius: 0; }\n      .button-group.radius.stack-for-small > *:first-child, .button-group.radius.stack-for-small > *:first-child > a, .button-group.radius.stack-for-small > *:first-child > button, .button-group.radius.stack-for-small > *:first-child > .button {\n        -webkit-border-bottom-left-radius: 3px;\n        -webkit-border-top-left-radius: 3px;\n        border-bottom-left-radius: 3px;\n        border-top-left-radius: 3px; }\n      .button-group.radius.stack-for-small > *:last-child, .button-group.radius.stack-for-small > *:last-child > a, .button-group.radius.stack-for-small > *:last-child > button, .button-group.radius.stack-for-small > *:last-child > .button {\n        -webkit-border-bottom-right-radius: 3px;\n        -webkit-border-top-right-radius: 3px;\n        border-bottom-right-radius: 3px;\n        border-top-right-radius: 3px; } }\n  @media only screen and (max-width: 40em) {\n    .button-group.radius.stack-for-small > * {\n      margin: 0 -2px;\n      display: inline-block;\n      display: block;\n      margin: 0; }\n      .button-group.radius.stack-for-small > * > button, .button-group.radius.stack-for-small > * .button {\n        border-left: 1px solid;\n        border-color: rgba(255, 255, 255, 0.5); }\n      .button-group.radius.stack-for-small > *:first-child button, .button-group.radius.stack-for-small > *:first-child .button {\n        border-left: 0; }\n      .button-group.radius.stack-for-small > * > button, .button-group.radius.stack-for-small > * .button {\n        border-top: 1px solid;\n        border-color: rgba(255, 255, 255, 0.5);\n        border-left-width: 0;\n        margin: 0;\n        display: block; }\n      .button-group.radius.stack-for-small > *:first-child button, .button-group.radius.stack-for-small > *:first-child .button {\n        border-top: 0; }\n      .button-group.radius.stack-for-small > *, .button-group.radius.stack-for-small > * > a, .button-group.radius.stack-for-small > * > button, .button-group.radius.stack-for-small > * > .button {\n        border-radius: 0; }\n      .button-group.radius.stack-for-small > *:first-child, .button-group.radius.stack-for-small > *:first-child > a, .button-group.radius.stack-for-small > *:first-child > button, .button-group.radius.stack-for-small > *:first-child > .button {\n        -webkit-top-left-radius: 3px;\n        -webkit-top-right-radius: 3px;\n        border-top-left-radius: 3px;\n        border-top-right-radius: 3px; }\n      .button-group.radius.stack-for-small > *:last-child, .button-group.radius.stack-for-small > *:last-child > a, .button-group.radius.stack-for-small > *:last-child > button, .button-group.radius.stack-for-small > *:last-child > .button {\n        -webkit-bottom-left-radius: 3px;\n        -webkit-bottom-right-radius: 3px;\n        border-bottom-left-radius: 3px;\n        border-bottom-right-radius: 3px; } }\n  .button-group.round > * {\n    margin: 0 -2px;\n    display: inline-block; }\n    .button-group.round > * > button, .button-group.round > * .button {\n      border-left: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5); }\n    .button-group.round > *:first-child button, .button-group.round > *:first-child .button {\n      border-left: 0; }\n    .button-group.round > *, .button-group.round > * > a, .button-group.round > * > button, .button-group.round > * > .button {\n      border-radius: 0; }\n    .button-group.round > *:first-child, .button-group.round > *:first-child > a, .button-group.round > *:first-child > button, .button-group.round > *:first-child > .button {\n      -webkit-border-bottom-left-radius: 1000px;\n      -webkit-border-top-left-radius: 1000px;\n      border-bottom-left-radius: 1000px;\n      border-top-left-radius: 1000px; }\n    .button-group.round > *:last-child, .button-group.round > *:last-child > a, .button-group.round > *:last-child > button, .button-group.round > *:last-child > .button {\n      -webkit-border-bottom-right-radius: 1000px;\n      -webkit-border-top-right-radius: 1000px;\n      border-bottom-right-radius: 1000px;\n      border-top-right-radius: 1000px; }\n  .button-group.round.stack > * {\n    margin: 0 -2px;\n    display: inline-block;\n    display: block;\n    margin: 0; }\n    .button-group.round.stack > * > button, .button-group.round.stack > * .button {\n      border-left: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5); }\n    .button-group.round.stack > *:first-child button, .button-group.round.stack > *:first-child .button {\n      border-left: 0; }\n    .button-group.round.stack > * > button, .button-group.round.stack > * .button {\n      border-top: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5);\n      border-left-width: 0;\n      margin: 0;\n      display: block; }\n    .button-group.round.stack > *:first-child button, .button-group.round.stack > *:first-child .button {\n      border-top: 0; }\n    .button-group.round.stack > *, .button-group.round.stack > * > a, .button-group.round.stack > * > button, .button-group.round.stack > * > .button {\n      border-radius: 0; }\n    .button-group.round.stack > *:first-child, .button-group.round.stack > *:first-child > a, .button-group.round.stack > *:first-child > button, .button-group.round.stack > *:first-child > .button {\n      -webkit-top-left-radius: 1rem;\n      -webkit-top-right-radius: 1rem;\n      border-top-left-radius: 1rem;\n      border-top-right-radius: 1rem; }\n    .button-group.round.stack > *:last-child, .button-group.round.stack > *:last-child > a, .button-group.round.stack > *:last-child > button, .button-group.round.stack > *:last-child > .button {\n      -webkit-bottom-left-radius: 1rem;\n      -webkit-bottom-right-radius: 1rem;\n      border-bottom-left-radius: 1rem;\n      border-bottom-right-radius: 1rem; }\n  @media only screen and (min-width:40.063em) {\n    .button-group.round.stack-for-small > * {\n      margin: 0 -2px;\n      display: inline-block; }\n      .button-group.round.stack-for-small > * > button, .button-group.round.stack-for-small > * .button {\n        border-left: 1px solid;\n        border-color: rgba(255, 255, 255, 0.5); }\n      .button-group.round.stack-for-small > *:first-child button, .button-group.round.stack-for-small > *:first-child .button {\n        border-left: 0; }\n      .button-group.round.stack-for-small > *, .button-group.round.stack-for-small > * > a, .button-group.round.stack-for-small > * > button, .button-group.round.stack-for-small > * > .button {\n        border-radius: 0; }\n      .button-group.round.stack-for-small > *:first-child, .button-group.round.stack-for-small > *:first-child > a, .button-group.round.stack-for-small > *:first-child > button, .button-group.round.stack-for-small > *:first-child > .button {\n        -webkit-border-bottom-left-radius: 1000px;\n        -webkit-border-top-left-radius: 1000px;\n        border-bottom-left-radius: 1000px;\n        border-top-left-radius: 1000px; }\n      .button-group.round.stack-for-small > *:last-child, .button-group.round.stack-for-small > *:last-child > a, .button-group.round.stack-for-small > *:last-child > button, .button-group.round.stack-for-small > *:last-child > .button {\n        -webkit-border-bottom-right-radius: 1000px;\n        -webkit-border-top-right-radius: 1000px;\n        border-bottom-right-radius: 1000px;\n        border-top-right-radius: 1000px; } }\n  @media only screen and (max-width: 40em) {\n    .button-group.round.stack-for-small > * {\n      margin: 0 -2px;\n      display: inline-block;\n      display: block;\n      margin: 0; }\n      .button-group.round.stack-for-small > * > button, .button-group.round.stack-for-small > * .button {\n        border-left: 1px solid;\n        border-color: rgba(255, 255, 255, 0.5); }\n      .button-group.round.stack-for-small > *:first-child button, .button-group.round.stack-for-small > *:first-child .button {\n        border-left: 0; }\n      .button-group.round.stack-for-small > * > button, .button-group.round.stack-for-small > * .button {\n        border-top: 1px solid;\n        border-color: rgba(255, 255, 255, 0.5);\n        border-left-width: 0;\n        margin: 0;\n        display: block; }\n      .button-group.round.stack-for-small > *:first-child button, .button-group.round.stack-for-small > *:first-child .button {\n        border-top: 0; }\n      .button-group.round.stack-for-small > *, .button-group.round.stack-for-small > * > a, .button-group.round.stack-for-small > * > button, .button-group.round.stack-for-small > * > .button {\n        border-radius: 0; }\n      .button-group.round.stack-for-small > *:first-child, .button-group.round.stack-for-small > *:first-child > a, .button-group.round.stack-for-small > *:first-child > button, .button-group.round.stack-for-small > *:first-child > .button {\n        -webkit-top-left-radius: 1rem;\n        -webkit-top-right-radius: 1rem;\n        border-top-left-radius: 1rem;\n        border-top-right-radius: 1rem; }\n      .button-group.round.stack-for-small > *:last-child, .button-group.round.stack-for-small > *:last-child > a, .button-group.round.stack-for-small > *:last-child > button, .button-group.round.stack-for-small > *:last-child > .button {\n        -webkit-bottom-left-radius: 1rem;\n        -webkit-bottom-right-radius: 1rem;\n        border-bottom-left-radius: 1rem;\n        border-bottom-right-radius: 1rem; } }\n  .button-group.even-2 li {\n    margin: 0 -2px;\n    display: inline-block;\n    width: 50%; }\n    .button-group.even-2 li > button, .button-group.even-2 li .button {\n      border-left: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5); }\n    .button-group.even-2 li:first-child button, .button-group.even-2 li:first-child .button {\n      border-left: 0; }\n    .button-group.even-2 li button, .button-group.even-2 li .button {\n      width: 100%; }\n  .button-group.even-3 li {\n    margin: 0 -2px;\n    display: inline-block;\n    width: 33.3333333333%; }\n    .button-group.even-3 li > button, .button-group.even-3 li .button {\n      border-left: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5); }\n    .button-group.even-3 li:first-child button, .button-group.even-3 li:first-child .button {\n      border-left: 0; }\n    .button-group.even-3 li button, .button-group.even-3 li .button {\n      width: 100%; }\n  .button-group.even-4 li {\n    margin: 0 -2px;\n    display: inline-block;\n    width: 25%; }\n    .button-group.even-4 li > button, .button-group.even-4 li .button {\n      border-left: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5); }\n    .button-group.even-4 li:first-child button, .button-group.even-4 li:first-child .button {\n      border-left: 0; }\n    .button-group.even-4 li button, .button-group.even-4 li .button {\n      width: 100%; }\n  .button-group.even-5 li {\n    margin: 0 -2px;\n    display: inline-block;\n    width: 20%; }\n    .button-group.even-5 li > button, .button-group.even-5 li .button {\n      border-left: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5); }\n    .button-group.even-5 li:first-child button, .button-group.even-5 li:first-child .button {\n      border-left: 0; }\n    .button-group.even-5 li button, .button-group.even-5 li .button {\n      width: 100%; }\n  .button-group.even-6 li {\n    margin: 0 -2px;\n    display: inline-block;\n    width: 16.6666666667%; }\n    .button-group.even-6 li > button, .button-group.even-6 li .button {\n      border-left: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5); }\n    .button-group.even-6 li:first-child button, .button-group.even-6 li:first-child .button {\n      border-left: 0; }\n    .button-group.even-6 li button, .button-group.even-6 li .button {\n      width: 100%; }\n  .button-group.even-7 li {\n    margin: 0 -2px;\n    display: inline-block;\n    width: 14.2857142857%; }\n    .button-group.even-7 li > button, .button-group.even-7 li .button {\n      border-left: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5); }\n    .button-group.even-7 li:first-child button, .button-group.even-7 li:first-child .button {\n      border-left: 0; }\n    .button-group.even-7 li button, .button-group.even-7 li .button {\n      width: 100%; }\n  .button-group.even-8 li {\n    margin: 0 -2px;\n    display: inline-block;\n    width: 12.5%; }\n    .button-group.even-8 li > button, .button-group.even-8 li .button {\n      border-left: 1px solid;\n      border-color: rgba(255, 255, 255, 0.5); }\n    .button-group.even-8 li:first-child button, .button-group.even-8 li:first-child .button {\n      border-left: 0; }\n    .button-group.even-8 li button, .button-group.even-8 li .button {\n      width: 100%; }\n\n.button-bar:before, .button-bar:after {\n  content: " ";\n  display: table; }\n.button-bar:after {\n  clear: both; }\n.button-bar .button-group {\n  float: left;\n  margin-right: 0.625rem; }\n  .button-bar .button-group div {\n    overflow: hidden; }\n\n/* Clearing Styles */\n.clearing-thumbs, [data-clearing] {\n  margin-bottom: 0;\n  margin-left: 0;\n  list-style: none; }\n  .clearing-thumbs:before, .clearing-thumbs:after, [data-clearing]:before, [data-clearing]:after {\n    content: " ";\n    display: table; }\n  .clearing-thumbs:after, [data-clearing]:after {\n    clear: both; }\n  .clearing-thumbs li, [data-clearing] li {\n    float: left;\n    margin-right: 10px; }\n  .clearing-thumbs[class*="block-grid-"] li, [data-clearing][class*="block-grid-"] li {\n    margin-right: 0; }\n\n.clearing-blackout {\n  background: #333333;\n  position: fixed;\n  width: 100%;\n  height: 100%;\n  top: 0;\n  left: 0;\n  z-index: 998; }\n  .clearing-blackout .clearing-close {\n    display: block; }\n\n.clearing-container {\n  position: relative;\n  z-index: 998;\n  height: 100%;\n  overflow: hidden;\n  margin: 0; }\n\n.clearing-touch-label {\n  position: absolute;\n  top: 50%;\n  left: 50%;\n  color: #AAAAAA;\n  font-size: 0.6em; }\n\n.visible-img {\n  height: 95%;\n  position: relative; }\n  .visible-img img {\n    position: absolute;\n    left: 50%;\n    top: 50%;\n    margin-left: -50%;\n    max-height: 100%;\n    max-width: 100%; }\n\n.clearing-caption {\n  color: #CCCCCC;\n  font-size: 0.875em;\n  line-height: 1.3;\n  margin-bottom: 0;\n  text-align: center;\n  bottom: 0;\n  background: #333333;\n  width: 100%;\n  padding: 10px 30px 20px;\n  position: absolute;\n  left: 0; }\n\n.clearing-close {\n  z-index: 999;\n  padding-left: 20px;\n  padding-top: 10px;\n  font-size: 30px;\n  line-height: 1;\n  color: #CCCCCC;\n  display: none; }\n  .clearing-close:hover, .clearing-close:focus {\n    color: #CCCCCC; }\n\n.clearing-assembled .clearing-container {\n  height: 100%; }\n  .clearing-assembled .clearing-container .carousel > ul {\n    display: none; }\n\n.clearing-feature li {\n  display: none; }\n  .clearing-feature li.clearing-featured-img {\n    display: block; }\n\n@media only screen and (min-width:40.063em) {\n  .clearing-main-prev, .clearing-main-next {\n    position: absolute;\n    height: 100%;\n    width: 40px;\n    top: 0; }\n    .clearing-main-prev > span, .clearing-main-next > span {\n      position: absolute;\n      top: 50%;\n      display: block;\n      width: 0;\n      height: 0;\n      border: solid 12px; }\n      .clearing-main-prev > span:hover, .clearing-main-next > span:hover {\n        opacity: 0.8; }\n\n  .clearing-main-prev {\n    left: 0; }\n    .clearing-main-prev > span {\n      left: 5px;\n      border-color: transparent;\n      border-right-color: #CCCCCC; }\n\n  .clearing-main-next {\n    right: 0; }\n    .clearing-main-next > span {\n      border-color: transparent;\n      border-left-color: #CCCCCC; }\n\n  .clearing-main-prev.disabled, .clearing-main-next.disabled {\n    opacity: 0.3; }\n\n  .clearing-assembled .clearing-container .carousel {\n    background: rgba(51, 51, 51, 0.8);\n    height: 120px;\n    margin-top: 10px;\n    text-align: center; }\n    .clearing-assembled .clearing-container .carousel > ul {\n      display: inline-block;\n      z-index: 999;\n      height: 100%;\n      position: relative;\n      float: none; }\n      .clearing-assembled .clearing-container .carousel > ul li {\n        display: block;\n        width: 120px;\n        min-height: inherit;\n        float: left;\n        overflow: hidden;\n        margin-right: 0;\n        padding: 0;\n        position: relative;\n        cursor: pointer;\n        opacity: 0.4;\n        clear: none; }\n        .clearing-assembled .clearing-container .carousel > ul li.fix-height img {\n          height: 100%;\n          max-width: none; }\n        .clearing-assembled .clearing-container .carousel > ul li a.th {\n          border: none;\n          box-shadow: none;\n          display: block; }\n        .clearing-assembled .clearing-container .carousel > ul li img {\n          cursor: pointer !important;\n          width: 100% !important; }\n        .clearing-assembled .clearing-container .carousel > ul li.visible {\n          opacity: 1; }\n        .clearing-assembled .clearing-container .carousel > ul li:hover {\n          opacity: 0.8; }\n  .clearing-assembled .clearing-container .visible-img {\n    background: #333333;\n    overflow: hidden;\n    height: 85%; }\n\n  .clearing-close {\n    position: absolute;\n    top: 10px;\n    right: 20px;\n    padding-left: 0;\n    padding-top: 0; }\n }\n\n/* Foundation Dropdowns */\n.f-dropdown {\n  position: absolute;\n  left: -9999px;\n  list-style: none;\n  margin-left: 0;\n  outline: none;\n  width: 100%;\n  max-height: none;\n  height: auto;\n  background: #FFFFFF;\n  border: solid 1px #cccccc;\n  font-size: 0.875rem;\n  z-index: 89;\n  margin-top: 2px;\n  max-width: 200px; }\n  .f-dropdown > *:first-child {\n    margin-top: 0; }\n  .f-dropdown > *:last-child {\n    margin-bottom: 0; }\n  .f-dropdown:before {\n    content: "";\n    display: block;\n    width: 0;\n    height: 0;\n    border: inset 6px;\n    border-color: transparent transparent #FFFFFF transparent;\n    border-bottom-style: solid;\n    position: absolute;\n    top: -12px;\n    left: 10px;\n    z-index: 89; }\n  .f-dropdown:after {\n    content: "";\n    display: block;\n    width: 0;\n    height: 0;\n    border: inset 7px;\n    border-color: transparent transparent #cccccc transparent;\n    border-bottom-style: solid;\n    position: absolute;\n    top: -14px;\n    left: 9px;\n    z-index: 88; }\n  .f-dropdown.right:before {\n    left: auto;\n    right: 10px; }\n  .f-dropdown.right:after {\n    left: auto;\n    right: 9px; }\n  .f-dropdown.drop-right {\n    position: absolute;\n    left: -9999px;\n    list-style: none;\n    margin-left: 0;\n    outline: none;\n    width: 100%;\n    max-height: none;\n    height: auto;\n    background: #FFFFFF;\n    border: solid 1px #cccccc;\n    font-size: 0.875rem;\n    z-index: 89;\n    margin-top: 0;\n    margin-left: 2px;\n    max-width: 200px; }\n    .f-dropdown.drop-right > *:first-child {\n      margin-top: 0; }\n    .f-dropdown.drop-right > *:last-child {\n      margin-bottom: 0; }\n    .f-dropdown.drop-right:before {\n      content: "";\n      display: block;\n      width: 0;\n      height: 0;\n      border: inset 6px;\n      border-color: transparent #FFFFFF transparent transparent;\n      border-right-style: solid;\n      position: absolute;\n      top: 10px;\n      left: -12px;\n      z-index: 89; }\n    .f-dropdown.drop-right:after {\n      content: "";\n      display: block;\n      width: 0;\n      height: 0;\n      border: inset 7px;\n      border-color: transparent #cccccc transparent transparent;\n      border-right-style: solid;\n      position: absolute;\n      top: 9px;\n      left: -14px;\n      z-index: 88; }\n  .f-dropdown.drop-left {\n    position: absolute;\n    left: -9999px;\n    list-style: none;\n    margin-left: 0;\n    outline: none;\n    width: 100%;\n    max-height: none;\n    height: auto;\n    background: #FFFFFF;\n    border: solid 1px #cccccc;\n    font-size: 0.875rem;\n    z-index: 89;\n    margin-top: 0;\n    margin-left: -2px;\n    max-width: 200px; }\n    .f-dropdown.drop-left > *:first-child {\n      margin-top: 0; }\n    .f-dropdown.drop-left > *:last-child {\n      margin-bottom: 0; }\n    .f-dropdown.drop-left:before {\n      content: "";\n      display: block;\n      width: 0;\n      height: 0;\n      border: inset 6px;\n      border-color: transparent transparent transparent #FFFFFF;\n      border-left-style: solid;\n      position: absolute;\n      top: 10px;\n      right: -12px;\n      left: auto;\n      z-index: 89; }\n    .f-dropdown.drop-left:after {\n      content: "";\n      display: block;\n      width: 0;\n      height: 0;\n      border: inset 7px;\n      border-color: transparent transparent transparent #cccccc;\n      border-left-style: solid;\n      position: absolute;\n      top: 9px;\n      right: -14px;\n      left: auto;\n      z-index: 88; }\n  .f-dropdown.drop-top {\n    position: absolute;\n    left: -9999px;\n    list-style: none;\n    margin-left: 0;\n    outline: none;\n    width: 100%;\n    max-height: none;\n    height: auto;\n    background: #FFFFFF;\n    border: solid 1px #cccccc;\n    font-size: 0.875rem;\n    z-index: 89;\n    margin-top: -2px;\n    margin-left: 0;\n    max-width: 200px; }\n    .f-dropdown.drop-top > *:first-child {\n      margin-top: 0; }\n    .f-dropdown.drop-top > *:last-child {\n      margin-bottom: 0; }\n    .f-dropdown.drop-top:before {\n      content: "";\n      display: block;\n      width: 0;\n      height: 0;\n      border: inset 6px;\n      border-color: #FFFFFF transparent transparent transparent;\n      border-top-style: solid;\n      position: absolute;\n      top: auto;\n      bottom: -12px;\n      left: 10px;\n      right: auto;\n      z-index: 89; }\n    .f-dropdown.drop-top:after {\n      content: "";\n      display: block;\n      width: 0;\n      height: 0;\n      border: inset 7px;\n      border-color: #cccccc transparent transparent transparent;\n      border-top-style: solid;\n      position: absolute;\n      top: auto;\n      bottom: -14px;\n      left: 9px;\n      right: auto;\n      z-index: 88; }\n  .f-dropdown li {\n    font-size: 0.875rem;\n    cursor: pointer;\n    line-height: 1.125rem;\n    margin: 0; }\n    .f-dropdown li:hover, .f-dropdown li:focus {\n      background: #EEEEEE; }\n    .f-dropdown li.radius {\n      border-radius: 3px; }\n    .f-dropdown li a {\n      display: block;\n      padding: 0.5rem;\n      color: #555555; }\n  .f-dropdown.content {\n    position: absolute;\n    left: -9999px;\n    list-style: none;\n    margin-left: 0;\n    outline: none;\n    padding: 1.25rem;\n    width: 100%;\n    height: auto;\n    max-height: none;\n    background: #FFFFFF;\n    border: solid 1px #cccccc;\n    font-size: 0.875rem;\n    z-index: 89;\n    max-width: 200px; }\n    .f-dropdown.content > *:first-child {\n      margin-top: 0; }\n    .f-dropdown.content > *:last-child {\n      margin-bottom: 0; }\n  .f-dropdown.tiny {\n    max-width: 200px; }\n  .f-dropdown.small {\n    max-width: 300px; }\n  .f-dropdown.medium {\n    max-width: 500px; }\n  .f-dropdown.large {\n    max-width: 800px; }\n  .f-dropdown.mega {\n    width: 100% !important;\n    max-width: 100% !important; }\n    .f-dropdown.mega.open {\n      left: 0 !important; }\n\n.dropdown.button, button.dropdown {\n  position: relative;\n  outline: none;\n  padding-right: 3.5625rem; }\n  .dropdown.button::after, button.dropdown::after {\n    position: absolute;\n    content: "";\n    width: 0;\n    height: 0;\n    display: block;\n    border-style: solid;\n    border-color: #FFFFFF transparent transparent transparent;\n    top: 50%; }\n  .dropdown.button::after, button.dropdown::after {\n    border-width: 0.375rem;\n    right: 1.40625rem;\n    margin-top: -0.15625rem; }\n  .dropdown.button::after, button.dropdown::after {\n    border-color: #FFFFFF transparent transparent transparent; }\n  .dropdown.button.tiny, button.dropdown.tiny {\n    padding-right: 2.625rem; }\n    .dropdown.button.tiny:after, button.dropdown.tiny:after {\n      border-width: 0.375rem;\n      right: 1.125rem;\n      margin-top: -0.125rem; }\n    .dropdown.button.tiny::after, button.dropdown.tiny::after {\n      border-color: #FFFFFF transparent transparent transparent; }\n  .dropdown.button.small, button.dropdown.small {\n    padding-right: 3.0625rem; }\n    .dropdown.button.small::after, button.dropdown.small::after {\n      border-width: 0.4375rem;\n      right: 1.3125rem;\n      margin-top: -0.15625rem; }\n    .dropdown.button.small::after, button.dropdown.small::after {\n      border-color: #FFFFFF transparent transparent transparent; }\n  .dropdown.button.large, button.dropdown.large {\n    padding-right: 3.625rem; }\n    .dropdown.button.large::after, button.dropdown.large::after {\n      border-width: 0.3125rem;\n      right: 1.71875rem;\n      margin-top: -0.15625rem; }\n    .dropdown.button.large::after, button.dropdown.large::after {\n      border-color: #FFFFFF transparent transparent transparent; }\n  .dropdown.button.secondary:after, button.dropdown.secondary:after {\n    border-color: #333333 transparent transparent transparent; }\n\n.flex-video {\n  position: relative;\n  padding-top: 1.5625rem;\n  padding-bottom: 67.5%;\n  height: 0;\n  margin-bottom: 1rem;\n  overflow: hidden; }\n  .flex-video.widescreen {\n    padding-bottom: 56.34%; }\n  .flex-video.vimeo {\n    padding-top: 0; }\n  .flex-video iframe, .flex-video object, .flex-video embed, .flex-video video {\n    position: absolute;\n    top: 0;\n    left: 0;\n    width: 100%;\n    height: 100%; }\n\n/* Standard Forms */\nform {\n  margin: 0 0 1rem; }\n\n/* Using forms within rows, we need to set some defaults */\nform .row .row {\n  margin: 0 -0.5rem; }\n  form .row .row .column, form .row .row .columns {\n    padding: 0 0.5rem; }\n  form .row .row.collapse {\n    margin: 0; }\n    form .row .row.collapse .column, form .row .row.collapse .columns {\n      padding: 0; }\n    form .row .row.collapse input {\n      -webkit-border-bottom-right-radius: 0;\n      -webkit-border-top-right-radius: 0;\n      border-bottom-right-radius: 0;\n      border-top-right-radius: 0; }\nform .row input.column, form .row input.columns, form .row textarea.column, form .row textarea.columns {\n  padding-left: 0.5rem; }\n\n/* Label Styles */\nlabel {\n  font-size: 0.875rem;\n  color: #4d4d4d;\n  cursor: pointer;\n  display: block;\n  font-weight: normal;\n  line-height: 1.5;\n  margin-bottom: 0;\n  /* Styles for required inputs */ }\n  label.right {\n    float: none !important;\n    text-align: right; }\n  label.inline {\n    margin: 0 0 1rem 0;\n    padding: 0.5625rem 0; }\n  label small {\n    text-transform: capitalize;\n    color: #676767; }\n\n/* Attach elements to the beginning or end of an input */\n.prefix, .postfix {\n  display: block;\n  position: relative;\n  z-index: 2;\n  text-align: center;\n  width: 100%;\n  padding-top: 0;\n  padding-bottom: 0;\n  border-style: solid;\n  border-width: 1px;\n  overflow: hidden;\n  font-size: 0.875rem;\n  height: 2.3125rem;\n  line-height: 2.3125rem; }\n\n/* Adjust padding, alignment and radius if pre/post element is a button */\n.postfix.button {\n  padding-left: 0;\n  padding-right: 0;\n  padding-top: 0;\n  padding-bottom: 0;\n  text-align: center;\n  border: none; }\n\n.prefix.button {\n  padding-left: 0;\n  padding-right: 0;\n  padding-top: 0;\n  padding-bottom: 0;\n  text-align: center;\n  border: none; }\n\n.prefix.button.radius {\n  border-radius: 0;\n  -webkit-border-bottom-left-radius: 3px;\n  -webkit-border-top-left-radius: 3px;\n  border-bottom-left-radius: 3px;\n  border-top-left-radius: 3px; }\n\n.postfix.button.radius {\n  border-radius: 0;\n  -webkit-border-bottom-right-radius: 3px;\n  -webkit-border-top-right-radius: 3px;\n  border-bottom-right-radius: 3px;\n  border-top-right-radius: 3px; }\n\n.prefix.button.round {\n  border-radius: 0;\n  -webkit-border-bottom-left-radius: 1000px;\n  -webkit-border-top-left-radius: 1000px;\n  border-bottom-left-radius: 1000px;\n  border-top-left-radius: 1000px; }\n\n.postfix.button.round {\n  border-radius: 0;\n  -webkit-border-bottom-right-radius: 1000px;\n  -webkit-border-top-right-radius: 1000px;\n  border-bottom-right-radius: 1000px;\n  border-top-right-radius: 1000px; }\n\n/* Separate prefix and postfix styles when on span or label so buttons keep their own */\nspan.prefix, label.prefix {\n  background: #f2f2f2;\n  border-right: none;\n  color: #333333;\n  border-color: #cccccc; }\n\nspan.postfix, label.postfix {\n  background: #f2f2f2;\n  border-left: none;\n  color: #333333;\n  border-color: #cccccc; }\n\n/* We use this to get basic styling on all basic form elements */\ninput[type="text"], input[type="password"], input[type="date"], input[type="datetime"], input[type="datetime-local"], input[type="month"], input[type="week"], input[type="email"], input[type="number"], input[type="search"], input[type="tel"], input[type="time"], input[type="url"], input[type="color"], textarea {\n  -webkit-appearance: none;\n  border-radius: 0;\n  background-color: #FFFFFF;\n  font-family: inherit;\n  border-style: solid;\n  border-width: 1px;\n  border-color: #cccccc;\n  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);\n  color: rgba(0, 0, 0, 0.75);\n  display: block;\n  font-size: 0.875rem;\n  margin: 0 0 1rem 0;\n  padding: 0.5rem;\n  height: 2.3125rem;\n  width: 100%;\n  -webkit-box-sizing: border-box;\n  -moz-box-sizing: border-box;\n  box-sizing: border-box;\n  transition: box-shadow 0.45s, border-color 0.45s ease-in-out; }\n  input[type="text"]:focus, input[type="password"]:focus, input[type="date"]:focus, input[type="datetime"]:focus, input[type="datetime-local"]:focus, input[type="month"]:focus, input[type="week"]:focus, input[type="email"]:focus, input[type="number"]:focus, input[type="search"]:focus, input[type="tel"]:focus, input[type="time"]:focus, input[type="url"]:focus, input[type="color"]:focus, textarea:focus {\n    box-shadow: 0 0 5px #999999;\n    border-color: #999999; }\n  input[type="text"]:focus, input[type="password"]:focus, input[type="date"]:focus, input[type="datetime"]:focus, input[type="datetime-local"]:focus, input[type="month"]:focus, input[type="week"]:focus, input[type="email"]:focus, input[type="number"]:focus, input[type="search"]:focus, input[type="tel"]:focus, input[type="time"]:focus, input[type="url"]:focus, input[type="color"]:focus, textarea:focus {\n    background: #fafafa;\n    border-color: #999999;\n    outline: none; }\n  input[type="text"]:disabled, input[type="password"]:disabled, input[type="date"]:disabled, input[type="datetime"]:disabled, input[type="datetime-local"]:disabled, input[type="month"]:disabled, input[type="week"]:disabled, input[type="email"]:disabled, input[type="number"]:disabled, input[type="search"]:disabled, input[type="tel"]:disabled, input[type="time"]:disabled, input[type="url"]:disabled, input[type="color"]:disabled, textarea:disabled {\n    background-color: #DDDDDD;\n    cursor: default; }\n  input[type="text"][disabled], input[type="text"][readonly], fieldset[disabled] input[type="text"], input[type="password"][disabled], input[type="password"][readonly], fieldset[disabled] input[type="password"], input[type="date"][disabled], input[type="date"][readonly], fieldset[disabled] input[type="date"], input[type="datetime"][disabled], input[type="datetime"][readonly], fieldset[disabled] input[type="datetime"], input[type="datetime-local"][disabled], input[type="datetime-local"][readonly], fieldset[disabled] input[type="datetime-local"], input[type="month"][disabled], input[type="month"][readonly], fieldset[disabled] input[type="month"], input[type="week"][disabled], input[type="week"][readonly], fieldset[disabled] input[type="week"], input[type="email"][disabled], input[type="email"][readonly], fieldset[disabled] input[type="email"], input[type="number"][disabled], input[type="number"][readonly], fieldset[disabled] input[type="number"], input[type="search"][disabled], input[type="search"][readonly], fieldset[disabled] input[type="search"], input[type="tel"][disabled], input[type="tel"][readonly], fieldset[disabled] input[type="tel"], input[type="time"][disabled], input[type="time"][readonly], fieldset[disabled] input[type="time"], input[type="url"][disabled], input[type="url"][readonly], fieldset[disabled] input[type="url"], input[type="color"][disabled], input[type="color"][readonly], fieldset[disabled] input[type="color"], textarea[disabled], textarea[readonly], fieldset[disabled] textarea {\n    background-color: #DDDDDD;\n    cursor: default; }\n  input[type="text"].radius, input[type="password"].radius, input[type="date"].radius, input[type="datetime"].radius, input[type="datetime-local"].radius, input[type="month"].radius, input[type="week"].radius, input[type="email"].radius, input[type="number"].radius, input[type="search"].radius, input[type="tel"].radius, input[type="time"].radius, input[type="url"].radius, input[type="color"].radius, textarea.radius {\n    border-radius: 3px; }\n\nform .row .prefix-radius.row.collapse input, form .row .prefix-radius.row.collapse textarea, form .row .prefix-radius.row.collapse select {\n  border-radius: 0;\n  -webkit-border-bottom-right-radius: 3px;\n  -webkit-border-top-right-radius: 3px;\n  border-bottom-right-radius: 3px;\n  border-top-right-radius: 3px; }\nform .row .prefix-radius.row.collapse .prefix {\n  border-radius: 0;\n  -webkit-border-bottom-left-radius: 3px;\n  -webkit-border-top-left-radius: 3px;\n  border-bottom-left-radius: 3px;\n  border-top-left-radius: 3px; }\nform .row .postfix-radius.row.collapse input, form .row .postfix-radius.row.collapse textarea, form .row .postfix-radius.row.collapse select {\n  border-radius: 0;\n  -webkit-border-bottom-left-radius: 3px;\n  -webkit-border-top-left-radius: 3px;\n  border-bottom-left-radius: 3px;\n  border-top-left-radius: 3px; }\nform .row .postfix-radius.row.collapse .postfix {\n  border-radius: 0;\n  -webkit-border-bottom-right-radius: 3px;\n  -webkit-border-top-right-radius: 3px;\n  border-bottom-right-radius: 3px;\n  border-top-right-radius: 3px; }\nform .row .prefix-round.row.collapse input, form .row .prefix-round.row.collapse textarea, form .row .prefix-round.row.collapse select {\n  border-radius: 0;\n  -webkit-border-bottom-right-radius: 1000px;\n  -webkit-border-top-right-radius: 1000px;\n  border-bottom-right-radius: 1000px;\n  border-top-right-radius: 1000px; }\nform .row .prefix-round.row.collapse .prefix {\n  border-radius: 0;\n  -webkit-border-bottom-left-radius: 1000px;\n  -webkit-border-top-left-radius: 1000px;\n  border-bottom-left-radius: 1000px;\n  border-top-left-radius: 1000px; }\nform .row .postfix-round.row.collapse input, form .row .postfix-round.row.collapse textarea, form .row .postfix-round.row.collapse select {\n  border-radius: 0;\n  -webkit-border-bottom-left-radius: 1000px;\n  -webkit-border-top-left-radius: 1000px;\n  border-bottom-left-radius: 1000px;\n  border-top-left-radius: 1000px; }\nform .row .postfix-round.row.collapse .postfix {\n  border-radius: 0;\n  -webkit-border-bottom-right-radius: 1000px;\n  -webkit-border-top-right-radius: 1000px;\n  border-bottom-right-radius: 1000px;\n  border-top-right-radius: 1000px; }\n\ninput[type="submit"] {\n  -webkit-appearance: none;\n  border-radius: 0; }\n\n/* Respect enforced amount of rows for textarea */\ntextarea[rows] {\n  height: auto; }\n\n/* Not allow resize out of parent */\ntextarea {\n  max-width: 100%; }\n\n/* Add height value for select elements to match text input height */\nselect {\n  -webkit-appearance: none !important;\n  border-radius: 0;\n  background-color: #FAFAFA;\n  background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeD0iMTJweCIgeT0iMHB4IiB3aWR0aD0iMjRweCIgaGVpZ2h0PSIzcHgiIHZpZXdCb3g9IjAgMCA2IDMiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDYgMyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+PHBvbHlnb24gcG9pbnRzPSI1Ljk5MiwwIDIuOTkyLDMgLTAuMDA4LDAgIi8+PC9zdmc+);\n  background-position: 100% center;\n  background-repeat: no-repeat;\n  border-style: solid;\n  border-width: 1px;\n  border-color: #cccccc;\n  padding: 0.5rem;\n  font-size: 0.875rem;\n  font-family: "Helvetica Neue", Helvetica, Roboto, Arial, sans-serif;\n  color: rgba(0, 0, 0, 0.75);\n  line-height: normal;\n  border-radius: 0;\n  height: 2.3125rem; }\n  select::-ms-expand {\n    display: none; }\n  select.radius {\n    border-radius: 3px; }\n  select:hover {\n    background-color: #f3f3f3;\n    border-color: #999999; }\n  select:disabled {\n    background-color: #DDDDDD;\n    cursor: default; }\n\n/* Adjust margin for form elements below */\ninput[type="file"], input[type="checkbox"], input[type="radio"], select {\n  margin: 0 0 1rem 0; }\n\ninput[type="checkbox"] + label, input[type="radio"] + label {\n  display: inline-block;\n  margin-left: 0.5rem;\n  margin-right: 1rem;\n  margin-bottom: 0;\n  vertical-align: baseline; }\n\n/* Normalize file input width */\ninput[type="file"] {\n  width: 100%; }\n\n/* HTML5 Number spinners settings */\n/* We add basic fieldset styling */\nfieldset {\n  border: 1px solid #DDDDDD;\n  padding: 1.25rem;\n  margin: 1.125rem 0; }\n  fieldset legend {\n    font-weight: bold;\n    background: #FFFFFF;\n    padding: 0 0.1875rem;\n    margin: 0;\n    margin-left: -0.1875rem; }\n\n/* Error Handling */\n[data-abide] .error small.error, [data-abide] .error span.error, [data-abide] span.error, [data-abide] small.error {\n  display: block;\n  padding: 0.375rem 0.5625rem 0.5625rem;\n  margin-top: -1px;\n  margin-bottom: 1rem;\n  font-size: 0.75rem;\n  font-weight: normal;\n  font-style: italic;\n  background: #f04124;\n  color: #FFFFFF; }\n[data-abide] span.error, [data-abide] small.error {\n  display: none; }\n\nspan.error, small.error {\n  display: block;\n  padding: 0.375rem 0.5625rem 0.5625rem;\n  margin-top: -1px;\n  margin-bottom: 1rem;\n  font-size: 0.75rem;\n  font-weight: normal;\n  font-style: italic;\n  background: #f04124;\n  color: #FFFFFF; }\n\n.error input, .error textarea, .error select {\n  margin-bottom: 0; }\n.error input[type="checkbox"], .error input[type="radio"] {\n  margin-bottom: 1rem; }\n.error label, .error label.error {\n  color: #f04124; }\n.error small.error {\n  display: block;\n  padding: 0.375rem 0.5625rem 0.5625rem;\n  margin-top: -1px;\n  margin-bottom: 1rem;\n  font-size: 0.75rem;\n  font-weight: normal;\n  font-style: italic;\n  background: #f04124;\n  color: #FFFFFF; }\n.error > label > small {\n  color: #676767;\n  background: transparent;\n  padding: 0;\n  text-transform: capitalize;\n  font-style: normal;\n  font-size: 60%;\n  margin: 0;\n  display: inline; }\n.error span.error-message {\n  display: block; }\n\ninput.error, textarea.error, select.error {\n  margin-bottom: 0; }\n\nlabel.error {\n  color: #f04124; }\n\n.icon-bar {\n  width: 100%;\n  font-size: 0;\n  display: inline-block;\n  background: #333333; }\n  .icon-bar > * {\n    text-align: center;\n    font-size: 1rem;\n    width: 25%;\n    margin: 0 auto;\n    display: block;\n    padding: 1.25rem;\n    float: left; }\n    .icon-bar > * i, .icon-bar > * img {\n      display: block;\n      margin: 0 auto; }\n      .icon-bar > * i + label, .icon-bar > * img + label {\n        margin-top: 0.0625rem; }\n    .icon-bar > * i {\n      font-size: 1.875rem;\n      vertical-align: middle; }\n    .icon-bar > * img {\n      width: 1.875rem;\n      height: 1.875rem; }\n  .icon-bar.label-right > * i, .icon-bar.label-right > * img {\n    margin: 0 0.0625rem 0 0;\n    display: inline-block; }\n    .icon-bar.label-right > * i + label, .icon-bar.label-right > * img + label {\n      margin-top: 0; }\n  .icon-bar.label-right > * label {\n    display: inline-block; }\n  .icon-bar.vertical.label-right > * {\n    text-align: left; }\n  .icon-bar.vertical, .icon-bar.small-vertical {\n    height: 100%;\n    width: auto; }\n    .icon-bar.vertical .item, .icon-bar.small-vertical .item {\n      width: auto;\n      margin: auto;\n      float: none; }\n  @media only screen and (min-width:40.063em) {\n    .icon-bar.medium-vertical {\n      height: 100%;\n      width: auto; }\n      .icon-bar.medium-vertical .item {\n        width: auto;\n        margin: auto;\n        float: none; } }\n  @media only screen and (min-width:64.063em) {\n    .icon-bar.large-vertical {\n      height: 100%;\n      width: auto; }\n      .icon-bar.large-vertical .item {\n        width: auto;\n        margin: auto;\n        float: none; } }\n  .icon-bar > * {\n    font-size: 1rem;\n    padding: 1.25rem; }\n    .icon-bar > * i + label, .icon-bar > * img + label {\n      margin-top: 0.0625rem; }\n    .icon-bar > * i {\n      font-size: 1.875rem; }\n    .icon-bar > * img {\n      width: 1.875rem;\n      height: 1.875rem; }\n  .icon-bar > * label {\n    color: #FFFFFF; }\n  .icon-bar > * i {\n    color: #FFFFFF; }\n  .icon-bar > a:hover {\n    background: #008CBA; }\n    .icon-bar > a:hover label {\n      color: #FFFFFF; }\n    .icon-bar > a:hover i {\n      color: #FFFFFF; }\n  .icon-bar > a.active {\n    background: #008CBA; }\n    .icon-bar > a.active label {\n      color: #FFFFFF; }\n    .icon-bar > a.active i {\n      color: #FFFFFF; }\n\n.icon-bar.two-up .item {\n  width: 50%; }\n.icon-bar.two-up.vertical .item, .icon-bar.two-up.small-vertical .item {\n  width: auto; }\n@media only screen and (min-width:40.063em) {\n  .icon-bar.two-up.medium-vertical .item {\n    width: auto; } }\n@media only screen and (min-width:64.063em) {\n  .icon-bar.two-up.large-vertical .item {\n    width: auto; } }\n.icon-bar.three-up .item {\n  width: 33.3333%; }\n.icon-bar.three-up.vertical .item, .icon-bar.three-up.small-vertical .item {\n  width: auto; }\n@media only screen and (min-width:40.063em) {\n  .icon-bar.three-up.medium-vertical .item {\n    width: auto; } }\n@media only screen and (min-width:64.063em) {\n  .icon-bar.three-up.large-vertical .item {\n    width: auto; } }\n.icon-bar.four-up .item {\n  width: 25%; }\n.icon-bar.four-up.vertical .item, .icon-bar.four-up.small-vertical .item {\n  width: auto; }\n@media only screen and (min-width:40.063em) {\n  .icon-bar.four-up.medium-vertical .item {\n    width: auto; } }\n@media only screen and (min-width:64.063em) {\n  .icon-bar.four-up.large-vertical .item {\n    width: auto; } }\n.icon-bar.five-up .item {\n  width: 20%; }\n.icon-bar.five-up.vertical .item, .icon-bar.five-up.small-vertical .item {\n  width: auto; }\n@media only screen and (min-width:40.063em) {\n  .icon-bar.five-up.medium-vertical .item {\n    width: auto; } }\n@media only screen and (min-width:64.063em) {\n  .icon-bar.five-up.large-vertical .item {\n    width: auto; } }\n.icon-bar.six-up .item {\n  width: 16.66667%; }\n.icon-bar.six-up.vertical .item, .icon-bar.six-up.small-vertical .item {\n  width: auto; }\n@media only screen and (min-width:40.063em) {\n  .icon-bar.six-up.medium-vertical .item {\n    width: auto; } }\n@media only screen and (min-width:64.063em) {\n  .icon-bar.six-up.large-vertical .item {\n    width: auto; } }\n\n.inline-list {\n  margin: 0 auto 1.0625rem auto;\n  margin-left: -1.375rem;\n  margin-right: 0;\n  padding: 0;\n  list-style: none;\n  overflow: hidden; }\n  .inline-list > li {\n    list-style: none;\n    float: left;\n    margin-left: 1.375rem;\n    display: block; }\n    .inline-list > li > * {\n      display: block; }\n\n/* Foundation Joyride */\n.joyride-list {\n  display: none; }\n\n/* Default styles for the container */\n.joyride-tip-guide {\n  display: none;\n  position: absolute;\n  background: #333333;\n  color: #FFFFFF;\n  z-index: 101;\n  top: 0;\n  left: 2.5%;\n  font-family: inherit;\n  font-weight: normal;\n  width: 95%; }\n\n.lt-ie9 .joyride-tip-guide {\n  max-width: 800px;\n  left: 50%;\n  margin-left: -400px; }\n\n.joyride-content-wrapper {\n  width: 100%;\n  padding: 1.125rem 1.25rem 1.5rem; }\n  .joyride-content-wrapper .button {\n    margin-bottom: 0 !important; }\n  .joyride-content-wrapper .joyride-prev-tip {\n    margin-right: 10px; }\n\n/* Add a little css triangle pip, older browser just miss out on the fanciness of it */\n.joyride-tip-guide .joyride-nub {\n  display: block;\n  position: absolute;\n  left: 22px;\n  width: 0;\n  height: 0;\n  border: 10px solid #333333; }\n  .joyride-tip-guide .joyride-nub.top {\n    border-top-style: solid;\n    border-color: #333333;\n    border-top-color: transparent !important;\n    border-left-color: transparent !important;\n    border-right-color: transparent !important;\n    top: -20px; }\n  .joyride-tip-guide .joyride-nub.bottom {\n    border-bottom-style: solid;\n    border-color: #333333 !important;\n    border-bottom-color: transparent !important;\n    border-left-color: transparent !important;\n    border-right-color: transparent !important;\n    bottom: -20px; }\n  .joyride-tip-guide .joyride-nub.right {\n    right: -20px; }\n  .joyride-tip-guide .joyride-nub.left {\n    left: -20px; }\n\n/* Typography */\n.joyride-tip-guide h1, .joyride-tip-guide h2, .joyride-tip-guide h3, .joyride-tip-guide h4, .joyride-tip-guide h5, .joyride-tip-guide h6 {\n  line-height: 1.25;\n  margin: 0;\n  font-weight: bold;\n  color: #FFFFFF; }\n\n.joyride-tip-guide p {\n  margin: 0 0 1.125rem 0;\n  font-size: 0.875rem;\n  line-height: 1.3; }\n\n.joyride-timer-indicator-wrap {\n  width: 50px;\n  height: 3px;\n  border: solid 1px #555555;\n  position: absolute;\n  right: 1.0625rem;\n  bottom: 1rem; }\n\n.joyride-timer-indicator {\n  display: block;\n  width: 0;\n  height: inherit;\n  background: #666666; }\n\n.joyride-close-tip {\n  position: absolute;\n  right: 12px;\n  top: 10px;\n  color: #777777 !important;\n  text-decoration: none;\n  font-size: 24px;\n  font-weight: normal;\n  line-height: 0.5 !important; }\n  .joyride-close-tip:hover, .joyride-close-tip:focus {\n    color: #EEEEEE !important; }\n\n.joyride-modal-bg {\n  position: fixed;\n  height: 100%;\n  width: 100%;\n  background: transparent;\n  background: rgba(0, 0, 0, 0.5);\n  z-index: 100;\n  display: none;\n  top: 0;\n  left: 0;\n  cursor: pointer; }\n\n.joyride-expose-wrapper {\n  background-color: #FFFFFF;\n  position: absolute;\n  border-radius: 3px;\n  z-index: 102;\n  box-shadow: 0 0 15px #FFFFFF; }\n\n.joyride-expose-cover {\n  background: transparent;\n  border-radius: 3px;\n  position: absolute;\n  z-index: 9999;\n  top: 0;\n  left: 0; }\n\n/* Styles for screens that are at least 768px; */\n@media only screen and (min-width:40.063em) {\n  .joyride-tip-guide {\n    width: 300px;\n    left: inherit; }\n    .joyride-tip-guide .joyride-nub.bottom {\n      border-color: #333333 !important;\n      border-bottom-color: transparent !important;\n      border-left-color: transparent !important;\n      border-right-color: transparent !important;\n      bottom: -20px; }\n    .joyride-tip-guide .joyride-nub.right {\n      border-color: #333333 !important;\n      border-top-color: transparent !important;\n      border-right-color: transparent !important;\n      border-bottom-color: transparent !important;\n      top: 22px;\n      left: auto;\n      right: -20px; }\n    .joyride-tip-guide .joyride-nub.left {\n      border-color: #333333 !important;\n      border-top-color: transparent !important;\n      border-left-color: transparent !important;\n      border-bottom-color: transparent !important;\n      top: 22px;\n      left: -20px;\n      right: auto; }\n }\n\n.keystroke, kbd {\n  background-color: #ededed;\n  border-color: #dddddd;\n  color: #222222;\n  border-style: solid;\n  border-width: 1px;\n  margin: 0;\n  font-family: "Consolas", "Menlo", "Courier", monospace;\n  font-size: inherit;\n  padding: 0.125rem 0.25rem 0;\n  border-radius: 3px; }\n\n.label {\n  font-weight: normal;\n  font-family: "Helvetica Neue", Helvetica, Roboto, Arial, sans-serif;\n  text-align: center;\n  text-decoration: none;\n  line-height: 1;\n  white-space: nowrap;\n  display: inline-block;\n  position: relative;\n  margin-bottom: auto;\n  padding: 0.25rem 0.5rem 0.25rem;\n  font-size: 0.6875rem;\n  background-color: #008CBA;\n  color: #FFFFFF; }\n  .label.radius {\n    border-radius: 3px; }\n  .label.round {\n    border-radius: 1000px; }\n  .label.alert {\n    background-color: #f04124;\n    color: #FFFFFF; }\n  .label.warning {\n    background-color: #f08a24;\n    color: #FFFFFF; }\n  .label.success {\n    background-color: #43AC6A;\n    color: #FFFFFF; }\n  .label.secondary {\n    background-color: #e7e7e7;\n    color: #333333; }\n  .label.info {\n    background-color: #a0d3e8;\n    color: #333333; }\n\n[data-magellan-expedition], [data-magellan-expedition-clone] {\n  background: #FFFFFF;\n  z-index: 50;\n  min-width: 100%;\n  padding: 10px; }\n  [data-magellan-expedition] .sub-nav, [data-magellan-expedition-clone] .sub-nav {\n    margin-bottom: 0; }\n    [data-magellan-expedition] .sub-nav dd, [data-magellan-expedition-clone] .sub-nav dd {\n      margin-bottom: 0; }\n    [data-magellan-expedition] .sub-nav a, [data-magellan-expedition-clone] .sub-nav a {\n      line-height: 1.8em; }\n\n@-webkit-keyframes rotate {\n  from {\n    -webkit-transform: rotate(0deg); }\n\n  to {\n    -webkit-transform: rotate(360deg); } }\n\n@-moz-keyframes rotate {\n  from {\n    -moz-transform: rotate(0deg); }\n\n  to {\n    -moz-transform: rotate(360deg); } }\n\n@-o-keyframes rotate {\n  from {\n    -o-transform: rotate(0deg); }\n\n  to {\n    -o-transform: rotate(360deg); } }\n\n@keyframes rotate {\n  from {\n    transform: rotate(0deg); }\n\n  to {\n    transform: rotate(360deg); } }\n\n/* Orbit Graceful Loading */\n.slideshow-wrapper {\n  position: relative; }\n  .slideshow-wrapper ul {\n    list-style-type: none;\n    margin: 0; }\n    .slideshow-wrapper ul li, .slideshow-wrapper ul li .orbit-caption {\n      display: none; }\n    .slideshow-wrapper ul li:first-child {\n      display: block; }\n  .slideshow-wrapper .orbit-container {\n    background-color: transparent; }\n    .slideshow-wrapper .orbit-container li {\n      display: block; }\n      .slideshow-wrapper .orbit-container li .orbit-caption {\n        display: block; }\n    .slideshow-wrapper .orbit-container .orbit-bullets li {\n      display: inline-block; }\n  .slideshow-wrapper .preloader {\n    display: block;\n    width: 40px;\n    height: 40px;\n    position: absolute;\n    top: 50%;\n    left: 50%;\n    margin-top: -20px;\n    margin-left: -20px;\n    border: solid 3px;\n    border-color: #555555 #FFFFFF;\n    border-radius: 1000px;\n    animation-name: rotate;\n    animation-duration: 1.5s;\n    animation-iteration-count: infinite;\n    animation-timing-function: linear; }\n\n.orbit-container {\n  overflow: hidden;\n  width: 100%;\n  position: relative;\n  background: none; }\n  .orbit-container .orbit-slides-container {\n    list-style: none;\n    margin: 0;\n    padding: 0;\n    position: relative;\n    -webkit-transform: translateZ(0); }\n    .orbit-container .orbit-slides-container img {\n      display: block;\n      max-width: 100%; }\n    .orbit-container .orbit-slides-container > * {\n      position: absolute;\n      top: 0;\n      width: 100%;\n      margin-left: 100%; }\n      .orbit-container .orbit-slides-container > *:first-child {\n        margin-left: 0; }\n      .orbit-container .orbit-slides-container > * .orbit-caption {\n        position: absolute;\n        bottom: 0;\n        background-color: rgba(51, 51, 51, 0.8);\n        color: #FFFFFF;\n        width: 100%;\n        padding: 0.625rem 0.875rem;\n        font-size: 0.875rem; }\n  .orbit-container .orbit-slide-number {\n    position: absolute;\n    top: 10px;\n    left: 10px;\n    font-size: 12px;\n    color: #FFFFFF;\n    background: rgba(0, 0, 0, 0);\n    z-index: 10; }\n    .orbit-container .orbit-slide-number span {\n      font-weight: 700;\n      padding: 0.3125rem; }\n  .orbit-container .orbit-timer {\n    position: absolute;\n    top: 12px;\n    right: 10px;\n    height: 6px;\n    width: 100px;\n    z-index: 10; }\n    .orbit-container .orbit-timer .orbit-progress {\n      height: 3px;\n      background-color: rgba(255, 255, 255, 0.3);\n      display: block;\n      width: 0;\n      position: relative;\n      right: 20px;\n      top: 5px; }\n    .orbit-container .orbit-timer > span {\n      display: none;\n      position: absolute;\n      top: 0;\n      right: 0;\n      width: 11px;\n      height: 14px;\n      border: solid 4px #FFFFFF;\n      border-top: none;\n      border-bottom: none; }\n    .orbit-container .orbit-timer.paused > span {\n      right: -4px;\n      top: 0;\n      width: 11px;\n      height: 14px;\n      border: inset 8px;\n      border-left-style: solid;\n      border-color: transparent;\n      border-left-color: #FFFFFF; }\n      .orbit-container .orbit-timer.paused > span.dark {\n        border-left-color: #333333; }\n  .orbit-container:hover .orbit-timer > span {\n    display: block; }\n  .orbit-container .orbit-prev, .orbit-container .orbit-next {\n    position: absolute;\n    top: 45%;\n    margin-top: -25px;\n    width: 36px;\n    height: 60px;\n    line-height: 50px;\n    color: white;\n    background-color: transparent;\n    text-indent: -9999px !important;\n    z-index: 10; }\n    .orbit-container .orbit-prev:hover, .orbit-container .orbit-next:hover {\n      background-color: rgba(0, 0, 0, 0.3); }\n    .orbit-container .orbit-prev > span, .orbit-container .orbit-next > span {\n      position: absolute;\n      top: 50%;\n      margin-top: -10px;\n      display: block;\n      width: 0;\n      height: 0;\n      border: inset 10px; }\n  .orbit-container .orbit-prev {\n    left: 0; }\n    .orbit-container .orbit-prev > span {\n      border-right-style: solid;\n      border-color: transparent;\n      border-right-color: #FFFFFF; }\n    .orbit-container .orbit-prev:hover > span {\n      border-right-color: #FFFFFF; }\n  .orbit-container .orbit-next {\n    right: 0; }\n    .orbit-container .orbit-next > span {\n      border-color: transparent;\n      border-left-style: solid;\n      border-left-color: #FFFFFF;\n      left: 50%;\n      margin-left: -4px; }\n    .orbit-container .orbit-next:hover > span {\n      border-left-color: #FFFFFF; }\n\n.orbit-bullets-container {\n  text-align: center; }\n\n.orbit-bullets {\n  margin: 0 auto 30px auto;\n  overflow: hidden;\n  position: relative;\n  top: 10px;\n  float: none;\n  text-align: center;\n  display: block; }\n  .orbit-bullets li {\n    cursor: pointer;\n    display: inline-block;\n    width: 0.5625rem;\n    height: 0.5625rem;\n    background: #CCCCCC;\n    float: none;\n    margin-right: 6px;\n    border-radius: 1000px; }\n    .orbit-bullets li.active {\n      background: #999999; }\n    .orbit-bullets li:last-child {\n      margin-right: 0; }\n\n.touch .orbit-container .orbit-prev, .touch .orbit-container .orbit-next {\n  display: none; }\n.touch .orbit-bullets {\n  display: none; }\n\n@media only screen and (min-width:40.063em) {\n  .touch .orbit-container .orbit-prev, .touch .orbit-container .orbit-next {\n    display: inherit; }\n  .touch .orbit-bullets {\n    display: block; }\n }\n\n@media only screen and (max-width: 40em) {\n  .orbit-stack-on-small .orbit-slides-container {\n    height: auto !important; }\n  .orbit-stack-on-small .orbit-slides-container > * {\n    position: relative;\n    margin: 0 !important;\n    opacity: 1 !important; }\n  .orbit-stack-on-small .orbit-slide-number {\n    display: none; }\n\n  .orbit-timer {\n    display: none; }\n\n  .orbit-next, .orbit-prev {\n    display: none; }\n\n  .orbit-bullets {\n    display: none; }\n }\n\nul.pagination {\n  display: block;\n  min-height: 1.5rem;\n  margin-left: -0.3125rem; }\n  ul.pagination li {\n    height: 1.5rem;\n    color: #222222;\n    font-size: 0.875rem;\n    margin-left: 0.3125rem; }\n    ul.pagination li a, ul.pagination li button {\n      display: block;\n      padding: 0.0625rem 0.625rem 0.0625rem;\n      color: #999999;\n      background: none;\n      border-radius: 3px;\n      font-weight: normal;\n      font-size: 1em;\n      line-height: inherit;\n      transition: background-color 300ms ease-out; }\n    ul.pagination li:hover a, ul.pagination li a:focus, ul.pagination li:hover button, ul.pagination li button:focus {\n      background: #e6e6e6; }\n    ul.pagination li.unavailable a, ul.pagination li.unavailable button {\n      cursor: default;\n      color: #999999; }\n    ul.pagination li.unavailable:hover a, ul.pagination li.unavailable a:focus, ul.pagination li.unavailable:hover button, ul.pagination li.unavailable button:focus {\n      background: transparent; }\n    ul.pagination li.current a, ul.pagination li.current button {\n      background: #008CBA;\n      color: #FFFFFF;\n      font-weight: bold;\n      cursor: default; }\n      ul.pagination li.current a:hover, ul.pagination li.current a:focus, ul.pagination li.current button:hover, ul.pagination li.current button:focus {\n        background: #008CBA; }\n  ul.pagination li {\n    float: left;\n    display: block; }\n\n/* Pagination centred wrapper */\n.pagination-centered {\n  text-align: center; }\n  .pagination-centered ul.pagination li {\n    float: none;\n    display: inline-block; }\n\n/* Panels */\n.panel {\n  border-style: solid;\n  border-width: 1px;\n  border-color: #d8d8d8;\n  margin-bottom: 1.25rem;\n  padding: 1.25rem;\n  background: #f2f2f2;\n  color: #333333; }\n  .panel > :first-child {\n    margin-top: 0; }\n  .panel > :last-child {\n    margin-bottom: 0; }\n  .panel h1, .panel h2, .panel h3, .panel h4, .panel h5, .panel h6, .panel p, .panel li, .panel dl {\n    color: #333333; }\n  .panel h1, .panel h2, .panel h3, .panel h4, .panel h5, .panel h6 {\n    line-height: 1;\n    margin-bottom: 0.625rem; }\n    .panel h1.subheader, .panel h2.subheader, .panel h3.subheader, .panel h4.subheader, .panel h5.subheader, .panel h6.subheader {\n      line-height: 1.4; }\n  .panel.callout {\n    border-style: solid;\n    border-width: 1px;\n    border-color: #b6edff;\n    margin-bottom: 1.25rem;\n    padding: 1.25rem;\n    background: #ecfaff;\n    color: #333333; }\n    .panel.callout > :first-child {\n      margin-top: 0; }\n    .panel.callout > :last-child {\n      margin-bottom: 0; }\n    .panel.callout h1, .panel.callout h2, .panel.callout h3, .panel.callout h4, .panel.callout h5, .panel.callout h6, .panel.callout p, .panel.callout li, .panel.callout dl {\n      color: #333333; }\n    .panel.callout h1, .panel.callout h2, .panel.callout h3, .panel.callout h4, .panel.callout h5, .panel.callout h6 {\n      line-height: 1;\n      margin-bottom: 0.625rem; }\n      .panel.callout h1.subheader, .panel.callout h2.subheader, .panel.callout h3.subheader, .panel.callout h4.subheader, .panel.callout h5.subheader, .panel.callout h6.subheader {\n        line-height: 1.4; }\n    .panel.callout a:not(.button) {\n      color: #008CBA; }\n      .panel.callout a:not(.button):hover, .panel.callout a:not(.button):focus {\n        color: #0078a0; }\n  .panel.radius {\n    border-radius: 3px; }\n\n/* Pricing Tables */\n.pricing-table {\n  border: solid 1px #DDDDDD;\n  margin-left: 0;\n  margin-bottom: 1.25rem; }\n  .pricing-table * {\n    list-style: none;\n    line-height: 1; }\n  .pricing-table .title {\n    background-color: #333333;\n    padding: 0.9375rem 1.25rem;\n    text-align: center;\n    color: #EEEEEE;\n    font-weight: normal;\n    font-size: 1rem;\n    font-family: "Helvetica Neue", Helvetica, Roboto, Arial, sans-serif; }\n  .pricing-table .price {\n    background-color: #F6F6F6;\n    padding: 0.9375rem 1.25rem;\n    text-align: center;\n    color: #333333;\n    font-weight: normal;\n    font-size: 2rem;\n    font-family: "Helvetica Neue", Helvetica, Roboto, Arial, sans-serif; }\n  .pricing-table .description {\n    background-color: #FFFFFF;\n    padding: 0.9375rem;\n    text-align: center;\n    color: #777777;\n    font-size: 0.75rem;\n    font-weight: normal;\n    line-height: 1.4;\n    border-bottom: dotted 1px #DDDDDD; }\n  .pricing-table .bullet-item {\n    background-color: #FFFFFF;\n    padding: 0.9375rem;\n    text-align: center;\n    color: #333333;\n    font-size: 0.875rem;\n    font-weight: normal;\n    border-bottom: dotted 1px #DDDDDD; }\n  .pricing-table .cta-button {\n    background-color: #FFFFFF;\n    text-align: center;\n    padding: 1.25rem 1.25rem 0; }\n\n/* Progress Bar */\n.progress {\n  background-color: #F6F6F6;\n  height: 1.5625rem;\n  border: 1px solid white;\n  padding: 0.125rem;\n  margin-bottom: 0.625rem; }\n  .progress .meter {\n    background: #008CBA;\n    height: 100%;\n    display: block; }\n  .progress.secondary .meter {\n    background: #e7e7e7;\n    height: 100%;\n    display: block; }\n  .progress.success .meter {\n    background: #43AC6A;\n    height: 100%;\n    display: block; }\n  .progress.alert .meter {\n    background: #f04124;\n    height: 100%;\n    display: block; }\n  .progress.radius {\n    border-radius: 3px; }\n    .progress.radius .meter {\n      border-radius: 2px; }\n  .progress.round {\n    border-radius: 1000px; }\n    .progress.round .meter {\n      border-radius: 999px; }\n\n.range-slider {\n  display: block;\n  position: relative;\n  width: 100%;\n  height: 1rem;\n  border: 1px solid #DDDDDD;\n  margin: 1.25rem 0;\n  -ms-touch-action: none;\n  touch-action: none;\n  background: #FAFAFA; }\n  .range-slider.vertical-range {\n    display: block;\n    position: relative;\n    width: 100%;\n    height: 1rem;\n    border: 1px solid #DDDDDD;\n    margin: 1.25rem 0;\n    -ms-touch-action: none;\n    touch-action: none;\n    display: inline-block;\n    width: 1rem;\n    height: 12.5rem; }\n    .range-slider.vertical-range .range-slider-handle {\n      margin-top: 0;\n      margin-left: -0.5rem;\n      position: absolute;\n      bottom: -10.5rem; }\n    .range-slider.vertical-range .range-slider-active-segment {\n      width: 0.875rem;\n      height: auto;\n      bottom: 0; }\n  .range-slider.radius {\n    background: #FAFAFA;\n    border-radius: 3px; }\n    .range-slider.radius .range-slider-handle {\n      background: #008CBA;\n      border-radius: 3px; }\n      .range-slider.radius .range-slider-handle:hover {\n        background: #007ba4; }\n  .range-slider.round {\n    background: #FAFAFA;\n    border-radius: 1000px; }\n    .range-slider.round .range-slider-handle {\n      background: #008CBA;\n      border-radius: 1000px; }\n      .range-slider.round .range-slider-handle:hover {\n        background: #007ba4; }\n  .range-slider.disabled, .range-slider[disabled] {\n    background: #FAFAFA;\n    cursor: default;\n    opacity: 0.7; }\n    .range-slider.disabled .range-slider-handle, .range-slider[disabled] .range-slider-handle {\n      background: #008CBA;\n      cursor: default;\n      opacity: 0.7; }\n      .range-slider.disabled .range-slider-handle:hover, .range-slider[disabled] .range-slider-handle:hover {\n        background: #007ba4; }\n\n.range-slider-active-segment {\n  display: inline-block;\n  position: absolute;\n  height: 0.875rem;\n  background: #e5e5e5; }\n\n.range-slider-handle {\n  display: inline-block;\n  position: absolute;\n  z-index: 1;\n  top: -0.3125rem;\n  width: 2rem;\n  height: 1.375rem;\n  border: 1px solid none;\n  cursor: pointer;\n  -ms-touch-action: manipulation;\n  touch-action: manipulation;\n  background: #008CBA; }\n  .range-slider-handle:hover {\n    background: #007ba4; }\n\n.reveal-modal-bg {\n  position: absolute;\n  top: 0;\n  bottom: 0;\n  left: 0;\n  right: 0;\n  background: #000000;\n  background: rgba(0, 0, 0, 0.45);\n  z-index: 1004;\n  display: none;\n  left: 0; }\n\n.reveal-modal, dialog {\n  visibility: hidden;\n  display: none;\n  position: absolute;\n  z-index: 1005;\n  width: 100vw;\n  top: 0;\n  border-radius: 3px;\n  left: 0;\n  background-color: #FFFFFF;\n  padding: 1.25rem;\n  border: solid 1px #666666;\n  box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);\n  padding: 1.875rem; }\n  @media only screen and (max-width: 40em) {\n    .reveal-modal, dialog {\n      min-height: 100vh; } }\n  .reveal-modal .column, dialog .column, .reveal-modal .columns, dialog .columns {\n    min-width: 0; }\n  .reveal-modal > :first-child, dialog > :first-child {\n    margin-top: 0; }\n  .reveal-modal > :last-child, dialog > :last-child {\n    margin-bottom: 0; }\n  @media only screen and (min-width:40.063em) {\n    .reveal-modal, dialog {\n      width: 80%;\n      max-width: 62.5rem;\n      left: 0;\n      right: 0;\n      margin: 0 auto; } }\n  @media only screen and (min-width:40.063em) {\n    .reveal-modal, dialog {\n      top: 6.25rem; } }\n  .reveal-modal.radius, dialog.radius {\n    border-radius: 3px; }\n  .reveal-modal.round, dialog.round {\n    border-radius: 1000px; }\n  .reveal-modal.collapse, dialog.collapse {\n    padding: 0; }\n  @media only screen and (min-width:40.063em) {\n    .reveal-modal.tiny, dialog.tiny {\n      width: 30%;\n      max-width: 62.5rem;\n      left: 0;\n      right: 0;\n      margin: 0 auto; } }\n  @media only screen and (min-width:40.063em) {\n    .reveal-modal.small, dialog.small {\n      width: 40%;\n      max-width: 62.5rem;\n      left: 0;\n      right: 0;\n      margin: 0 auto; } }\n  @media only screen and (min-width:40.063em) {\n    .reveal-modal.medium, dialog.medium {\n      width: 60%;\n      max-width: 62.5rem;\n      left: 0;\n      right: 0;\n      margin: 0 auto; } }\n  @media only screen and (min-width:40.063em) {\n    .reveal-modal.large, dialog.large {\n      width: 70%;\n      max-width: 62.5rem;\n      left: 0;\n      right: 0;\n      margin: 0 auto; } }\n  @media only screen and (min-width:40.063em) {\n    .reveal-modal.xlarge, dialog.xlarge {\n      width: 95%;\n      max-width: 62.5rem;\n      left: 0;\n      right: 0;\n      margin: 0 auto; } }\n  .reveal-modal.full, dialog.full {\n    top: 0;\n    left: 0;\n    height: 100%;\n    height: 100vh;\n    min-height: 100vh;\n    max-width: none !important;\n    margin-left: 0 !important; }\n    @media only screen and (min-width:40.063em) {\n      .reveal-modal.full, dialog.full {\n        width: 100vw;\n        max-width: 62.5rem;\n        left: 0;\n        right: 0;\n        margin: 0 auto; } }\n  .reveal-modal .close-reveal-modal, dialog .close-reveal-modal {\n    font-size: 2.5rem;\n    line-height: 1;\n    position: absolute;\n    top: 0.625rem;\n    right: 1.375rem;\n    color: #AAAAAA;\n    font-weight: bold;\n    cursor: pointer; }\n\ndialog {\n  display: none; }\n  dialog::backdrop, dialog + .backdrop {\n    position: absolute;\n    top: 0;\n    bottom: 0;\n    left: 0;\n    right: 0;\n    background: #000000;\n    background: rgba(0, 0, 0, 0.45);\n    z-index: auto;\n    display: none;\n    left: 0; }\n  dialog[open] {\n    display: block; }\n\n@media print {\n  dialog, .reveal-modal, dialog {\n    display: none;\n    background: #FFFFFF !important; }\n }\n\n.side-nav {\n  display: block;\n  margin: 0;\n  padding: 0.875rem 0;\n  list-style-type: none;\n  list-style-position: outside;\n  font-family: "Helvetica Neue", Helvetica, Roboto, Arial, sans-serif; }\n  .side-nav li {\n    margin: 0 0 0.4375rem 0;\n    font-size: 0.875rem;\n    font-weight: normal; }\n    .side-nav li a:not(.button) {\n      display: block;\n      color: #008CBA;\n      margin: 0;\n      padding: 0.4375rem 0.875rem; }\n      .side-nav li a:not(.button):hover, .side-nav li a:not(.button):focus {\n        background: rgba(0, 0, 0, 0.025);\n        color: #1cc7ff; }\n    .side-nav li.active > a:first-child:not(.button) {\n      color: #1cc7ff;\n      font-weight: normal;\n      font-family: "Helvetica Neue", Helvetica, Roboto, Arial, sans-serif; }\n    .side-nav li.divider {\n      border-top: 1px solid;\n      height: 0;\n      padding: 0;\n      list-style: none;\n      border-top-color: white; }\n    .side-nav li.heading {\n      color: #008CBA;\n      font-size: 0.875rem;\n      font-weight: bold;\n      text-transform: uppercase; }\n\n.split.button {\n  position: relative;\n  padding-right: 5.0625rem; }\n  .split.button span {\n    display: block;\n    height: 100%;\n    position: absolute;\n    right: 0;\n    top: 0;\n    border-left: solid 1px; }\n    .split.button span:after {\n      position: absolute;\n      content: "";\n      width: 0;\n      height: 0;\n      display: block;\n      border-style: inset;\n      top: 50%;\n      left: 50%; }\n    .split.button span:active {\n      background-color: rgba(0, 0, 0, 0.1); }\n  .split.button span {\n    border-left-color: rgba(255, 255, 255, 0.5); }\n  .split.button span {\n    width: 3.09375rem; }\n    .split.button span:after {\n      border-top-style: solid;\n      border-width: 0.375rem;\n      top: 48%;\n      margin-left: -0.375rem; }\n  .split.button span:after {\n    border-color: #FFFFFF transparent transparent transparent; }\n  .split.button.secondary span {\n    border-left-color: rgba(255, 255, 255, 0.5); }\n  .split.button.secondary span:after {\n    border-color: #FFFFFF transparent transparent transparent; }\n  .split.button.alert span {\n    border-left-color: rgba(255, 255, 255, 0.5); }\n  .split.button.success span {\n    border-left-color: rgba(255, 255, 255, 0.5); }\n  .split.button.tiny {\n    padding-right: 3.75rem; }\n    .split.button.tiny span {\n      width: 2.25rem; }\n      .split.button.tiny span:after {\n        border-top-style: solid;\n        border-width: 0.375rem;\n        top: 48%;\n        margin-left: -0.375rem; }\n  .split.button.small {\n    padding-right: 4.375rem; }\n    .split.button.small span {\n      width: 2.625rem; }\n      .split.button.small span:after {\n        border-top-style: solid;\n        border-width: 0.4375rem;\n        top: 48%;\n        margin-left: -0.375rem; }\n  .split.button.large {\n    padding-right: 5.5rem; }\n    .split.button.large span {\n      width: 3.4375rem; }\n      .split.button.large span:after {\n        border-top-style: solid;\n        border-width: 0.3125rem;\n        top: 48%;\n        margin-left: -0.375rem; }\n  .split.button.expand {\n    padding-left: 2rem; }\n  .split.button.secondary span:after {\n    border-color: #333333 transparent transparent transparent; }\n  .split.button.radius span {\n    -webkit-border-bottom-right-radius: 3px;\n    -webkit-border-top-right-radius: 3px;\n    border-bottom-right-radius: 3px;\n    border-top-right-radius: 3px; }\n  .split.button.round span {\n    -webkit-border-bottom-right-radius: 1000px;\n    -webkit-border-top-right-radius: 1000px;\n    border-bottom-right-radius: 1000px;\n    border-top-right-radius: 1000px; }\n\n.sub-nav {\n  display: block;\n  width: auto;\n  overflow: hidden;\n  margin: -0.25rem 0 1.125rem;\n  padding-top: 0.25rem; }\n  .sub-nav dt {\n    text-transform: uppercase; }\n  .sub-nav dt, .sub-nav dd, .sub-nav li {\n    float: left;\n    display: inline;\n    margin-left: 1rem;\n    margin-bottom: 0;\n    font-family: "Helvetica Neue", Helvetica, Roboto, Arial, sans-serif;\n    font-weight: normal;\n    font-size: 0.875rem;\n    color: #999999; }\n    .sub-nav dt a, .sub-nav dd a, .sub-nav li a {\n      text-decoration: none;\n      color: #999999;\n      padding: 0.1875rem 1rem; }\n      .sub-nav dt a:hover, .sub-nav dd a:hover, .sub-nav li a:hover {\n        color: #737373; }\n    .sub-nav dt.active a, .sub-nav dd.active a, .sub-nav li.active a {\n      border-radius: 3px;\n      font-weight: normal;\n      background: #008CBA;\n      padding: 0.1875rem 1rem;\n      cursor: default;\n      color: #FFFFFF; }\n      .sub-nav dt.active a:hover, .sub-nav dd.active a:hover, .sub-nav li.active a:hover {\n        background: #0078a0; }\n\n.switch {\n  padding: 0;\n  border: none;\n  position: relative;\n  outline: 0;\n  -webkit-user-select: none;\n  -moz-user-select: none;\n  user-select: none; }\n  .switch label {\n    display: block;\n    margin-bottom: 1rem;\n    position: relative;\n    color: transparent;\n    background: #DDDDDD;\n    text-indent: 100%;\n    width: 4rem;\n    height: 2rem;\n    cursor: pointer;\n    transition: left 0.15s ease-out; }\n  .switch input {\n    opacity: 0;\n    position: absolute;\n    top: 9px;\n    left: 10px;\n    padding: 0; }\n    .switch input + label {\n      margin-left: 0;\n      margin-right: 0; }\n  .switch label:after {\n    content: "";\n    display: block;\n    background: #FFFFFF;\n    position: absolute;\n    top: 0.25rem;\n    left: 0.25rem;\n    width: 1.5rem;\n    height: 1.5rem;\n    -webkit-transition: left 0.15s ease-out;\n    -moz-transition: left 0.15s ease-out;\n    -o-transition: translate3d(0, 0, 0);\n    transition: left 0.15s ease-out;\n    -webkit-transform: translate3d(0, 0, 0);\n    -moz-transform: translate3d(0, 0, 0);\n    -o-transform: translate3d(0, 0, 0);\n    transform: translate3d(0, 0, 0); }\n  .switch input:checked + label {\n    background: #008CBA; }\n  .switch input:checked + label:after {\n    left: 2.25rem; }\n  .switch label {\n    width: 4rem;\n    height: 2rem; }\n  .switch label:after {\n    width: 1.5rem;\n    height: 1.5rem; }\n  .switch input:checked + label:after {\n    left: 2.25rem; }\n  .switch label {\n    color: transparent;\n    background: #DDDDDD; }\n  .switch label:after {\n    background: #FFFFFF; }\n  .switch input:checked + label {\n    background: #008CBA; }\n  .switch.large label {\n    width: 5rem;\n    height: 2.5rem; }\n  .switch.large label:after {\n    width: 2rem;\n    height: 2rem; }\n  .switch.large input:checked + label:after {\n    left: 2.75rem; }\n  .switch.small label {\n    width: 3.5rem;\n    height: 1.75rem; }\n  .switch.small label:after {\n    width: 1.25rem;\n    height: 1.25rem; }\n  .switch.small input:checked + label:after {\n    left: 2rem; }\n  .switch.tiny label {\n    width: 3rem;\n    height: 1.5rem; }\n  .switch.tiny label:after {\n    width: 1rem;\n    height: 1rem; }\n  .switch.tiny input:checked + label:after {\n    left: 1.75rem; }\n  .switch.radius label {\n    border-radius: 4px; }\n  .switch.radius label:after {\n    border-radius: 3px; }\n  .switch.round {\n    border-radius: 1000px; }\n    .switch.round label {\n      border-radius: 2rem; }\n    .switch.round label:after {\n      border-radius: 2rem; }\n\ntable {\n  background: #FFFFFF;\n  margin-bottom: 1.25rem;\n  border: solid 1px #DDDDDD;\n  table-layout: auto; }\n  table caption {\n    background: transparent;\n    color: #222222;\n    font-size: 1rem;\n    font-weight: bold; }\n  table thead {\n    background: #F5F5F5; }\n    table thead tr th, table thead tr td {\n      padding: 0.5rem 0.625rem 0.625rem;\n      font-size: 0.875rem;\n      font-weight: bold;\n      color: #222222; }\n  table tfoot {\n    background: #F5F5F5; }\n    table tfoot tr th, table tfoot tr td {\n      padding: 0.5rem 0.625rem 0.625rem;\n      font-size: 0.875rem;\n      font-weight: bold;\n      color: #222222; }\n  table tr th, table tr td {\n    padding: 0.5625rem 0.625rem;\n    font-size: 0.875rem;\n    color: #222222;\n    text-align: left; }\n  table tr.even, table tr.alt, table tr:nth-of-type(even) {\n    background: #F9F9F9; }\n  table thead tr th, table tfoot tr th, table tfoot tr td, table tbody tr th, table tbody tr td, table tr td {\n    display: table-cell;\n    line-height: 1.125rem; }\n\n.tabs {\n  margin-bottom: 0 !important;\n  margin-left: 0; }\n  .tabs:before, .tabs:after {\n    content: " ";\n    display: table; }\n  .tabs:after {\n    clear: both; }\n  .tabs dd, .tabs .tab-title {\n    position: relative;\n    margin-bottom: 0 !important;\n    list-style: none;\n    float: left; }\n    .tabs dd > a, .tabs .tab-title > a {\n      outline: none;\n      display: block;\n      background-color: #EFEFEF;\n      color: #222222;\n      padding: 1rem 2rem;\n      font-family: "Helvetica Neue", Helvetica, Roboto, Arial, sans-serif;\n      font-size: 1rem; }\n      .tabs dd > a:hover, .tabs .tab-title > a:hover {\n        background-color: #e1e1e1; }\n    .tabs dd.active a, .tabs .tab-title.active a {\n      background-color: #FFFFFF;\n      color: #222222; }\n  .tabs.radius dd:first-child a, .tabs.radius .tab:first-child a {\n    -webkit-border-bottom-left-radius: 3px;\n    -webkit-border-top-left-radius: 3px;\n    border-bottom-left-radius: 3px;\n    border-top-left-radius: 3px; }\n  .tabs.radius dd:last-child a, .tabs.radius .tab:last-child a {\n    -webkit-border-bottom-right-radius: 3px;\n    -webkit-border-top-right-radius: 3px;\n    border-bottom-right-radius: 3px;\n    border-top-right-radius: 3px; }\n  .tabs.vertical dd, .tabs.vertical .tab-title {\n    position: inherit;\n    float: none;\n    display: block;\n    top: auto; }\n\n.tabs-content {\n  margin-bottom: 1.5rem;\n  width: 100%; }\n  .tabs-content:before, .tabs-content:after {\n    content: " ";\n    display: table; }\n  .tabs-content:after {\n    clear: both; }\n  .tabs-content > .content {\n    display: none;\n    float: left;\n    padding: 0.9375rem 0;\n    width: 100%; }\n    .tabs-content > .content.active {\n      display: block;\n      float: none; }\n    .tabs-content > .content.contained {\n      padding: 0.9375rem; }\n  .tabs-content.vertical {\n    display: block; }\n    .tabs-content.vertical > .content {\n      padding: 0 0.9375rem; }\n\n@media only screen and (min-width:40.063em) {\n  .tabs.vertical {\n    width: 20%;\n    max-width: 20%;\n    float: left;\n    margin: 0 0 1.25rem; }\n\n  .tabs-content.vertical {\n    width: 80%;\n    max-width: 80%;\n    float: left;\n    margin-left: -1px;\n    padding-left: 1rem; }\n }\n\n.no-js .tabs-content > .content {\n  display: block;\n  float: none; }\n\n/* Image Thumbnails */\n.th {\n  line-height: 0;\n  display: inline-block;\n  border: solid 4px #FFFFFF;\n  max-width: 100%;\n  box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.2);\n  transition: all 200ms ease-out; }\n  .th:hover, .th:focus {\n    box-shadow: 0 0 6px 1px rgba(0, 140, 186, 0.5); }\n  .th.radius {\n    border-radius: 3px; }\n\n/* Tooltips */\n.has-tip {\n  border-bottom: dotted 1px #CCCCCC;\n  cursor: help;\n  font-weight: bold;\n  color: #333333; }\n  .has-tip:hover, .has-tip:focus {\n    border-bottom: dotted 1px #003f54;\n    color: #008CBA; }\n  .has-tip.tip-left, .has-tip.tip-right {\n    float: none !important; }\n\n.tooltip {\n  display: none;\n  position: absolute;\n  z-index: 1006;\n  font-weight: normal;\n  font-size: 0.875rem;\n  line-height: 1.3;\n  padding: 0.75rem;\n  max-width: 300px;\n  left: 50%;\n  width: 100%;\n  color: #FFFFFF;\n  background: #333333; }\n  .tooltip > .nub {\n    display: block;\n    left: 5px;\n    position: absolute;\n    width: 0;\n    height: 0;\n    border: solid 5px;\n    border-color: transparent transparent #333333 transparent;\n    top: -10px;\n    pointer-events: none; }\n    .tooltip > .nub.rtl {\n      left: auto;\n      right: 5px; }\n  .tooltip.radius {\n    border-radius: 3px; }\n  .tooltip.round {\n    border-radius: 1000px; }\n    .tooltip.round > .nub {\n      left: 2rem; }\n  .tooltip.opened {\n    color: #008CBA !important;\n    border-bottom: dotted 1px #003f54 !important; }\n\n.tap-to-close {\n  display: block;\n  font-size: 0.625rem;\n  color: #777777;\n  font-weight: normal; }\n\n@media only screen and (min-width:40.063em) {\n  .tooltip > .nub {\n    border-color: transparent transparent #333333 transparent;\n    top: -10px; }\n  .tooltip.tip-top > .nub {\n    border-color: #333333 transparent transparent transparent;\n    top: auto;\n    bottom: -10px; }\n  .tooltip.tip-left, .tooltip.tip-right {\n    float: none !important; }\n  .tooltip.tip-left > .nub {\n    border-color: transparent transparent transparent #333333;\n    right: -10px;\n    left: auto;\n    top: 50%;\n    margin-top: -5px; }\n  .tooltip.tip-right > .nub {\n    border-color: transparent #333333 transparent transparent;\n    right: auto;\n    left: -10px;\n    top: 50%;\n    margin-top: -5px; }\n }\n\nmeta.foundation-mq-topbar {\n  font-family: "/only screen and (min-width:40.063em)/";\n  width: 40.063em; }\n\n/* Wrapped around .top-bar to contain to grid width */\n.contain-to-grid {\n  width: 100%;\n  background: #FFFFFF; }\n  .contain-to-grid .top-bar {\n    margin-bottom: 0; }\n\n.fixed {\n  width: 100%;\n  left: 0;\n  position: fixed;\n  top: 0;\n  z-index: 99; }\n  .fixed.expanded:not(.top-bar) {\n    overflow-y: auto;\n    height: auto;\n    width: 100%;\n    max-height: 100%; }\n    .fixed.expanded:not(.top-bar) .title-area {\n      position: fixed;\n      width: 100%;\n      z-index: 99; }\n    .fixed.expanded:not(.top-bar) .top-bar-section {\n      z-index: 98;\n      margin-top: 2.8125rem; }\n\n.top-bar {\n  overflow: hidden;\n  height: 2.8125rem;\n  line-height: 2.8125rem;\n  position: relative;\n  background: #FFFFFF;\n  margin-bottom: 0; }\n  .top-bar ul {\n    margin-bottom: 0;\n    list-style: none; }\n  .top-bar .row {\n    max-width: none; }\n  .top-bar form, .top-bar input {\n    margin-bottom: 0; }\n  .top-bar input {\n    height: 1.75rem;\n    padding-top: 0.35rem;\n    padding-bottom: 0.35rem;\n    font-size: 0.75rem; }\n  .top-bar .button, .top-bar button {\n    padding-top: 0.4125rem;\n    padding-bottom: 0.4125rem;\n    margin-bottom: 0;\n    font-size: 0.75rem; }\n    @media only screen and (max-width: 40em) {\n      .top-bar .button, .top-bar button {\n        position: relative;\n        top: -1px; } }\n  .top-bar .title-area {\n    position: relative;\n    margin: 0; }\n  .top-bar .name {\n    height: 2.8125rem;\n    margin: 0;\n    font-size: 16px; }\n    .top-bar .name h1, .top-bar .name h2, .top-bar .name h3, .top-bar .name h4, .top-bar .name p, .top-bar .name span {\n      line-height: 2.8125rem;\n      font-size: 1.0625rem;\n      margin: 0; }\n      .top-bar .name h1 a, .top-bar .name h2 a, .top-bar .name h3 a, .top-bar .name h4 a, .top-bar .name p a, .top-bar .name span a {\n        font-weight: normal;\n        color: #333333;\n        width: 75%;\n        display: block;\n        padding: 0 0.9375rem; }\n  .top-bar .toggle-topbar {\n    position: absolute;\n    right: 0;\n    top: 0; }\n    .top-bar .toggle-topbar a {\n      color: #333333;\n      text-transform: uppercase;\n      font-size: 0.8125rem;\n      font-weight: bold;\n      position: relative;\n      display: block;\n      padding: 0 0.9375rem;\n      height: 2.8125rem;\n      line-height: 2.8125rem; }\n    .top-bar .toggle-topbar.menu-icon {\n      top: 50%;\n      margin-top: -16px; }\n      .top-bar .toggle-topbar.menu-icon a {\n        height: 34px;\n        line-height: 33px;\n        padding: 0 2.5rem 0 0.9375rem;\n        color: #333333;\n        position: relative; }\n        .top-bar .toggle-topbar.menu-icon a span::after {\n          content: "";\n          position: absolute;\n          display: block;\n          height: 0;\n          top: 50%;\n          margin-top: -8px;\n          right: 0.9375rem;\n          box-shadow: 0 0 0 1px #333333, 0 7px 0 1px #333333, 0 14px 0 1px #333333;\n          width: 16px; }\n        .top-bar .toggle-topbar.menu-icon a span:hover:after {\n          box-shadow: 0 0 0 1px "", 0 7px 0 1px "", 0 14px 0 1px ""; }\n  .top-bar.expanded {\n    height: auto;\n    background: transparent; }\n    .top-bar.expanded .title-area {\n      background: #FFFFFF; }\n    .top-bar.expanded .toggle-topbar a {\n      color: #888888; }\n      .top-bar.expanded .toggle-topbar a span::after {\n        box-shadow: 0 0 0 1px #888888, 0 7px 0 1px #888888, 0 14px 0 1px #888888; }\n\n.top-bar-section {\n  left: 0;\n  position: relative;\n  width: auto;\n  transition: left 300ms ease-out; }\n  .top-bar-section ul {\n    padding: 0;\n    width: 100%;\n    height: auto;\n    display: block;\n    font-size: 16px;\n    margin: 0; }\n  .top-bar-section .divider, .top-bar-section [role="separator"] {\n    border-top: solid 1px gray;\n    clear: both;\n    height: 1px;\n    width: 100%; }\n  .top-bar-section ul li {\n    background: #FFFFFF; }\n    .top-bar-section ul li > a {\n      display: block;\n      width: 100%;\n      color: #333333;\n      padding: 12px 0 12px 0;\n      padding-left: 0.9375rem;\n      font-family: "Helvetica Neue", Helvetica, Roboto, Arial, sans-serif;\n      font-size: 0.8125rem;\n      font-weight: normal;\n      text-transform: none; }\n      .top-bar-section ul li > a.button {\n        font-size: 0.8125rem;\n        padding-right: 0.9375rem;\n        padding-left: 0.9375rem;\n        background-color: #008CBA;\n        border-color: #007095;\n        color: #FFFFFF; }\n        .top-bar-section ul li > a.button:hover, .top-bar-section ul li > a.button:focus {\n          background-color: #007095; }\n        .top-bar-section ul li > a.button:hover, .top-bar-section ul li > a.button:focus {\n          color: #FFFFFF; }\n      .top-bar-section ul li > a.button.secondary {\n        background-color: #e7e7e7;\n        border-color: #b9b9b9;\n        color: #333333; }\n        .top-bar-section ul li > a.button.secondary:hover, .top-bar-section ul li > a.button.secondary:focus {\n          background-color: #b9b9b9; }\n        .top-bar-section ul li > a.button.secondary:hover, .top-bar-section ul li > a.button.secondary:focus {\n          color: #333333; }\n      .top-bar-section ul li > a.button.success {\n        background-color: #43AC6A;\n        border-color: #368a55;\n        color: #FFFFFF; }\n        .top-bar-section ul li > a.button.success:hover, .top-bar-section ul li > a.button.success:focus {\n          background-color: #368a55; }\n        .top-bar-section ul li > a.button.success:hover, .top-bar-section ul li > a.button.success:focus {\n          color: #FFFFFF; }\n      .top-bar-section ul li > a.button.alert {\n        background-color: #f04124;\n        border-color: #cf2a0e;\n        color: #FFFFFF; }\n        .top-bar-section ul li > a.button.alert:hover, .top-bar-section ul li > a.button.alert:focus {\n          background-color: #cf2a0e; }\n        .top-bar-section ul li > a.button.alert:hover, .top-bar-section ul li > a.button.alert:focus {\n          color: #FFFFFF; }\n      .top-bar-section ul li > a.button.warning {\n        background-color: #f08a24;\n        border-color: #cf6e0e;\n        color: #FFFFFF; }\n        .top-bar-section ul li > a.button.warning:hover, .top-bar-section ul li > a.button.warning:focus {\n          background-color: #cf6e0e; }\n        .top-bar-section ul li > a.button.warning:hover, .top-bar-section ul li > a.button.warning:focus {\n          color: #FFFFFF; }\n    .top-bar-section ul li > button {\n      font-size: 0.8125rem;\n      padding-right: 0.9375rem;\n      padding-left: 0.9375rem;\n      background-color: #008CBA;\n      border-color: #007095;\n      color: #FFFFFF; }\n      .top-bar-section ul li > button:hover, .top-bar-section ul li > button:focus {\n        background-color: #007095; }\n      .top-bar-section ul li > button:hover, .top-bar-section ul li > button:focus {\n        color: #FFFFFF; }\n      .top-bar-section ul li > button.secondary {\n        background-color: #e7e7e7;\n        border-color: #b9b9b9;\n        color: #333333; }\n        .top-bar-section ul li > button.secondary:hover, .top-bar-section ul li > button.secondary:focus {\n          background-color: #b9b9b9; }\n        .top-bar-section ul li > button.secondary:hover, .top-bar-section ul li > button.secondary:focus {\n          color: #333333; }\n      .top-bar-section ul li > button.success {\n        background-color: #43AC6A;\n        border-color: #368a55;\n        color: #FFFFFF; }\n        .top-bar-section ul li > button.success:hover, .top-bar-section ul li > button.success:focus {\n          background-color: #368a55; }\n        .top-bar-section ul li > button.success:hover, .top-bar-section ul li > button.success:focus {\n          color: #FFFFFF; }\n      .top-bar-section ul li > button.alert {\n        background-color: #f04124;\n        border-color: #cf2a0e;\n        color: #FFFFFF; }\n        .top-bar-section ul li > button.alert:hover, .top-bar-section ul li > button.alert:focus {\n          background-color: #cf2a0e; }\n        .top-bar-section ul li > button.alert:hover, .top-bar-section ul li > button.alert:focus {\n          color: #FFFFFF; }\n      .top-bar-section ul li > button.warning {\n        background-color: #f08a24;\n        border-color: #cf6e0e;\n        color: #FFFFFF; }\n        .top-bar-section ul li > button.warning:hover, .top-bar-section ul li > button.warning:focus {\n          background-color: #cf6e0e; }\n        .top-bar-section ul li > button.warning:hover, .top-bar-section ul li > button.warning:focus {\n          color: #FFFFFF; }\n    .top-bar-section ul li:hover:not(.has-form) > a {\n      background-color: #555555;\n      background: #FFFFFF;\n      color: #333333; }\n    .top-bar-section ul li.active > a {\n      background: #008CBA;\n      color: #333333; }\n      .top-bar-section ul li.active > a:hover {\n        background: #0078a0;\n        color: #FFFFFF; }\n  .top-bar-section .has-form {\n    padding: 0.9375rem; }\n  .top-bar-section .has-dropdown {\n    position: relative; }\n    .top-bar-section .has-dropdown > a:after {\n      content: "";\n      display: block;\n      width: 0;\n      height: 0;\n      border: inset 5px;\n      border-color: transparent transparent transparent rgba(51, 51, 51, 0.4);\n      border-left-style: solid;\n      margin-right: 0.9375rem;\n      margin-top: -4.5px;\n      position: absolute;\n      top: 50%;\n      right: 0; }\n    .top-bar-section .has-dropdown.moved {\n      position: static; }\n      .top-bar-section .has-dropdown.moved > .dropdown {\n        display: block;\n        position: static !important;\n        height: auto;\n        width: auto;\n        overflow: visible;\n        clip: auto;\n        position: absolute !important;\n        width: 100%; }\n      .top-bar-section .has-dropdown.moved > a:after {\n        display: none; }\n  .top-bar-section .dropdown {\n    padding: 0;\n    position: absolute;\n    left: 100%;\n    top: 0;\n    z-index: 99;\n    display: block;\n    position: absolute !important;\n    height: 1px;\n    width: 1px;\n    overflow: hidden;\n    clip: rect(1px, 1px, 1px, 1px); }\n    .top-bar-section .dropdown li {\n      width: 100%;\n      height: auto; }\n      .top-bar-section .dropdown li a {\n        font-weight: normal;\n        padding: 8px 0.9375rem; }\n        .top-bar-section .dropdown li a.parent-link {\n          font-weight: normal; }\n      .top-bar-section .dropdown li.title h5, .top-bar-section .dropdown li.parent-link {\n        margin-bottom: 0;\n        margin-top: 0;\n        font-size: 1.125rem; }\n        .top-bar-section .dropdown li.title h5 a, .top-bar-section .dropdown li.parent-link a {\n          color: #333333;\n          display: block; }\n          .top-bar-section .dropdown li.title h5 a:hover, .top-bar-section .dropdown li.parent-link a:hover {\n            background: none; }\n      .top-bar-section .dropdown li.has-form {\n        padding: 8px 0.9375rem; }\n      .top-bar-section .dropdown li .button, .top-bar-section .dropdown li button {\n        top: auto; }\n    .top-bar-section .dropdown label {\n      padding: 8px 0.9375rem 2px;\n      margin-bottom: 0;\n      text-transform: uppercase;\n      color: #333333;\n      font-weight: bold;\n      font-size: 0.625rem; }\n\n.js-generated {\n  display: block; }\n\n@media only screen and (min-width:40.063em) {\n  .top-bar {\n    background: #FFFFFF;\n    overflow: visible; }\n    .top-bar:before, .top-bar:after {\n      content: " ";\n      display: table; }\n    .top-bar:after {\n      clear: both; }\n    .top-bar .toggle-topbar {\n      display: none; }\n    .top-bar .title-area {\n      float: left; }\n    .top-bar .name h1 a {\n      width: auto; }\n    .top-bar input, .top-bar .button, .top-bar button {\n      font-size: 0.875rem;\n      position: relative;\n      height: 1.75rem;\n      top: 0.53125rem; }\n    .top-bar.expanded {\n      background: #FFFFFF; }\n\n  .contain-to-grid .top-bar {\n    max-width: 62.5rem;\n    margin: 0 auto;\n    margin-bottom: 0; }\n\n  .top-bar-section {\n    transition: none 0 0;\n    left: 0 !important; }\n    .top-bar-section ul {\n      width: auto;\n      height: auto !important;\n      display: inline; }\n      .top-bar-section ul li {\n        float: left; }\n        .top-bar-section ul li .js-generated {\n          display: none; }\n    .top-bar-section li.hover > a:not(.button) {\n      background-color: #555555;\n      background: #FFFFFF;\n      color: #333333; }\n    .top-bar-section li:not(.has-form) a:not(.button) {\n      padding: 0 0.9375rem;\n      line-height: 2.8125rem;\n      background: #FFFFFF; }\n      .top-bar-section li:not(.has-form) a:not(.button):hover {\n        background-color: #555555;\n        background: #FFFFFF; }\n    .top-bar-section li.active:not(.has-form) a:not(.button) {\n      padding: 0 0.9375rem;\n      line-height: 2.8125rem;\n      color: #333333;\n      background: #008CBA; }\n      .top-bar-section li.active:not(.has-form) a:not(.button):hover {\n        background: #0078a0;\n        color: #FFFFFF; }\n    .top-bar-section .has-dropdown > a {\n      padding-right: 2.1875rem !important; }\n      .top-bar-section .has-dropdown > a:after {\n        content: "";\n        display: block;\n        width: 0;\n        height: 0;\n        border: inset 5px;\n        border-color: rgba(51, 51, 51, 0.4) transparent transparent transparent;\n        border-top-style: solid;\n        margin-top: -2.5px;\n        top: 1.40625rem; }\n    .top-bar-section .has-dropdown.moved {\n      position: relative; }\n      .top-bar-section .has-dropdown.moved > .dropdown {\n        display: block;\n        position: absolute !important;\n        height: 1px;\n        width: 1px;\n        overflow: hidden;\n        clip: rect(1px, 1px, 1px, 1px); }\n    .top-bar-section .has-dropdown.hover > .dropdown, .top-bar-section .has-dropdown.not-click:hover > .dropdown {\n      display: block;\n      position: static !important;\n      height: auto;\n      width: auto;\n      overflow: visible;\n      clip: auto;\n      position: absolute !important; }\n    .top-bar-section .has-dropdown > a:focus + .dropdown {\n      display: block;\n      position: static !important;\n      height: auto;\n      width: auto;\n      overflow: visible;\n      clip: auto;\n      position: absolute !important; }\n    .top-bar-section .has-dropdown .dropdown li.has-dropdown > a:after {\n      border: none;\n      content: "\\00bb";\n      top: 1rem;\n      margin-top: -1px;\n      right: 5px;\n      line-height: 1.2; }\n    .top-bar-section .dropdown {\n      left: 0;\n      top: auto;\n      background: transparent;\n      min-width: 100%; }\n      .top-bar-section .dropdown li a {\n        color: #333333;\n        line-height: 2.8125rem;\n        white-space: nowrap;\n        padding: 12px 0.9375rem;\n        background: #FFFFFF; }\n      .top-bar-section .dropdown li:not(.has-form):not(.active) > a:not(.button) {\n        color: #333333;\n        background: #FFFFFF; }\n      .top-bar-section .dropdown li:not(.has-form):not(.active):hover > a:not(.button) {\n        color: #333333;\n        background-color: #555555;\n        background: #FFFFFF; }\n      .top-bar-section .dropdown li label {\n        white-space: nowrap;\n        background: #FFFFFF; }\n      .top-bar-section .dropdown li .dropdown {\n        left: 100%;\n        top: 0; }\n    .top-bar-section > ul > .divider, .top-bar-section > ul > [role="separator"] {\n      border-bottom: none;\n      border-top: none;\n      border-right: solid 1px white;\n      clear: none;\n      height: 2.8125rem;\n      width: 0; }\n    .top-bar-section .has-form {\n      background: #FFFFFF;\n      padding: 0 0.9375rem;\n      height: 2.8125rem; }\n    .top-bar-section .right li .dropdown {\n      left: auto;\n      right: 0; }\n      .top-bar-section .right li .dropdown li .dropdown {\n        right: 100%; }\n    .top-bar-section .left li .dropdown {\n      right: auto;\n      left: 0; }\n      .top-bar-section .left li .dropdown li .dropdown {\n        left: 100%; }\n\n  .no-js .top-bar-section ul li:hover > a {\n    background-color: #555555;\n    background: #FFFFFF;\n    color: #333333; }\n  .no-js .top-bar-section ul li:active > a {\n    background: #008CBA;\n    color: #333333; }\n  .no-js .top-bar-section .has-dropdown:hover > .dropdown {\n    display: block;\n    position: static !important;\n    height: auto;\n    width: auto;\n    overflow: visible;\n    clip: auto;\n    position: absolute !important; }\n  .no-js .top-bar-section .has-dropdown > a:focus + .dropdown {\n    display: block;\n    position: static !important;\n    height: auto;\n    width: auto;\n    overflow: visible;\n    clip: auto;\n    position: absolute !important; }\n }\n\n.text-left {\n  text-align: left !important; }\n\n.text-right {\n  text-align: right !important; }\n\n.text-center {\n  text-align: center !important; }\n\n.text-justify {\n  text-align: justify !important; }\n\n@media only screen and (max-width: 40em) {\n  .small-only-text-left {\n    text-align: left !important; }\n\n  .small-only-text-right {\n    text-align: right !important; }\n\n  .small-only-text-center {\n    text-align: center !important; }\n\n  .small-only-text-justify {\n    text-align: justify !important; }\n }\n\n@media only screen {\n  .small-text-left {\n    text-align: left !important; }\n\n  .small-text-right {\n    text-align: right !important; }\n\n  .small-text-center {\n    text-align: center !important; }\n\n  .small-text-justify {\n    text-align: justify !important; }\n }\n\n@media only screen and (min-width:40.063em) and (max-width:64em) {\n  .medium-only-text-left {\n    text-align: left !important; }\n\n  .medium-only-text-right {\n    text-align: right !important; }\n\n  .medium-only-text-center {\n    text-align: center !important; }\n\n  .medium-only-text-justify {\n    text-align: justify !important; }\n }\n\n@media only screen and (min-width:40.063em) {\n  .medium-text-left {\n    text-align: left !important; }\n\n  .medium-text-right {\n    text-align: right !important; }\n\n  .medium-text-center {\n    text-align: center !important; }\n\n  .medium-text-justify {\n    text-align: justify !important; }\n }\n\n@media only screen and (min-width:64.063em) and (max-width:90em) {\n  .large-only-text-left {\n    text-align: left !important; }\n\n  .large-only-text-right {\n    text-align: right !important; }\n\n  .large-only-text-center {\n    text-align: center !important; }\n\n  .large-only-text-justify {\n    text-align: justify !important; }\n }\n\n@media only screen and (min-width:64.063em) {\n  .large-text-left {\n    text-align: left !important; }\n\n  .large-text-right {\n    text-align: right !important; }\n\n  .large-text-center {\n    text-align: center !important; }\n\n  .large-text-justify {\n    text-align: justify !important; }\n }\n\n@media only screen and (min-width:90.063em) and (max-width:120em) {\n  .xlarge-only-text-left {\n    text-align: left !important; }\n\n  .xlarge-only-text-right {\n    text-align: right !important; }\n\n  .xlarge-only-text-center {\n    text-align: center !important; }\n\n  .xlarge-only-text-justify {\n    text-align: justify !important; }\n }\n\n@media only screen and (min-width:90.063em) {\n  .xlarge-text-left {\n    text-align: left !important; }\n\n  .xlarge-text-right {\n    text-align: right !important; }\n\n  .xlarge-text-center {\n    text-align: center !important; }\n\n  .xlarge-text-justify {\n    text-align: justify !important; }\n }\n\n@media only screen and (min-width:120.063em) and (max-width:99999999em) {\n  .xxlarge-only-text-left {\n    text-align: left !important; }\n\n  .xxlarge-only-text-right {\n    text-align: right !important; }\n\n  .xxlarge-only-text-center {\n    text-align: center !important; }\n\n  .xxlarge-only-text-justify {\n    text-align: justify !important; }\n }\n\n@media only screen and (min-width:120.063em) {\n  .xxlarge-text-left {\n    text-align: left !important; }\n\n  .xxlarge-text-right {\n    text-align: right !important; }\n\n  .xxlarge-text-center {\n    text-align: center !important; }\n\n  .xxlarge-text-justify {\n    text-align: justify !important; }\n }\n\n/* Typography resets */\ndiv, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, form, p, blockquote, th, td {\n  margin: 0;\n  padding: 0; }\n\n/* Default Link Styles */\na {\n  color: #21578a;\n  text-decoration: none;\n  line-height: inherit; }\n  a:hover, a:focus {\n    color: #4a91d3; }\n  a img {\n    border: none; }\n\n/* Default paragraph styles */\np {\n  font-family: inherit;\n  font-weight: normal;\n  font-size: 1rem;\n  line-height: 1.6;\n  margin-bottom: 1.25rem;\n  text-rendering: optimizeLegibility; }\n  p.lead {\n    font-size: 1.21875rem;\n    line-height: 1.6; }\n  p aside {\n    font-size: 0.875rem;\n    line-height: 1.35;\n    font-style: italic; }\n\n/* Default header styles */\nh1, h2, h3, h4, h5, h6 {\n  font-family: "Helvetica Neue", Helvetica, Roboto, Arial, sans-serif;\n  font-weight: normal;\n  font-style: normal;\n  color: #333333;\n  text-rendering: optimizeLegibility;\n  margin-top: 0.2rem;\n  margin-bottom: 0.5rem;\n  line-height: 1.4; }\n  h1 small, h2 small, h3 small, h4 small, h5 small, h6 small {\n    font-size: 60%;\n    color: #666666;\n    line-height: 0; }\n\nh1 {\n  font-size: 2.125rem; }\n\nh2 {\n  font-size: 1.6875rem; }\n\nh3 {\n  font-size: 1.375rem; }\n\nh4 {\n  font-size: 1.125rem; }\n\nh5 {\n  font-size: 1.125rem; }\n\nh6 {\n  font-size: 1rem; }\n\n.subheader {\n  line-height: 1.4;\n  color: #666666;\n  font-weight: normal;\n  margin-top: 0.2rem;\n  margin-bottom: 0.5rem; }\n\nhr {\n  border: solid #DDDDDD;\n  border-width: 1px 0 0;\n  clear: both;\n  margin: 1.25rem 0 1.1875rem;\n  height: 0; }\n\n/* Helpful Typography Defaults */\nem, i {\n  font-style: italic;\n  line-height: inherit; }\n\nstrong, b {\n  font-weight: bold;\n  line-height: inherit; }\n\nsmall {\n  font-size: 60%;\n  line-height: inherit; }\n\ncode {\n  font-family: Consolas, "Liberation Mono", Courier, monospace;\n  font-weight: normal;\n  color: #333333;\n  background-color: #f8f8f8;\n  border-width: 1px;\n  border-style: solid;\n  border-color: #dfdfdf;\n  padding: 0.125rem 0.3125rem 0.0625rem; }\n\n/* Lists */\nul, ol, dl {\n  font-size: 1rem;\n  line-height: 1.6;\n  margin-bottom: 1.25rem;\n  list-style-position: outside;\n  font-family: inherit; }\n\nul {\n  margin-left: 1.1rem; }\n  ul.no-bullet {\n    margin-left: 0; }\n    ul.no-bullet li ul, ul.no-bullet li ol {\n      margin-left: 1.25rem;\n      margin-bottom: 0;\n      list-style: none; }\n\n/* Unordered Lists */\nul li ul, ul li ol {\n  margin-left: 1.25rem;\n  margin-bottom: 0; }\nul.square li ul, ul.circle li ul, ul.disc li ul {\n  list-style: inherit; }\nul.square {\n  list-style-type: square;\n  margin-left: 1.1rem; }\nul.circle {\n  list-style-type: circle;\n  margin-left: 1.1rem; }\nul.disc {\n  list-style-type: disc;\n  margin-left: 1.1rem; }\nul.no-bullet {\n  list-style: none; }\n\n/* Ordered Lists */\nol {\n  margin-left: 1.4rem; }\n  ol li ul, ol li ol {\n    margin-left: 1.25rem;\n    margin-bottom: 0; }\n\n/* Definition Lists */\ndl dt {\n  margin-bottom: 0.3rem;\n  font-weight: bold; }\ndl dd {\n  margin-bottom: 0.75rem; }\n\n/* Abbreviations */\nabbr, acronym {\n  text-transform: uppercase;\n  font-size: 90%;\n  color: #222;\n  cursor: help; }\n\nabbr {\n  text-transform: none; }\n  abbr[title] {\n    border-bottom: 1px dotted #DDDDDD; }\n\n/* Blockquotes */\nblockquote {\n  margin: 0 0 1.25rem;\n  padding: 0.5625rem 1.25rem 0 1.1875rem;\n  border-left: 1px solid #DDDDDD; }\n  blockquote cite {\n    display: block;\n    font-size: 0.8125rem;\n    color: #626262; }\n    blockquote cite:before {\n      content: "\\2014 \\0020"; }\n    blockquote cite a, blockquote cite a:visited {\n      color: #626262; }\n\nblockquote, blockquote p {\n  line-height: 1.6;\n  color: #666666; }\n\n/* Microformats */\n.vcard {\n  display: inline-block;\n  margin: 0 0 1.25rem 0;\n  border: 1px solid #c2c2c2;\n  padding: 0.625rem 0.75rem; }\n  .vcard li {\n    margin: 0;\n    display: block; }\n  .vcard .fn {\n    font-weight: bold;\n    font-size: 0.9375rem; }\n\n.vevent .summary {\n  font-weight: bold; }\n.vevent abbr {\n  cursor: default;\n  text-decoration: none;\n  font-weight: bold;\n  border: none;\n  padding: 0 0.0625rem; }\n\n@media only screen and (min-width:40.063em) {\n  h1, h2, h3, h4, h5, h6 {\n    line-height: 1.4; }\n\n  h1 {\n    font-size: 2.75rem; }\n\n  h2 {\n    font-size: 2.3125rem; }\n\n  h3 {\n    font-size: 1.6875rem; }\n\n  h4 {\n    font-size: 1.4375rem; }\n\n  h5 {\n    font-size: 1.125rem; }\n\n  h6 {\n    font-size: 1rem; }\n }\n\n/*\n       * Print styles.\n       *\n       * Inlined to avoid required HTTP connection: www.phpied.com/delay-loading-your-print-css/\n       * Credit to Paul Irish and HTML5 Boilerplate (html5boilerplate.com)\n      */\n.print-only {\n  display: none !important; }\n\n@media print {\n  * {\n    background: transparent !important;\n    color: #000000 !important;\n    /* Black prints faster: h5bp.com/s */\n    box-shadow: none !important;\n    text-shadow: none !important; }\n\n  a, a:visited {\n    text-decoration: underline; }\n\n  a[href]:after {\n    content: " (" attr(href) ")"; }\n\n  abbr[title]:after {\n    content: " (" attr(title) ")"; }\n\n  .ir a:after, a[href^="javascript:"]:after, a[href^="#"]:after {\n    content: ""; }\n\n  pre, blockquote {\n    border: 1px solid #999999;\n    page-break-inside: avoid; }\n\n  thead {\n    display: table-header-group;\n    /* h5bp.com/t */ }\n\n  tr, img {\n    page-break-inside: avoid; }\n\n  img {\n    max-width: 100% !important; }\n\n  @page {\n    margin: 0.5cm; }\n\n  p, h2, h3 {\n    orphans: 3;\n    widows: 3; }\n\n  h2, h3 {\n    page-break-after: avoid; }\n\n  .hide-on-print {\n    display: none !important; }\n\n  .print-only {\n    display: block !important; }\n\n  .hide-for-print {\n    display: none !important; }\n\n  .show-for-print {\n    display: inherit !important; }\n }\n\n.off-canvas-wrap {\n  -webkit-backface-visibility: hidden;\n  position: relative;\n  width: 100%;\n  overflow: hidden; }\n  .off-canvas-wrap.move-right, .off-canvas-wrap.move-left {\n    min-height: 100%;\n    -webkit-overflow-scrolling: touch; }\n\n.inner-wrap {\n  position: relative;\n  width: 100%;\n  -webkit-transition: -webkit-transform 500ms ease;\n  -moz-transition: -moz-transform 500ms ease;\n  -ms-transition: -ms-transform 500ms ease;\n  -o-transition: -o-transform 500ms ease;\n  transition: transform 500ms ease; }\n  .inner-wrap:before, .inner-wrap:after {\n    content: " ";\n    display: table; }\n  .inner-wrap:after {\n    clear: both; }\n\n.tab-bar {\n  -webkit-backface-visibility: hidden;\n  background: #333333;\n  color: #FFFFFF;\n  height: 2.8125rem;\n  line-height: 2.8125rem;\n  position: relative; }\n  .tab-bar h1, .tab-bar h2, .tab-bar h3, .tab-bar h4, .tab-bar h5, .tab-bar h6 {\n    color: #FFFFFF;\n    font-weight: bold;\n    line-height: 2.8125rem;\n    margin: 0; }\n  .tab-bar h1, .tab-bar h2, .tab-bar h3, .tab-bar h4 {\n    font-size: 1.125rem; }\n\n.left-small {\n  width: 2.8125rem;\n  height: 2.8125rem;\n  position: absolute;\n  top: 0;\n  border-right: solid 1px #1a1a1a;\n  left: 0; }\n\n.right-small {\n  width: 2.8125rem;\n  height: 2.8125rem;\n  position: absolute;\n  top: 0;\n  border-left: solid 1px #1a1a1a;\n  right: 0; }\n\n.tab-bar-section {\n  padding: 0 0.625rem;\n  position: absolute;\n  text-align: center;\n  height: 2.8125rem;\n  top: 0; }\n  @media only screen and (min-width:40.063em) {\n    .tab-bar-section.left {\n      text-align: left; }\n\n    .tab-bar-section.right {\n      text-align: right; }\n }\n  .tab-bar-section.left {\n    left: 0;\n    right: 2.8125rem; }\n  .tab-bar-section.right {\n    left: 2.8125rem;\n    right: 0; }\n  .tab-bar-section.middle {\n    left: 2.8125rem;\n    right: 2.8125rem; }\n\n.tab-bar .menu-icon {\n  text-indent: 2.1875rem;\n  width: 2.8125rem;\n  height: 2.8125rem;\n  display: block;\n  padding: 0;\n  color: #FFFFFF;\n  position: relative;\n  transform: translate3d(0, 0, 0); }\n  .tab-bar .menu-icon span::after {\n    content: "";\n    position: absolute;\n    display: block;\n    height: 0;\n    top: 50%;\n    margin-top: -0.5rem;\n    left: 0.90625rem;\n    box-shadow: 0 0 0 1px #FFFFFF, 0 7px 0 1px #FFFFFF, 0 14px 0 1px #FFFFFF;\n    width: 1rem; }\n  .tab-bar .menu-icon span:hover:after {\n    box-shadow: 0 0 0 1px #b3b3b3, 0 7px 0 1px #b3b3b3, 0 14px 0 1px #b3b3b3; }\n\n.left-off-canvas-menu {\n  -webkit-backface-visibility: hidden;\n  width: 15.625rem;\n  top: 0;\n  bottom: 0;\n  position: absolute;\n  overflow-x: hidden;\n  overflow-y: auto;\n  background: #333333;\n  z-index: 1001;\n  box-sizing: content-box;\n  transition: transform 500ms ease 0s;\n  -webkit-overflow-scrolling: touch;\n  -ms-overflow-style: -ms-autohiding-scrollbar;\n  -ms-transform: translate(-100%, 0);\n  -webkit-transform: translate3d(-100%, 0, 0);\n  -moz-transform: translate3d(-100%, 0, 0);\n  -ms-transform: translate3d(-100%, 0, 0);\n  -o-transform: translate3d(-100%, 0, 0);\n  transform: translate3d(-100%, 0, 0);\n  left: 0; }\n  .left-off-canvas-menu * {\n    -webkit-backface-visibility: hidden; }\n\n.right-off-canvas-menu {\n  -webkit-backface-visibility: hidden;\n  width: 15.625rem;\n  top: 0;\n  bottom: 0;\n  position: absolute;\n  overflow-x: hidden;\n  overflow-y: auto;\n  background: #333333;\n  z-index: 1001;\n  box-sizing: content-box;\n  transition: transform 500ms ease 0s;\n  -webkit-overflow-scrolling: touch;\n  -ms-overflow-style: -ms-autohiding-scrollbar;\n  -ms-transform: translate(100%, 0);\n  -webkit-transform: translate3d(100%, 0, 0);\n  -moz-transform: translate3d(100%, 0, 0);\n  -ms-transform: translate3d(100%, 0, 0);\n  -o-transform: translate3d(100%, 0, 0);\n  transform: translate3d(100%, 0, 0);\n  right: 0; }\n  .right-off-canvas-menu * {\n    -webkit-backface-visibility: hidden; }\n\nul.off-canvas-list {\n  list-style-type: none;\n  padding: 0;\n  margin: 0; }\n  ul.off-canvas-list li label {\n    display: block;\n    padding: 0.3rem 0.9375rem;\n    color: #999999;\n    text-transform: uppercase;\n    font-size: 0.75rem;\n    font-weight: bold;\n    background: #444444;\n    border-top: 1px solid #5e5e5e;\n    border-bottom: none;\n    margin: 0; }\n  ul.off-canvas-list li a {\n    display: block;\n    padding: 0.6666666667rem;\n    color: rgba(255, 255, 255, 0.7);\n    border-bottom: 1px solid #262626;\n    transition: background 300ms ease; }\n    ul.off-canvas-list li a:hover {\n      background: #242424; }\n\n.move-right > .inner-wrap {\n  -ms-transform: translate(15.625rem, 0);\n  -webkit-transform: translate3d(15.625rem, 0, 0);\n  -moz-transform: translate3d(15.625rem, 0, 0);\n  -ms-transform: translate3d(15.625rem, 0, 0);\n  -o-transform: translate3d(15.625rem, 0, 0);\n  transform: translate3d(15.625rem, 0, 0); }\n.move-right .exit-off-canvas {\n  -webkit-backface-visibility: hidden;\n  transition: background 300ms ease;\n  cursor: pointer;\n  box-shadow: -4px 0 4px rgba(0, 0, 0, 0.5), 4px 0 4px rgba(0, 0, 0, 0.5);\n  display: block;\n  position: absolute;\n  background: rgba(255, 255, 255, 0.2);\n  top: 0;\n  bottom: 0;\n  left: 0;\n  right: 0;\n  z-index: 1002;\n  -webkit-tap-highlight-color: rgba(0, 0, 0, 0); }\n  @media only screen and (min-width:40.063em) {\n    .move-right .exit-off-canvas:hover {\n      background: rgba(255, 255, 255, 0.05); }\n }\n\n.move-left > .inner-wrap {\n  -ms-transform: translate(-15.625rem, 0);\n  -webkit-transform: translate3d(-15.625rem, 0, 0);\n  -moz-transform: translate3d(-15.625rem, 0, 0);\n  -ms-transform: translate3d(-15.625rem, 0, 0);\n  -o-transform: translate3d(-15.625rem, 0, 0);\n  transform: translate3d(-15.625rem, 0, 0); }\n.move-left .exit-off-canvas {\n  -webkit-backface-visibility: hidden;\n  transition: background 300ms ease;\n  cursor: pointer;\n  box-shadow: -4px 0 4px rgba(0, 0, 0, 0.5), 4px 0 4px rgba(0, 0, 0, 0.5);\n  display: block;\n  position: absolute;\n  background: rgba(255, 255, 255, 0.2);\n  top: 0;\n  bottom: 0;\n  left: 0;\n  right: 0;\n  z-index: 1002;\n  -webkit-tap-highlight-color: rgba(0, 0, 0, 0); }\n  @media only screen and (min-width:40.063em) {\n    .move-left .exit-off-canvas:hover {\n      background: rgba(255, 255, 255, 0.05); }\n }\n\n.offcanvas-overlap .left-off-canvas-menu, .offcanvas-overlap .right-off-canvas-menu {\n  -ms-transform: none;\n  -webkit-transform: none;\n  -moz-transform: none;\n  -o-transform: none;\n  transform: none;\n  z-index: 1003; }\n.offcanvas-overlap .exit-off-canvas {\n  -webkit-backface-visibility: hidden;\n  transition: background 300ms ease;\n  cursor: pointer;\n  box-shadow: -4px 0 4px rgba(0, 0, 0, 0.5), 4px 0 4px rgba(0, 0, 0, 0.5);\n  display: block;\n  position: absolute;\n  background: rgba(255, 255, 255, 0.2);\n  top: 0;\n  bottom: 0;\n  left: 0;\n  right: 0;\n  z-index: 1002;\n  -webkit-tap-highlight-color: rgba(0, 0, 0, 0); }\n  @media only screen and (min-width:40.063em) {\n    .offcanvas-overlap .exit-off-canvas:hover {\n      background: rgba(255, 255, 255, 0.05); }\n }\n\n.offcanvas-overlap-left .right-off-canvas-menu {\n  -ms-transform: none;\n  -webkit-transform: none;\n  -moz-transform: none;\n  -o-transform: none;\n  transform: none;\n  z-index: 1003; }\n.offcanvas-overlap-left .exit-off-canvas {\n  -webkit-backface-visibility: hidden;\n  transition: background 300ms ease;\n  cursor: pointer;\n  box-shadow: -4px 0 4px rgba(0, 0, 0, 0.5), 4px 0 4px rgba(0, 0, 0, 0.5);\n  display: block;\n  position: absolute;\n  background: rgba(255, 255, 255, 0.2);\n  top: 0;\n  bottom: 0;\n  left: 0;\n  right: 0;\n  z-index: 1002;\n  -webkit-tap-highlight-color: rgba(0, 0, 0, 0); }\n  @media only screen and (min-width:40.063em) {\n    .offcanvas-overlap-left .exit-off-canvas:hover {\n      background: rgba(255, 255, 255, 0.05); }\n }\n\n.offcanvas-overlap-right .left-off-canvas-menu {\n  -ms-transform: none;\n  -webkit-transform: none;\n  -moz-transform: none;\n  -o-transform: none;\n  transform: none;\n  z-index: 1003; }\n.offcanvas-overlap-right .exit-off-canvas {\n  -webkit-backface-visibility: hidden;\n  transition: background 300ms ease;\n  cursor: pointer;\n  box-shadow: -4px 0 4px rgba(0, 0, 0, 0.5), 4px 0 4px rgba(0, 0, 0, 0.5);\n  display: block;\n  position: absolute;\n  background: rgba(255, 255, 255, 0.2);\n  top: 0;\n  bottom: 0;\n  left: 0;\n  right: 0;\n  z-index: 1002;\n  -webkit-tap-highlight-color: rgba(0, 0, 0, 0); }\n  @media only screen and (min-width:40.063em) {\n    .offcanvas-overlap-right .exit-off-canvas:hover {\n      background: rgba(255, 255, 255, 0.05); }\n }\n\n.no-csstransforms .left-off-canvas-menu {\n  left: -15.625rem; }\n.no-csstransforms .right-off-canvas-menu {\n  right: -15.625rem; }\n.no-csstransforms .move-left > .inner-wrap {\n  right: 15.625rem; }\n.no-csstransforms .move-right > .inner-wrap {\n  left: 15.625rem; }\n\n.left-submenu {\n  -webkit-backface-visibility: hidden;\n  width: 15.625rem;\n  top: 0;\n  bottom: 0;\n  position: absolute;\n  margin: 0;\n  overflow-x: hidden;\n  overflow-y: auto;\n  background: #333333;\n  z-index: 1002;\n  box-sizing: content-box;\n  -webkit-overflow-scrolling: touch;\n  -ms-transform: translate(-100%, 0);\n  -webkit-transform: translate3d(-100%, 0, 0);\n  -moz-transform: translate3d(-100%, 0, 0);\n  -ms-transform: translate3d(-100%, 0, 0);\n  -o-transform: translate3d(-100%, 0, 0);\n  transform: translate3d(-100%, 0, 0);\n  left: 0;\n  -webkit-transition: -webkit-transform 500ms ease;\n  -moz-transition: -moz-transform 500ms ease;\n  -ms-transition: -ms-transform 500ms ease;\n  -o-transition: -o-transform 500ms ease;\n  transition: transform 500ms ease; }\n  .left-submenu * {\n    -webkit-backface-visibility: hidden; }\n  .left-submenu .back > a {\n    padding: 0.3rem 0.9375rem;\n    color: #999999;\n    text-transform: uppercase;\n    font-weight: bold;\n    background: #444;\n    border-top: 1px solid #5e5e5e;\n    border-bottom: none;\n    margin: 0; }\n    .left-submenu .back > a:hover {\n      background: #303030;\n      border-top: 1px solid #5e5e5e;\n      border-bottom: none; }\n    .left-submenu .back > a:before {\n      content: "\\AB";\n      margin-right: 0.5rem;\n      display: inline; }\n  .left-submenu.move-right, .left-submenu.offcanvas-overlap-right, .left-submenu.offcanvas-overlap {\n    -ms-transform: translate(0%, 0);\n    -webkit-transform: translate3d(0%, 0, 0);\n    -moz-transform: translate3d(0%, 0, 0);\n    -ms-transform: translate3d(0%, 0, 0);\n    -o-transform: translate3d(0%, 0, 0);\n    transform: translate3d(0%, 0, 0); }\n\n.right-submenu {\n  -webkit-backface-visibility: hidden;\n  width: 15.625rem;\n  top: 0;\n  bottom: 0;\n  position: absolute;\n  margin: 0;\n  overflow-x: hidden;\n  overflow-y: auto;\n  background: #333333;\n  z-index: 1002;\n  box-sizing: content-box;\n  -webkit-overflow-scrolling: touch;\n  -ms-transform: translate(100%, 0);\n  -webkit-transform: translate3d(100%, 0, 0);\n  -moz-transform: translate3d(100%, 0, 0);\n  -ms-transform: translate3d(100%, 0, 0);\n  -o-transform: translate3d(100%, 0, 0);\n  transform: translate3d(100%, 0, 0);\n  right: 0;\n  -webkit-transition: -webkit-transform 500ms ease;\n  -moz-transition: -moz-transform 500ms ease;\n  -ms-transition: -ms-transform 500ms ease;\n  -o-transition: -o-transform 500ms ease;\n  transition: transform 500ms ease; }\n  .right-submenu * {\n    -webkit-backface-visibility: hidden; }\n  .right-submenu .back > a {\n    padding: 0.3rem 0.9375rem;\n    color: #999999;\n    text-transform: uppercase;\n    font-weight: bold;\n    background: #444;\n    border-top: 1px solid #5e5e5e;\n    border-bottom: none;\n    margin: 0; }\n    .right-submenu .back > a:hover {\n      background: #303030;\n      border-top: 1px solid #5e5e5e;\n      border-bottom: none; }\n    .right-submenu .back > a:after {\n      content: "\\BB";\n      margin-left: 0.5rem;\n      display: inline; }\n  .right-submenu.move-left, .right-submenu.offcanvas-overlap-left, .right-submenu.offcanvas-overlap {\n    -ms-transform: translate(0%, 0);\n    -webkit-transform: translate3d(0%, 0, 0);\n    -moz-transform: translate3d(0%, 0, 0);\n    -ms-transform: translate3d(0%, 0, 0);\n    -o-transform: translate3d(0%, 0, 0);\n    transform: translate3d(0%, 0, 0); }\n\n.left-off-canvas-menu ul.off-canvas-list li.has-submenu > a:after {\n  content: "\\BB";\n  margin-left: 0.5rem;\n  display: inline; }\n\n.right-off-canvas-menu ul.off-canvas-list li.has-submenu > a:before {\n  content: "\\AB";\n  margin-right: 0.5rem;\n  display: inline; }\n\n/* small displays */\n@media only screen {\n  .show-for-small-only, .show-for-small-up, .show-for-small, .show-for-small-down, .hide-for-medium-only, .hide-for-medium-up, .hide-for-medium, .show-for-medium-down, .hide-for-large-only, .hide-for-large-up, .hide-for-large, .show-for-large-down, .hide-for-xlarge-only, .hide-for-xlarge-up, .hide-for-xlarge, .show-for-xlarge-down, .hide-for-xxlarge-only, .hide-for-xxlarge-up, .hide-for-xxlarge, .show-for-xxlarge-down {\n    display: inherit !important; }\n\n  .hide-for-small-only, .hide-for-small-up, .hide-for-small, .hide-for-small-down, .show-for-medium-only, .show-for-medium-up, .show-for-medium, .hide-for-medium-down, .show-for-large-only, .show-for-large-up, .show-for-large, .hide-for-large-down, .show-for-xlarge-only, .show-for-xlarge-up, .show-for-xlarge, .hide-for-xlarge-down, .show-for-xxlarge-only, .show-for-xxlarge-up, .show-for-xxlarge, .hide-for-xxlarge-down {\n    display: none !important; }\n\n  .visible-for-small-only, .visible-for-small-up, .visible-for-small, .visible-for-small-down, .hidden-for-medium-only, .hidden-for-medium-up, .hidden-for-medium, .visible-for-medium-down, .hidden-for-large-only, .hidden-for-large-up, .hidden-for-large, .visible-for-large-down, .hidden-for-xlarge-only, .hidden-for-xlarge-up, .hidden-for-xlarge, .visible-for-xlarge-down, .hidden-for-xxlarge-only, .hidden-for-xxlarge-up, .hidden-for-xxlarge, .visible-for-xxlarge-down {\n    position: static !important;\n    height: auto;\n    width: auto;\n    overflow: visible;\n    clip: auto; }\n\n  .hidden-for-small-only, .hidden-for-small-up, .hidden-for-small, .hidden-for-small-down, .visible-for-medium-only, .visible-for-medium-up, .visible-for-medium, .hidden-for-medium-down, .visible-for-large-only, .visible-for-large-up, .visible-for-large, .hidden-for-large-down, .visible-for-xlarge-only, .visible-for-xlarge-up, .visible-for-xlarge, .hidden-for-xlarge-down, .visible-for-xxlarge-only, .visible-for-xxlarge-up, .visible-for-xxlarge, .hidden-for-xxlarge-down {\n    position: absolute !important;\n    height: 1px;\n    width: 1px;\n    overflow: hidden;\n    clip: rect(1px, 1px, 1px, 1px); }\n\n  table.show-for-small-only, table.show-for-small-up, table.show-for-small, table.show-for-small-down, table.hide-for-medium-only, table.hide-for-medium-up, table.hide-for-medium, table.show-for-medium-down, table.hide-for-large-only, table.hide-for-large-up, table.hide-for-large, table.show-for-large-down, table.hide-for-xlarge-only, table.hide-for-xlarge-up, table.hide-for-xlarge, table.show-for-xlarge-down, table.hide-for-xxlarge-only, table.hide-for-xxlarge-up, table.hide-for-xxlarge, table.show-for-xxlarge-down {\n    display: table !important; }\n\n  thead.show-for-small-only, thead.show-for-small-up, thead.show-for-small, thead.show-for-small-down, thead.hide-for-medium-only, thead.hide-for-medium-up, thead.hide-for-medium, thead.show-for-medium-down, thead.hide-for-large-only, thead.hide-for-large-up, thead.hide-for-large, thead.show-for-large-down, thead.hide-for-xlarge-only, thead.hide-for-xlarge-up, thead.hide-for-xlarge, thead.show-for-xlarge-down, thead.hide-for-xxlarge-only, thead.hide-for-xxlarge-up, thead.hide-for-xxlarge, thead.show-for-xxlarge-down {\n    display: table-header-group !important; }\n\n  tbody.show-for-small-only, tbody.show-for-small-up, tbody.show-for-small, tbody.show-for-small-down, tbody.hide-for-medium-only, tbody.hide-for-medium-up, tbody.hide-for-medium, tbody.show-for-medium-down, tbody.hide-for-large-only, tbody.hide-for-large-up, tbody.hide-for-large, tbody.show-for-large-down, tbody.hide-for-xlarge-only, tbody.hide-for-xlarge-up, tbody.hide-for-xlarge, tbody.show-for-xlarge-down, tbody.hide-for-xxlarge-only, tbody.hide-for-xxlarge-up, tbody.hide-for-xxlarge, tbody.show-for-xxlarge-down {\n    display: table-row-group !important; }\n\n  tr.show-for-small-only, tr.show-for-small-up, tr.show-for-small, tr.show-for-small-down, tr.hide-for-medium-only, tr.hide-for-medium-up, tr.hide-for-medium, tr.show-for-medium-down, tr.hide-for-large-only, tr.hide-for-large-up, tr.hide-for-large, tr.show-for-large-down, tr.hide-for-xlarge-only, tr.hide-for-xlarge-up, tr.hide-for-xlarge, tr.show-for-xlarge-down, tr.hide-for-xxlarge-only, tr.hide-for-xxlarge-up, tr.hide-for-xxlarge, tr.show-for-xxlarge-down {\n    display: table-row !important; }\n\n  th.show-for-small-only, td.show-for-small-only, th.show-for-small-up, td.show-for-small-up, th.show-for-small, td.show-for-small, th.show-for-small-down, td.show-for-small-down, th.hide-for-medium-only, td.hide-for-medium-only, th.hide-for-medium-up, td.hide-for-medium-up, th.hide-for-medium, td.hide-for-medium, th.show-for-medium-down, td.show-for-medium-down, th.hide-for-large-only, td.hide-for-large-only, th.hide-for-large-up, td.hide-for-large-up, th.hide-for-large, td.hide-for-large, th.show-for-large-down, td.show-for-large-down, th.hide-for-xlarge-only, td.hide-for-xlarge-only, th.hide-for-xlarge-up, td.hide-for-xlarge-up, th.hide-for-xlarge, td.hide-for-xlarge, th.show-for-xlarge-down, td.show-for-xlarge-down, th.hide-for-xxlarge-only, td.hide-for-xxlarge-only, th.hide-for-xxlarge-up, td.hide-for-xxlarge-up, th.hide-for-xxlarge, td.hide-for-xxlarge, th.show-for-xxlarge-down, td.show-for-xxlarge-down {\n    display: table-cell !important; }\n }\n\n/* medium displays */\n@media only screen and (min-width:40.063em) {\n  .hide-for-small-only, .show-for-small-up, .hide-for-small, .hide-for-small-down, .show-for-medium-only, .show-for-medium-up, .show-for-medium, .show-for-medium-down, .hide-for-large-only, .hide-for-large-up, .hide-for-large, .show-for-large-down, .hide-for-xlarge-only, .hide-for-xlarge-up, .hide-for-xlarge, .show-for-xlarge-down, .hide-for-xxlarge-only, .hide-for-xxlarge-up, .hide-for-xxlarge, .show-for-xxlarge-down {\n    display: inherit !important; }\n\n  .show-for-small-only, .hide-for-small-up, .show-for-small, .show-for-small-down, .hide-for-medium-only, .hide-for-medium-up, .hide-for-medium, .hide-for-medium-down, .show-for-large-only, .show-for-large-up, .show-for-large, .hide-for-large-down, .show-for-xlarge-only, .show-for-xlarge-up, .show-for-xlarge, .hide-for-xlarge-down, .show-for-xxlarge-only, .show-for-xxlarge-up, .show-for-xxlarge, .hide-for-xxlarge-down {\n    display: none !important; }\n\n  .hidden-for-small-only, .visible-for-small-up, .hidden-for-small, .hidden-for-small-down, .visible-for-medium-only, .visible-for-medium-up, .visible-for-medium, .visible-for-medium-down, .hidden-for-large-only, .hidden-for-large-up, .hidden-for-large, .visible-for-large-down, .hidden-for-xlarge-only, .hidden-for-xlarge-up, .hidden-for-xlarge, .visible-for-xlarge-down, .hidden-for-xxlarge-only, .hidden-for-xxlarge-up, .hidden-for-xxlarge, .visible-for-xxlarge-down {\n    position: static !important;\n    height: auto;\n    width: auto;\n    overflow: visible;\n    clip: auto; }\n\n  .visible-for-small-only, .hidden-for-small-up, .visible-for-small, .visible-for-small-down, .hidden-for-medium-only, .hidden-for-medium-up, .hidden-for-medium, .hidden-for-medium-down, .visible-for-large-only, .visible-for-large-up, .visible-for-large, .hidden-for-large-down, .visible-for-xlarge-only, .visible-for-xlarge-up, .visible-for-xlarge, .hidden-for-xlarge-down, .visible-for-xxlarge-only, .visible-for-xxlarge-up, .visible-for-xxlarge, .hidden-for-xxlarge-down {\n    position: absolute !important;\n    height: 1px;\n    width: 1px;\n    overflow: hidden;\n    clip: rect(1px, 1px, 1px, 1px); }\n\n  table.hide-for-small-only, table.show-for-small-up, table.hide-for-small, table.hide-for-small-down, table.show-for-medium-only, table.show-for-medium-up, table.show-for-medium, table.show-for-medium-down, table.hide-for-large-only, table.hide-for-large-up, table.hide-for-large, table.show-for-large-down, table.hide-for-xlarge-only, table.hide-for-xlarge-up, table.hide-for-xlarge, table.show-for-xlarge-down, table.hide-for-xxlarge-only, table.hide-for-xxlarge-up, table.hide-for-xxlarge, table.show-for-xxlarge-down {\n    display: table !important; }\n\n  thead.hide-for-small-only, thead.show-for-small-up, thead.hide-for-small, thead.hide-for-small-down, thead.show-for-medium-only, thead.show-for-medium-up, thead.show-for-medium, thead.show-for-medium-down, thead.hide-for-large-only, thead.hide-for-large-up, thead.hide-for-large, thead.show-for-large-down, thead.hide-for-xlarge-only, thead.hide-for-xlarge-up, thead.hide-for-xlarge, thead.show-for-xlarge-down, thead.hide-for-xxlarge-only, thead.hide-for-xxlarge-up, thead.hide-for-xxlarge, thead.show-for-xxlarge-down {\n    display: table-header-group !important; }\n\n  tbody.hide-for-small-only, tbody.show-for-small-up, tbody.hide-for-small, tbody.hide-for-small-down, tbody.show-for-medium-only, tbody.show-for-medium-up, tbody.show-for-medium, tbody.show-for-medium-down, tbody.hide-for-large-only, tbody.hide-for-large-up, tbody.hide-for-large, tbody.show-for-large-down, tbody.hide-for-xlarge-only, tbody.hide-for-xlarge-up, tbody.hide-for-xlarge, tbody.show-for-xlarge-down, tbody.hide-for-xxlarge-only, tbody.hide-for-xxlarge-up, tbody.hide-for-xxlarge, tbody.show-for-xxlarge-down {\n    display: table-row-group !important; }\n\n  tr.hide-for-small-only, tr.show-for-small-up, tr.hide-for-small, tr.hide-for-small-down, tr.show-for-medium-only, tr.show-for-medium-up, tr.show-for-medium, tr.show-for-medium-down, tr.hide-for-large-only, tr.hide-for-large-up, tr.hide-for-large, tr.show-for-large-down, tr.hide-for-xlarge-only, tr.hide-for-xlarge-up, tr.hide-for-xlarge, tr.show-for-xlarge-down, tr.hide-for-xxlarge-only, tr.hide-for-xxlarge-up, tr.hide-for-xxlarge, tr.show-for-xxlarge-down {\n    display: table-row !important; }\n\n  th.hide-for-small-only, td.hide-for-small-only, th.show-for-small-up, td.show-for-small-up, th.hide-for-small, td.hide-for-small, th.hide-for-small-down, td.hide-for-small-down, th.show-for-medium-only, td.show-for-medium-only, th.show-for-medium-up, td.show-for-medium-up, th.show-for-medium, td.show-for-medium, th.show-for-medium-down, td.show-for-medium-down, th.hide-for-large-only, td.hide-for-large-only, th.hide-for-large-up, td.hide-for-large-up, th.hide-for-large, td.hide-for-large, th.show-for-large-down, td.show-for-large-down, th.hide-for-xlarge-only, td.hide-for-xlarge-only, th.hide-for-xlarge-up, td.hide-for-xlarge-up, th.hide-for-xlarge, td.hide-for-xlarge, th.show-for-xlarge-down, td.show-for-xlarge-down, th.hide-for-xxlarge-only, td.hide-for-xxlarge-only, th.hide-for-xxlarge-up, td.hide-for-xxlarge-up, th.hide-for-xxlarge, td.hide-for-xxlarge, th.show-for-xxlarge-down, td.show-for-xxlarge-down {\n    display: table-cell !important; }\n }\n\n/* large displays */\n@media only screen and (min-width:64.063em) {\n  .hide-for-small-only, .show-for-small-up, .hide-for-small, .hide-for-small-down, .hide-for-medium-only, .show-for-medium-up, .hide-for-medium, .hide-for-medium-down, .show-for-large-only, .show-for-large-up, .show-for-large, .show-for-large-down, .hide-for-xlarge-only, .hide-for-xlarge-up, .hide-for-xlarge, .show-for-xlarge-down, .hide-for-xxlarge-only, .hide-for-xxlarge-up, .hide-for-xxlarge, .show-for-xxlarge-down {\n    display: inherit !important; }\n\n  .show-for-small-only, .hide-for-small-up, .show-for-small, .show-for-small-down, .show-for-medium-only, .hide-for-medium-up, .show-for-medium, .show-for-medium-down, .hide-for-large-only, .hide-for-large-up, .hide-for-large, .hide-for-large-down, .show-for-xlarge-only, .show-for-xlarge-up, .show-for-xlarge, .hide-for-xlarge-down, .show-for-xxlarge-only, .show-for-xxlarge-up, .show-for-xxlarge, .hide-for-xxlarge-down {\n    display: none !important; }\n\n  .hidden-for-small-only, .visible-for-small-up, .hidden-for-small, .hidden-for-small-down, .hidden-for-medium-only, .visible-for-medium-up, .hidden-for-medium, .hidden-for-medium-down, .visible-for-large-only, .visible-for-large-up, .visible-for-large, .visible-for-large-down, .hidden-for-xlarge-only, .hidden-for-xlarge-up, .hidden-for-xlarge, .visible-for-xlarge-down, .hidden-for-xxlarge-only, .hidden-for-xxlarge-up, .hidden-for-xxlarge, .visible-for-xxlarge-down {\n    position: static !important;\n    height: auto;\n    width: auto;\n    overflow: visible;\n    clip: auto; }\n\n  .visible-for-small-only, .hidden-for-small-up, .visible-for-small, .visible-for-small-down, .visible-for-medium-only, .hidden-for-medium-up, .visible-for-medium, .visible-for-medium-down, .hidden-for-large-only, .hidden-for-large-up, .hidden-for-large, .hidden-for-large-down, .visible-for-xlarge-only, .visible-for-xlarge-up, .visible-for-xlarge, .hidden-for-xlarge-down, .visible-for-xxlarge-only, .visible-for-xxlarge-up, .visible-for-xxlarge, .hidden-for-xxlarge-down {\n    position: absolute !important;\n    height: 1px;\n    width: 1px;\n    overflow: hidden;\n    clip: rect(1px, 1px, 1px, 1px); }\n\n  table.hide-for-small-only, table.show-for-small-up, table.hide-for-small, table.hide-for-small-down, table.hide-for-medium-only, table.show-for-medium-up, table.hide-for-medium, table.hide-for-medium-down, table.show-for-large-only, table.show-for-large-up, table.show-for-large, table.show-for-large-down, table.hide-for-xlarge-only, table.hide-for-xlarge-up, table.hide-for-xlarge, table.show-for-xlarge-down, table.hide-for-xxlarge-only, table.hide-for-xxlarge-up, table.hide-for-xxlarge, table.show-for-xxlarge-down {\n    display: table !important; }\n\n  thead.hide-for-small-only, thead.show-for-small-up, thead.hide-for-small, thead.hide-for-small-down, thead.hide-for-medium-only, thead.show-for-medium-up, thead.hide-for-medium, thead.hide-for-medium-down, thead.show-for-large-only, thead.show-for-large-up, thead.show-for-large, thead.show-for-large-down, thead.hide-for-xlarge-only, thead.hide-for-xlarge-up, thead.hide-for-xlarge, thead.show-for-xlarge-down, thead.hide-for-xxlarge-only, thead.hide-for-xxlarge-up, thead.hide-for-xxlarge, thead.show-for-xxlarge-down {\n    display: table-header-group !important; }\n\n  tbody.hide-for-small-only, tbody.show-for-small-up, tbody.hide-for-small, tbody.hide-for-small-down, tbody.hide-for-medium-only, tbody.show-for-medium-up, tbody.hide-for-medium, tbody.hide-for-medium-down, tbody.show-for-large-only, tbody.show-for-large-up, tbody.show-for-large, tbody.show-for-large-down, tbody.hide-for-xlarge-only, tbody.hide-for-xlarge-up, tbody.hide-for-xlarge, tbody.show-for-xlarge-down, tbody.hide-for-xxlarge-only, tbody.hide-for-xxlarge-up, tbody.hide-for-xxlarge, tbody.show-for-xxlarge-down {\n    display: table-row-group !important; }\n\n  tr.hide-for-small-only, tr.show-for-small-up, tr.hide-for-small, tr.hide-for-small-down, tr.hide-for-medium-only, tr.show-for-medium-up, tr.hide-for-medium, tr.hide-for-medium-down, tr.show-for-large-only, tr.show-for-large-up, tr.show-for-large, tr.show-for-large-down, tr.hide-for-xlarge-only, tr.hide-for-xlarge-up, tr.hide-for-xlarge, tr.show-for-xlarge-down, tr.hide-for-xxlarge-only, tr.hide-for-xxlarge-up, tr.hide-for-xxlarge, tr.show-for-xxlarge-down {\n    display: table-row !important; }\n\n  th.hide-for-small-only, td.hide-for-small-only, th.show-for-small-up, td.show-for-small-up, th.hide-for-small, td.hide-for-small, th.hide-for-small-down, td.hide-for-small-down, th.hide-for-medium-only, td.hide-for-medium-only, th.show-for-medium-up, td.show-for-medium-up, th.hide-for-medium, td.hide-for-medium, th.hide-for-medium-down, td.hide-for-medium-down, th.show-for-large-only, td.show-for-large-only, th.show-for-large-up, td.show-for-large-up, th.show-for-large, td.show-for-large, th.show-for-large-down, td.show-for-large-down, th.hide-for-xlarge-only, td.hide-for-xlarge-only, th.hide-for-xlarge-up, td.hide-for-xlarge-up, th.hide-for-xlarge, td.hide-for-xlarge, th.show-for-xlarge-down, td.show-for-xlarge-down, th.hide-for-xxlarge-only, td.hide-for-xxlarge-only, th.hide-for-xxlarge-up, td.hide-for-xxlarge-up, th.hide-for-xxlarge, td.hide-for-xxlarge, th.show-for-xxlarge-down, td.show-for-xxlarge-down {\n    display: table-cell !important; }\n }\n\n/* xlarge displays */\n@media only screen and (min-width:90.063em) {\n  .hide-for-small-only, .show-for-small-up, .hide-for-small, .hide-for-small-down, .hide-for-medium-only, .show-for-medium-up, .hide-for-medium, .hide-for-medium-down, .hide-for-large-only, .show-for-large-up, .hide-for-large, .hide-for-large-down, .show-for-xlarge-only, .show-for-xlarge-up, .show-for-xlarge, .show-for-xlarge-down, .hide-for-xxlarge-only, .hide-for-xxlarge-up, .hide-for-xxlarge, .show-for-xxlarge-down {\n    display: inherit !important; }\n\n  .show-for-small-only, .hide-for-small-up, .show-for-small, .show-for-small-down, .show-for-medium-only, .hide-for-medium-up, .show-for-medium, .show-for-medium-down, .show-for-large-only, .hide-for-large-up, .show-for-large, .show-for-large-down, .hide-for-xlarge-only, .hide-for-xlarge-up, .hide-for-xlarge, .hide-for-xlarge-down, .show-for-xxlarge-only, .show-for-xxlarge-up, .show-for-xxlarge, .hide-for-xxlarge-down {\n    display: none !important; }\n\n  .hidden-for-small-only, .visible-for-small-up, .hidden-for-small, .hidden-for-small-down, .hidden-for-medium-only, .visible-for-medium-up, .hidden-for-medium, .hidden-for-medium-down, .hidden-for-large-only, .visible-for-large-up, .hidden-for-large, .hidden-for-large-down, .visible-for-xlarge-only, .visible-for-xlarge-up, .visible-for-xlarge, .visible-for-xlarge-down, .hidden-for-xxlarge-only, .hidden-for-xxlarge-up, .hidden-for-xxlarge, .visible-for-xxlarge-down {\n    position: static !important;\n    height: auto;\n    width: auto;\n    overflow: visible;\n    clip: auto; }\n\n  .visible-for-small-only, .hidden-for-small-up, .visible-for-small, .visible-for-small-down, .visible-for-medium-only, .hidden-for-medium-up, .visible-for-medium, .visible-for-medium-down, .visible-for-large-only, .hidden-for-large-up, .visible-for-large, .visible-for-large-down, .hidden-for-xlarge-only, .hidden-for-xlarge-up, .hidden-for-xlarge, .hidden-for-xlarge-down, .visible-for-xxlarge-only, .visible-for-xxlarge-up, .visible-for-xxlarge, .hidden-for-xxlarge-down {\n    position: absolute !important;\n    height: 1px;\n    width: 1px;\n    overflow: hidden;\n    clip: rect(1px, 1px, 1px, 1px); }\n\n  table.hide-for-small-only, table.show-for-small-up, table.hide-for-small, table.hide-for-small-down, table.hide-for-medium-only, table.show-for-medium-up, table.hide-for-medium, table.hide-for-medium-down, table.hide-for-large-only, table.show-for-large-up, table.hide-for-large, table.hide-for-large-down, table.show-for-xlarge-only, table.show-for-xlarge-up, table.show-for-xlarge, table.show-for-xlarge-down, table.hide-for-xxlarge-only, table.hide-for-xxlarge-up, table.hide-for-xxlarge, table.show-for-xxlarge-down {\n    display: table !important; }\n\n  thead.hide-for-small-only, thead.show-for-small-up, thead.hide-for-small, thead.hide-for-small-down, thead.hide-for-medium-only, thead.show-for-medium-up, thead.hide-for-medium, thead.hide-for-medium-down, thead.hide-for-large-only, thead.show-for-large-up, thead.hide-for-large, thead.hide-for-large-down, thead.show-for-xlarge-only, thead.show-for-xlarge-up, thead.show-for-xlarge, thead.show-for-xlarge-down, thead.hide-for-xxlarge-only, thead.hide-for-xxlarge-up, thead.hide-for-xxlarge, thead.show-for-xxlarge-down {\n    display: table-header-group !important; }\n\n  tbody.hide-for-small-only, tbody.show-for-small-up, tbody.hide-for-small, tbody.hide-for-small-down, tbody.hide-for-medium-only, tbody.show-for-medium-up, tbody.hide-for-medium, tbody.hide-for-medium-down, tbody.hide-for-large-only, tbody.show-for-large-up, tbody.hide-for-large, tbody.hide-for-large-down, tbody.show-for-xlarge-only, tbody.show-for-xlarge-up, tbody.show-for-xlarge, tbody.show-for-xlarge-down, tbody.hide-for-xxlarge-only, tbody.hide-for-xxlarge-up, tbody.hide-for-xxlarge, tbody.show-for-xxlarge-down {\n    display: table-row-group !important; }\n\n  tr.hide-for-small-only, tr.show-for-small-up, tr.hide-for-small, tr.hide-for-small-down, tr.hide-for-medium-only, tr.show-for-medium-up, tr.hide-for-medium, tr.hide-for-medium-down, tr.hide-for-large-only, tr.show-for-large-up, tr.hide-for-large, tr.hide-for-large-down, tr.show-for-xlarge-only, tr.show-for-xlarge-up, tr.show-for-xlarge, tr.show-for-xlarge-down, tr.hide-for-xxlarge-only, tr.hide-for-xxlarge-up, tr.hide-for-xxlarge, tr.show-for-xxlarge-down {\n    display: table-row !important; }\n\n  th.hide-for-small-only, td.hide-for-small-only, th.show-for-small-up, td.show-for-small-up, th.hide-for-small, td.hide-for-small, th.hide-for-small-down, td.hide-for-small-down, th.hide-for-medium-only, td.hide-for-medium-only, th.show-for-medium-up, td.show-for-medium-up, th.hide-for-medium, td.hide-for-medium, th.hide-for-medium-down, td.hide-for-medium-down, th.hide-for-large-only, td.hide-for-large-only, th.show-for-large-up, td.show-for-large-up, th.hide-for-large, td.hide-for-large, th.hide-for-large-down, td.hide-for-large-down, th.show-for-xlarge-only, td.show-for-xlarge-only, th.show-for-xlarge-up, td.show-for-xlarge-up, th.show-for-xlarge, td.show-for-xlarge, th.show-for-xlarge-down, td.show-for-xlarge-down, th.hide-for-xxlarge-only, td.hide-for-xxlarge-only, th.hide-for-xxlarge-up, td.hide-for-xxlarge-up, th.hide-for-xxlarge, td.hide-for-xxlarge, th.show-for-xxlarge-down, td.show-for-xxlarge-down {\n    display: table-cell !important; }\n }\n\n/* xxlarge displays */\n@media only screen and (min-width:120.063em) {\n  .hide-for-small-only, .show-for-small-up, .hide-for-small, .hide-for-small-down, .hide-for-medium-only, .show-for-medium-up, .hide-for-medium, .hide-for-medium-down, .hide-for-large-only, .show-for-large-up, .hide-for-large, .hide-for-large-down, .hide-for-xlarge-only, .show-for-xlarge-up, .hide-for-xlarge, .hide-for-xlarge-down, .show-for-xxlarge-only, .show-for-xxlarge-up, .show-for-xxlarge, .show-for-xxlarge-down {\n    display: inherit !important; }\n\n  .show-for-small-only, .hide-for-small-up, .show-for-small, .show-for-small-down, .show-for-medium-only, .hide-for-medium-up, .show-for-medium, .show-for-medium-down, .show-for-large-only, .hide-for-large-up, .show-for-large, .show-for-large-down, .show-for-xlarge-only, .hide-for-xlarge-up, .show-for-xlarge, .show-for-xlarge-down, .hide-for-xxlarge-only, .hide-for-xxlarge-up, .hide-for-xxlarge, .hide-for-xxlarge-down {\n    display: none !important; }\n\n  .hidden-for-small-only, .visible-for-small-up, .hidden-for-small, .hidden-for-small-down, .hidden-for-medium-only, .visible-for-medium-up, .hidden-for-medium, .hidden-for-medium-down, .hidden-for-large-only, .visible-for-large-up, .hidden-for-large, .hidden-for-large-down, .hidden-for-xlarge-only, .visible-for-xlarge-up, .hidden-for-xlarge, .hidden-for-xlarge-down, .visible-for-xxlarge-only, .visible-for-xxlarge-up, .visible-for-xxlarge, .visible-for-xxlarge-down {\n    position: static !important;\n    height: auto;\n    width: auto;\n    overflow: visible;\n    clip: auto; }\n\n  .visible-for-small-only, .hidden-for-small-up, .visible-for-small, .visible-for-small-down, .visible-for-medium-only, .hidden-for-medium-up, .visible-for-medium, .visible-for-medium-down, .visible-for-large-only, .hidden-for-large-up, .visible-for-large, .visible-for-large-down, .visible-for-xlarge-only, .hidden-for-xlarge-up, .visible-for-xlarge, .visible-for-xlarge-down, .hidden-for-xxlarge-only, .hidden-for-xxlarge-up, .hidden-for-xxlarge, .hidden-for-xxlarge-down {\n    position: absolute !important;\n    height: 1px;\n    width: 1px;\n    overflow: hidden;\n    clip: rect(1px, 1px, 1px, 1px); }\n\n  table.hide-for-small-only, table.show-for-small-up, table.hide-for-small, table.hide-for-small-down, table.hide-for-medium-only, table.show-for-medium-up, table.hide-for-medium, table.hide-for-medium-down, table.hide-for-large-only, table.show-for-large-up, table.hide-for-large, table.hide-for-large-down, table.hide-for-xlarge-only, table.show-for-xlarge-up, table.hide-for-xlarge, table.hide-for-xlarge-down, table.show-for-xxlarge-only, table.show-for-xxlarge-up, table.show-for-xxlarge, table.show-for-xxlarge-down {\n    display: table !important; }\n\n  thead.hide-for-small-only, thead.show-for-small-up, thead.hide-for-small, thead.hide-for-small-down, thead.hide-for-medium-only, thead.show-for-medium-up, thead.hide-for-medium, thead.hide-for-medium-down, thead.hide-for-large-only, thead.show-for-large-up, thead.hide-for-large, thead.hide-for-large-down, thead.hide-for-xlarge-only, thead.show-for-xlarge-up, thead.hide-for-xlarge, thead.hide-for-xlarge-down, thead.show-for-xxlarge-only, thead.show-for-xxlarge-up, thead.show-for-xxlarge, thead.show-for-xxlarge-down {\n    display: table-header-group !important; }\n\n  tbody.hide-for-small-only, tbody.show-for-small-up, tbody.hide-for-small, tbody.hide-for-small-down, tbody.hide-for-medium-only, tbody.show-for-medium-up, tbody.hide-for-medium, tbody.hide-for-medium-down, tbody.hide-for-large-only, tbody.show-for-large-up, tbody.hide-for-large, tbody.hide-for-large-down, tbody.hide-for-xlarge-only, tbody.show-for-xlarge-up, tbody.hide-for-xlarge, tbody.hide-for-xlarge-down, tbody.show-for-xxlarge-only, tbody.show-for-xxlarge-up, tbody.show-for-xxlarge, tbody.show-for-xxlarge-down {\n    display: table-row-group !important; }\n\n  tr.hide-for-small-only, tr.show-for-small-up, tr.hide-for-small, tr.hide-for-small-down, tr.hide-for-medium-only, tr.show-for-medium-up, tr.hide-for-medium, tr.hide-for-medium-down, tr.hide-for-large-only, tr.show-for-large-up, tr.hide-for-large, tr.hide-for-large-down, tr.hide-for-xlarge-only, tr.show-for-xlarge-up, tr.hide-for-xlarge, tr.hide-for-xlarge-down, tr.show-for-xxlarge-only, tr.show-for-xxlarge-up, tr.show-for-xxlarge, tr.show-for-xxlarge-down {\n    display: table-row !important; }\n\n  th.hide-for-small-only, td.hide-for-small-only, th.show-for-small-up, td.show-for-small-up, th.hide-for-small, td.hide-for-small, th.hide-for-small-down, td.hide-for-small-down, th.hide-for-medium-only, td.hide-for-medium-only, th.show-for-medium-up, td.show-for-medium-up, th.hide-for-medium, td.hide-for-medium, th.hide-for-medium-down, td.hide-for-medium-down, th.hide-for-large-only, td.hide-for-large-only, th.show-for-large-up, td.show-for-large-up, th.hide-for-large, td.hide-for-large, th.hide-for-large-down, td.hide-for-large-down, th.hide-for-xlarge-only, td.hide-for-xlarge-only, th.show-for-xlarge-up, td.show-for-xlarge-up, th.hide-for-xlarge, td.hide-for-xlarge, th.hide-for-xlarge-down, td.hide-for-xlarge-down, th.show-for-xxlarge-only, td.show-for-xxlarge-only, th.show-for-xxlarge-up, td.show-for-xxlarge-up, th.show-for-xxlarge, td.show-for-xxlarge, th.show-for-xxlarge-down, td.show-for-xxlarge-down {\n    display: table-cell !important; }\n }\n\n/* Orientation targeting */\n.show-for-landscape, .hide-for-portrait {\n  display: inherit !important; }\n\n.hide-for-landscape, .show-for-portrait {\n  display: none !important; }\n\n/* Specific visibility for tables */\ntable.hide-for-landscape, table.show-for-portrait {\n  display: table !important; }\n\nthead.hide-for-landscape, thead.show-for-portrait {\n  display: table-header-group !important; }\n\ntbody.hide-for-landscape, tbody.show-for-portrait {\n  display: table-row-group !important; }\n\ntr.hide-for-landscape, tr.show-for-portrait {\n  display: table-row !important; }\n\ntd.hide-for-landscape, td.show-for-portrait, th.hide-for-landscape, th.show-for-portrait {\n  display: table-cell !important; }\n\n@media only screen and (orientation: landscape) {\n  .show-for-landscape, .hide-for-portrait {\n    display: inherit !important; }\n\n  .hide-for-landscape, .show-for-portrait {\n    display: none !important; }\n\n  /* Specific visibility for tables */\n  table.show-for-landscape, table.hide-for-portrait {\n    display: table !important; }\n\n  thead.show-for-landscape, thead.hide-for-portrait {\n    display: table-header-group !important; }\n\n  tbody.show-for-landscape, tbody.hide-for-portrait {\n    display: table-row-group !important; }\n\n  tr.show-for-landscape, tr.hide-for-portrait {\n    display: table-row !important; }\n\n  td.show-for-landscape, td.hide-for-portrait, th.show-for-landscape, th.hide-for-portrait {\n    display: table-cell !important; }\n }\n\n@media only screen and (orientation: portrait) {\n  .show-for-portrait, .hide-for-landscape {\n    display: inherit !important; }\n\n  .hide-for-portrait, .show-for-landscape {\n    display: none !important; }\n\n  /* Specific visibility for tables */\n  table.show-for-portrait, table.hide-for-landscape {\n    display: table !important; }\n\n  thead.show-for-portrait, thead.hide-for-landscape {\n    display: table-header-group !important; }\n\n  tbody.show-for-portrait, tbody.hide-for-landscape {\n    display: table-row-group !important; }\n\n  tr.show-for-portrait, tr.hide-for-landscape {\n    display: table-row !important; }\n\n  td.show-for-portrait, td.hide-for-landscape, th.show-for-portrait, th.hide-for-landscape {\n    display: table-cell !important; }\n }\n\n/* Touch-enabled device targeting */\n.show-for-touch {\n  display: none !important; }\n\n.hide-for-touch {\n  display: inherit !important; }\n\n.touch .show-for-touch {\n  display: inherit !important; }\n\n.touch .hide-for-touch {\n  display: none !important; }\n\n/* Specific visibility for tables */\ntable.hide-for-touch {\n  display: table !important; }\n\n.touch table.show-for-touch {\n  display: table !important; }\n\nthead.hide-for-touch {\n  display: table-header-group !important; }\n\n.touch thead.show-for-touch {\n  display: table-header-group !important; }\n\ntbody.hide-for-touch {\n  display: table-row-group !important; }\n\n.touch tbody.show-for-touch {\n  display: table-row-group !important; }\n\ntr.hide-for-touch {\n  display: table-row !important; }\n\n.touch tr.show-for-touch {\n  display: table-row !important; }\n\ntd.hide-for-touch {\n  display: table-cell !important; }\n\n.touch td.show-for-touch {\n  display: table-cell !important; }\n\nth.hide-for-touch {\n  display: table-cell !important; }\n\n.touch th.show-for-touch {\n  display: table-cell !important; }\n\n/* Print visibility */\n@media print {\n  .show-for-print {\n    display: block; }\n\n  .hide-for-print {\n    display: none; }\n\n  table.show-for-print {\n    display: table !important; }\n\n  thead.show-for-print {\n    display: table-header-group !important; }\n\n  tbody.show-for-print {\n    display: table-row-group !important; }\n\n  tr.show-for-print {\n    display: table-row !important; }\n\n  td.show-for-print {\n    display: table-cell !important; }\n\n  th.show-for-print {\n    display: table-cell !important; }\n }\n\n/* all app scss styles here */\n.footer p, #subFooter > p {\n  color: #d6d6d6; }\n\n.footer h5, #subFooter > h5 {\n  color: #fff; }\n\n#headerLogo {\n  height: 250px;\n  margin: 15px; }\n\naudio {\n  display: block; }\n', '', 1422893972, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n');
INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`) VALUES
(4, 1, 2, 'wrapper', 'y', 'webpage', '<!doctype html>\r\n<html class="no-js" lang="en" ng-app="category">\r\n  <head>\r\n    <meta charset="utf-8">\r\n    <meta name="viewport" content="width=device-width, initial-scale=1.0">\r\n    <title>Chesapeake Bay Program - Field Guide</title>\r\n    <!-- build:css css/libraries.min.css -->\r\n    <link rel="stylesheet" href="/vendor/font-awesome/css/font-awesome.css">\r\n	<link rel="stylesheet" href="/vendor/fonts/foundation-icons/foundation-icons.css" />\r\n    <!-- bower:css -->\r\n    <link rel="stylesheet" href="/vendor/slick.js/slick/slick.css" />\r\n    <!-- endbower -->\r\n    <!-- endbuild -->\r\n    <!-- build:css css/app.min.css -->\r\n    <link rel="stylesheet" href="{stylesheet=''site/style''}">\r\n    <!-- endbuild -->\r\n    <!-- build:js js/vendor/modernizr.min.js -->\r\n    <script src="/vendor/modernizr/modernizr.js"></script>\r\n    <!-- endbuild -->\r\n  </head>\r\n  <body>\r\n			<script src="/app/bower_components/angular/angular.js"></script>\r\n		<script src="/js/angularApp.js"></script>\r\n<header>\r\n      <div class="row">\r\n        <a href="/"><img id="headerLogo" class="small-12 columns" src="/images/field-guide-logo.svg" /></a>\r\n      </div>\r\n      <div class="row">\r\n        <div class="small-12 columns">\r\n          <nav class="top-bar" data-topbar role="navigation">\r\n            <ul class="title-area">\r\n              <li class="has-form small-10 medium-6 hide-for-medium-up columns" style="padding-top: 10px;">\r\n                <div class="row">\r\n                  <div class="small-10 columns">\r\n                    <input type="text" placeholder="search chesapeakebay.net">\r\n                  </div>\r\n                  <div class="small-2 columns">\r\n                    <a href="#" class="" style="color: black; font-size: 24px; line-height: 24px;">\r\n                      <i class="fi-magnifying-glass"></i>\r\n                    </a>\r\n                  </div>\r\n                </div>\r\n              </li>\r\n              <li class="name">\r\n                <h1><a href="#"></a></h1>\r\n              </li> <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone --> \r\n              <li class="toggle-topbar menu-icon">\r\n                <a href="#"><span></span></a>\r\n              </li>\r\n            </ul>\r\n            <section class="top-bar-section"> \r\n            <!-- Right Nav Section -->\r\n              <ul class="right hide-for-medium-up">\r\n								{top_nav}\r\n              </ul>\r\n							\r\n            </section>\r\n          </nav>\r\n      </div>\r\n    </header>\r\n		\r\n		{layout:contents}\r\n		\r\n		\r\n      <div class="panel footer" style="margin-bottom: 0px; border: none; background: #333;">\r\n			<div class="row" >\r\n        <h5>About the Chesapeake Bay Program</h5>\r\n        <p>The Chesapeake Bay Program is a unique regional partnership that has led and directed the restoration of the Chesapeake Bay since 1983.</p>\r\n			</div>\r\n			<div class="row">\r\n        <p>410 Severn Avenue, Suite 112<br />\r\n        Annapolis, MD 21403<br />\r\n        Tel: (800) YOUR-BAY<br />\r\n        Fax: (410) 267-5777</p>\r\n		  </div>\r\n			<div class="row collapse">\r\n        <h5>Keep in Touch</h5>\r\n        <p>Get the latest updates on our work delivered to your inbox.</p>\r\n        <form class="small-12 medium-8 large-4 columns">\r\n          <div class="row collapse"> \r\n            <div class="small-9 columns"> \r\n              <input type="text" placeholder="email">\r\n            </div> \r\n            <div class="small-3 columns">\r\n              <a href="#" class="button postfix">Subscribe</a>\r\n            </div>\r\n          </div> \r\n        </form>\r\n			</div>\r\n			<div class="row collapse">\r\n        <a href="" class="small-3 columns left">View all newsletters</a>\r\n			</div>\r\n			<div class="row collapse">\r\n				<div class="small-12 columns">\r\n					<h5>Find Us On</h5>\r\n					<ul class="inline-list">\r\n						<li style="font-size: 3rem;"><a href="#"><i class="fi-social-facebook" ></i></a></li>\r\n						<li style="font-size: 3rem;"><a href="#"><i class="fi-social-twitter" ></i></a></li>\r\n						<li style="font-size: 3rem;"><a href="#"><i class="fi-social-flickr" ></i></a></li>\r\n						<li style="font-size: 3rem;"><a href="#"><i class="fi-social-tumblr" ></i></a></li>\r\n						<li style="font-size: 3rem;"><a href="#"><i class="fi-social-vimeo" ></i></a></li>\r\n					</ul>\r\n				</div>\r\n      </div>\r\n			<div class="row">\r\n        <h5>Navigation</h5>\r\n        <ul style="list-style: none; margin-left: 0px;">\r\n          <li><a href="#">Discover the Chesapeake</a></li>\r\n          <li><a href="#">Learn the Issues</a></li>\r\n          <li><a href="#">Track the Progress</a></li>\r\n          <li><a href="#">Take Action</a></li>\r\n          <li><a href="#">In the News</a></li>\r\n          <li><a href="#">Bay Resource Library</a></li>\r\n          <li><a href="#">About the Bay Program</a></li>\r\n        </ul>\r\n      </div>\r\n    </div>\r\n    <div class="panel" id="subFooter" style="border: none; background: #000; margin-bottom: 0px;">\r\n			<p>Copyright 2014 Chesapeake Bay Program. All rights reserved.</p>\r\n			<a href="#">Terms of Use</a> | <a href="#">Privacy Policy</a>\r\n		</div>\r\n\r\n    <!-- build:js js/vendor/libraries.min.js -->\r\n    <!-- bower:js -->\r\n    <script src="/vendor/jquery/dist/jquery.js"></script>\r\n    <script src="/vendor/fastclick/lib/fastclick.js"></script>\r\n    <script src="/vendor/jquery.cookie/jquery.cookie.js"></script>\r\n    <!-- endbower -->\r\n    <!-- endbuild -->\r\n	\r\n    <script type="text/javascript" src="/vendor/slick.js/slick/slick.min.js"></script>\r\n    <script type="text/javascript">\r\n      $(document).ready(function(){\r\n        $(''.slider'').slick({\r\n          dots: true\r\n        });\r\n      });\r\n    </script>\r\n\r\n    <!-- build:js js/vendor/foundation.min.js -->\r\n    <script src="/vendor/foundation/js/foundation/foundation.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.abide.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.accordion.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.alert.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.clearing.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.dropdown.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.equalizer.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.interchange.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.joyride.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.magellan.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.offcanvas.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.orbit.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.reveal.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.slider.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.tab.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.tooltip.js"></script>\r\n    <script src="/vendor/foundation/js/foundation/foundation.topbar.js"></script>\r\n    <!-- endbuild -->\r\n    <!-- build:js js/app.min.js -->\r\n    <script src="{path=''site/app''}"></script>\r\n    <!-- endbuild -->\r\n  </body>\r\n</html>', '', 1422893972, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(5, 1, 2, 'app', 'y', 'js', '''use strict'';\n\nvar app = (function(document, $) {\n	var docElem = document.documentElement,\n		_userAgentInit = function() {\n			docElem.setAttribute(''data-useragent'', navigator.userAgent);\n		},\n		_init = function() {\n			$(document).foundation();\n            // needed to use joyride\n            // doc: http://foundation.zurb.com/docs/components/joyride.html\n            $(document).on(''click'', ''#start-jr'', function () {\n                $(document).foundation(''joyride'', ''start'');\n            });\n			_userAgentInit();\n		};\n	return {\n		init: _init\n	};\n})(document, jQuery);\n\n(function() {\n	app.init();\n})();\n', '', 1420744058, 1, 'n', 0, '', 'n', 'n', 'o', 1838, 'n'),
(9, 1, 3, 'index', 'y', 'webpage', '{layout=''site/wrapper''}\r\n{exp:channel:entries channel="field_guide_entries"}\r\n<div class="row">\r\n	<ul class="breadcrumbs">\r\n	 <li><a href="/">Home</a></li>\r\n	 {type}\r\n	 {type:parent_type}\r\n	 <li><a href="{site_url}category/{type:parent_type:url_title}">{type:parent_type:title}</a></li>\r\n	 {/type:parent_type}\r\n	 {/type}\r\n	 <li class="current"><a href="{site_url}entry/{url_title}">{title}</a></li>\r\n	</ul>\r\n\r\n</div> <!-- end row -->\r\n\r\n<div class="row">\r\n\r\n	<div class="small-12 medium-8 columns">\r\n	<h1>{title}</br><i>{scientific_name}</i></h1>\r\n		<div class="row">\r\n		{media}\r\n			<div class="small-12 columns">\r\n				<a href="#"><img data-interchange="[{media:image}, (default)]"></a>\r\n			</div> <!-- end columns -->\r\n		{/media}\r\n		</div> <!-- end row -->\r\n\r\n		<div class="row">\r\n			<div class="small-12 columns hide-for-medium-up">\r\n			\r\n				<div class="sort">\r\n				{quick_facts}\r\n					<h2>Quick Facts</h2>\r\n					<h3>{quick_facts:native_or_invasive}</h3>\r\n\r\n					<h3>Size</h3>\r\n					{quick_facts:size}\r\n\r\n					<h3>Habitat</h3>\r\n					{quick_facts:habitat}\r\n\r\n					<h3>Range</h3>\r\n					{quick_facts:range}\r\n\r\n					<h3>Diet</h3>\r\n					{quick_facts:diet}\r\n\r\n					<h3>Lifespan</h3>\r\n					{quick_facts:lifespan}\r\n\r\n					<h3>Status</h3>\r\n					{quick_facts:status}\r\n					<p>Stable</p>\r\n				{/quick_facts}\r\n				</div>\r\n			</div> <!-- end columns -->\r\n		</div> <!-- end row -->\r\n\r\n		<div class="row">\r\n			<div class="small-12 columns">\r\n			<p class="lead">{short_description}</p>\r\n			</div> <!-- end columns -->\r\n		</div> <!-- end row -->\r\n\r\n		<div class="row">\r\n			<div class="small-12 columns">\r\n				<h2>Appearance</h2>\r\n				{appearance}\r\n\r\n				<h2>Feeding</h2>\r\n				<p>Forage on the ground by scratching with feet to uncover food; feed two to three hours after dawn and before dusk.</p>\r\n\r\n				<h2>Predators</h2>\r\n				<p>Humans are the largest predator of wild turkeys. Bobcats, raccoons, eagles and owls also prey upon adult turkeys. Many types of birds, snakes and mammals feed on turkey eggs.</p>\r\n\r\n				<h2>Flight</h2>\r\n				<p>Turkeys can fly very swiftly; some have been recorded flying at speeds up to 55 miles per hour.</p>\r\n\r\n				<h2>Voice</h2>\r\n				<p>Males make a loud gobbling sound during courtship. Known to make at least 15 different types of calls, including yelps and clucks.</p>\r\n				 <audio controls>\r\n					<source src="/audio/wild-turkey-cluck.mp3" type="audio/mpeg">\r\n					Your browser does not support the audio element. Please consider <a href="http://browsehappy.com/">upgrading</a> your browser. \r\n				</audio> \r\n				<small>Audio courtesy of South Carolina Department of Natural Resources</small>\r\n\r\n				<h2>Reproduction and Life Cycle</h2>\r\n				<p>Turkeys mate in early spring. Males perform an elaborate courtship ritual to attract females. The ritual includes gobbling loudly, fanning out their tail, strutting around the females, and dragging their wing tips on the ground. Males can change the color of their head during breeding season to attract a mate and show dominance over other males. Wild turkeys often locate their nest at the base of a tree that offers overhanging cover. Females begin laying one egg per day in mid-April. They lay a total of approximately 12 eggs, which they incubate for about four weeks. Eggs usually hatch around the first week of June. Males do not help care for the young. Young chicks follow their mother out of the nest within one day of hatching. They quickly learn to feed themselves, and can fly by the time they are eight days old. Young males stay with the female through autumn, and young females stay until the following spring.</p>\r\n\r\n				<h2>Did you know?</h2>\r\n				{did_you_know}\r\n\r\n				<h2>Sources and Additional Information</h2>\r\n				{sources_and_additional_informati}\r\n\r\n			</div> <!-- end columns -->\r\n		</div> <!-- end row -->\r\n\r\n	</div> <!-- end left columns -->\r\n\r\n	<div class="hide-for-small-only medium-4 columns">\r\n    <div id="search" class="row">\r\n      <div class="medium-10 columns">\r\n        <input type="text" placeholder="search chesapeakebay.net">\r\n      </div>\r\n      <div class="medium-2 columns">\r\n        <a href="#" class="" style="color: black; font-size: 24px;">\r\n          <i class="fi-magnifying-glass"></i>\r\n        </a>\r\n      </div>\r\n    </div>\r\n		<div class="panel">\r\n    {quick_facts}\r\n      <h2>Quick Facts</h2>\r\n      <h3>{quick_facts:native_or_invasive}</h3>\r\n\r\n      <h3>Size</h3>\r\n      {quick_facts:size}\r\n\r\n      <h3>Habitat</h3>\r\n      {quick_facts:habitat}\r\n\r\n      <h3>Range</h3>\r\n      {quick_facts:range}\r\n\r\n      <h3>Diet</h3>\r\n      {quick_facts:diet}\r\n\r\n      <h3>Lifespan</h3>\r\n      {quick_facts:lifespan}\r\n\r\n      <h3>Status</h3>\r\n      {quick_facts:status}\r\n      \r\n      <h3>Stable</h3>\r\n      {quick_facts:stable}\r\n    {/quick_facts}\r\n    </div>\r\n	</div> <!-- end right columns -->\r\n\r\n</div> <!-- end row -->\r\n{/exp:channel:entries}', '', 1422893972, 1, 'n', 0, '', 'n', 'n', 'o', 130, 'n'),
(19, 1, 7, 'index', 'y', 'webpage', '{layout="site/wrapper"}\r\n<div class="row">\r\n{exp:channel:entries channel="field_guide_types"}\r\n	<ul class="breadcrumbs">\r\n	 <li><a href="/">Home</a></li>\r\n	 <li class="current"><a href="{site_url}category/{url_title}">{title}</a></li>\r\n	</ul>\r\n	<div class="small-12 columns">\r\n		<h1>{title}</h1>\r\n	</div> <!-- end columns -->\r\n</div> <!-- end row -->\r\n<div class="row">\r\n	<div class="small-12 medium-8 columns">\r\n		<div class="row">\r\n			<div class="small-12 columns">\r\n			{type_description}\r\n			</div> <!-- end columns -->\r\n		</div> <!-- end row -->\r\n		<div class="row accent-gray">\r\n			<div class="small-12 columns">\r\n				<form>\r\n					<div class="row">\r\n						<div class="small-12 columns">\r\n							<label><h3><strong>Browse by type:</strong></h3>\r\n								<select>\r\n									<option value="all" selected>All</option>\r\n									{exp:channel:entries channel="field_guide_types"}\r\n										{subtypes}\r\n											<option value="{subtypes:title}">{subtypes:title}</option>\r\n										{/subtypes}\r\n									{/exp:channel:entries}\r\n								</select>\r\n							</label>\r\n						</div>\r\n					</div>\r\n				</form>\r\n				<ul class="small-block-grid-1 medium-block-grid-2">\r\n				{exp:channel:entries channel="field_guide_types"}\r\n					{subtypes}\r\n						<li class="accent-white">\r\n						{subtypes:parents field="type"}\r\n							<img src="{subtypes:parents:media}{subtypes:media:image}{/subtypes:parents:media}" height="500" width="750">\r\n							<h3><a href="{site_url}entry/{parents:url_title}">{subtypes:parents:title} </br><i>{subtypes:parents:scientific_name}</i></a></h3>\r\n						{/subtypes:parents}\r\n						</li>\r\n					{/subtypes}\r\n				{/exp:channel:entries}\r\n				</ul>\r\n			</div> <!-- end columns -->\r\n		</div> <!-- end row -->\r\n	</div> <!-- end left columns -->\r\n	<div class="small-12 medium-4 columns hide-for-small-down">\r\n		{sort_menu}\r\n	</div> <!-- end right columns -->\r\n</div> <!-- end row -->', '', 1422893972, 1, 'n', 0, '', 'n', 'n', 'o', 1, 'n'),
(13, 1, 5, 'type', 'y', 'js', '[\n{exp:channel:entries channel="field_guide_types" backspace="2" url_title="{segment_3}"}{if subtypes:count > 0}{subtypes}{subtypes:parents field="type"}\n  {\n  "title": "{subtypes:parents:title}",\n  "url": "{subtypes:parents:url_title}",\n  "scientific_name": "{subtypes:parents:scientific_name}"\n  },\n{/subtypes:parents}{/subtypes}{/if}{/exp:channel:entries}\n]', '', 1422894601, 1, 'n', 0, '', 'n', 'n', 'o', 365, 'n'),
(12, 1, 5, 'index', 'n', 'webpage', '', NULL, 1421336226, 0, 'n', 0, '', 'n', 'n', 'o', 13, 'n'),
(14, 1, 5, 'subtype', 'y', 'js', '{exp:json:entries channel="field_guide_subtype"}', '', 1422893972, 1, 'n', 0, '', 'n', 'n', 'o', 251, 'n'),
(15, 1, 5, 'entry', 'y', 'js', '{exp:channel:entries channel="field_guide_entries" backspace="2" dynamic="no"}\n  {\n  "title": "{title}",\n  "url": "{url_title}",\n  "image": "{media}{media:image}{/media}",\n  "scientific_name": "{scientific_name}"\n  },\n{/exp:channel:entries}', '', 1422894286, 1, 'n', 0, '', 'n', 'n', 'o', 258, 'n'),
(16, 1, 5, 'habitat', 'y', 'js', '{exp:json:entries channel="field_guide_habitats"}', '', 1422893972, 1, 'n', 0, '', 'n', 'n', 'o', 1, 'n'),
(17, 1, 6, 'index', 'n', 'webpage', '', NULL, 1421861120, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(18, 1, 6, 'results', 'y', 'webpage', '{layout="site/wrapper"}\r\n<table border="0" cellpadding="6" cellspacing="1" width="100%">\r\n    <tr>\r\n        <th>{lang:title}</th>\r\n        <th>{lang:excerpt}</th>\r\n        <th>{lang:author}</th>\r\n        <th>{lang:date}</th>\r\n        <th>{lang:total_comments}</th>\r\n        <th>{lang:recent_comments}</th>\r\n    </tr>\r\n\r\n{exp:search:search_results switch="resultRowOne|resultRowTwo"}\r\n\r\n    <tr class="{switch}">\r\n        <td width="30%" valign="top"><b><a href="{auto_path}">{title}</a></b></td>\r\n        <td width="30%" valign="top">{excerpt}</td>\r\n        <td width="10%" valign="top"><a href="{member_path=''member/index''}">{author}</a></td>\r\n        <td width="10%" valign="top">{entry_date format="%m/%d/%y"}</td>\r\n        <td width="10%" valign="top">{comment_total}</td>\r\n        <td width="10%" valign="top">{recent_comment_date format="%m/%d/%y"}</td>\r\n    </tr>\r\n\r\n    {if count == total_results}\r\n        </table>\r\n    {/if}\r\n\r\n    {paginate}\r\n        <p>Page {current_page} of {total_pages} pages {pagination_links}</p>\r\n    {/paginate}\r\n\r\n{/exp:search:search_results}\r\n\r\n</table>', '', 1422893972, 1, 'n', 0, '', 'n', 'n', 'o', 3, 'n'),
(10, 1, 4, 'index', 'y', 'webpage', '{layout="site/wrapper"}\r\n<div class="row">\r\n{exp:channel:entries channel="field_guide_types"}\r\n	<ul class="breadcrumbs">\r\n	 <li><a href="/">Home</a></li>\r\n	 <li class="current"><a href="{site_url}category/{url_title}">{title}</a></li>\r\n	</ul>\r\n</div> <!-- end row -->\r\n<div class="row">\r\n	<div class="small-12 medium-8 columns">\r\n	<h1>{title}</h1>\r\n		<div class="row">\r\n			<div class="small-12 columns">\r\n			{type_description}\r\n{/exp:channel:entries}      \r\n			</div> <!-- end columns -->\r\n		</div> <!-- end row -->\r\n		<div class="row accent-gray">\r\n			<div class="small-12 columns" ng-controller="CategoryFilter as filter">\r\n				<form>\r\n					<div class="row">\r\n						<div class="small-12 columns">\r\n							<label><h3><strong>Browse by type:</strong></h3>\r\n								<select ng-model="type">\r\n									<option value="" selected>All</option>\r\n									<option ng-repeat="option in options" value="{{option.id}}">{{option.name}}</option>\r\n								</select>\r\n							</label>\r\n						</div>\r\n					</div>\r\n				</form>\r\n				<ul class="small-block-grid-1 medium-block-grid-2">\r\n					<li class="accent-white" ng-repeat="entry in entries | filter:type">\r\n						<img ng-src="{{entry.image}}" src="http://placehold.it/320x200" />\r\n						<h3><a href="{site_url}entry/{{entry.url}}">{{entry.title}}</a></h3>\r\n						<h3><em>{{entry.scientific_name}}</em></h3>\r\n					</li>\r\n				</ul>\r\n			</div> <!-- end columns -->\r\n		</div> <!-- end row -->\r\n	</div> <!-- end left columns -->\r\n	<div class="small-12 medium-4 columns hide-for-small-down">\r\n\r\n	{exp:search:simple_form channel="field_guide_entries" search_in="everywhere"}\r\n	<div class="row collapse">\r\n		<div class="medium-10 columns">\r\n			<input type="text" name="keywords" id="keywords" placeholder="search field guide">\r\n		</div>\r\n		<div class="medium-2 columns">\r\n			<button class="button tiny secondary postfix" style="color: black; font-size: 24px; border: none;"><i class="fi-magnifying-glass"></i></button>\r\n		</div>\r\n	</div>\r\n	{/exp:search:simple_form}\r\n	\r\n	{sort_menu}\r\n	</div> <!-- end right columns -->\r\n</div> <!-- end row -->', '', 1422893972, 1, 'n', 0, '', 'n', 'n', 'o', 804, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_throttle`
--

DROP TABLE IF EXISTS `exp_throttle`;
CREATE TABLE IF NOT EXISTS `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_no_access`
--

DROP TABLE IF EXISTS `exp_upload_no_access`;
CREATE TABLE IF NOT EXISTS `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_prefs`
--

DROP TABLE IF EXISTS `exp_upload_prefs`;
CREATE TABLE IF NOT EXISTS `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `max_size` varchar(16) DEFAULT NULL,
  `max_height` varchar(6) DEFAULT NULL,
  `max_width` varchar(6) DEFAULT NULL,
  `properties` varchar(120) DEFAULT NULL,
  `pre_format` varchar(120) DEFAULT NULL,
  `post_format` varchar(120) DEFAULT NULL,
  `file_properties` varchar(120) DEFAULT NULL,
  `file_pre_format` varchar(120) DEFAULT NULL,
  `file_post_format` varchar(120) DEFAULT NULL,
  `cat_group` varchar(255) DEFAULT NULL,
  `batch_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `exp_upload_prefs`
--

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `server_path`, `url`, `allowed_types`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`) VALUES
(1, 1, 'Entry Images', 'C:\\wamp\\www\\images\\Entry Images/', 'http://localhost/images/Entry Images/', 'img', '', '', '', '', '', '', '', '', '', '', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
