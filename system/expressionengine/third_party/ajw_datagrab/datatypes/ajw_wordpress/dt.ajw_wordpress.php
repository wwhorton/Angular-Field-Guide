<?php

/**
 * DataGrab WordPress import class
 *
 * Allows WordPress imports
 * 
 * @package   DataGrab
 * @author    Andrew Weaver <aweaver@brandnewbox.co.uk>
 * @copyright Copyright (c) Andrew Weaver
 */
class Ajw_wordpress extends Datagrab_type {

	var $datatype_info = array(
		'name'		=> 'WordPress',
		'version'	=> '0.1',
		'allow_comments' => TRUE
	);
	
	var $settings = array(
		"filename" => "",
		"just_posts" => "y"
	);
	
	var $config_defaults = array(
		"title" => "title",
		"date" => "pubDate",
		"import_comments" => "y",
		"comment_author" => "wp:comment/wp:comment_author",
		"comment_email" => "wp:comment/wp:comment_author_email",
		"comment_url" => "wp:comment/wp:comment_author_url",
		"comment_date" => "wp:comment/wp:comment_date",
		"comment_body" => "wp:comment/wp:comment_content",
		"cat_field" => "categories",
		"author_field" => "dc:creator",
		"status" => "wp:status"
	);
	
	/* 
	   Map WP statuses to EE ones. This is a temporary fix until I can 
	   add a more friendly user interface 

	   Alter this array to suit your requirements - you can use your own
	   custom statuses here 
	*/
	var $statuses = array(
		"publish" => "Open",
		"draft" => "Closed",
		"auto-draft" => "Closed",
		"pending" => "Closed",
		"inherit" => "Closed"
	);
	
	var $path = "/rss/channel/item";
	
	var $items;
	
	function settings_form( $values = array() ) {
		
		$form = array(
			array(
				form_label('Filename or URL', 'filename') .
				'<div class="subtext">Can be a file on the local file system or from a website site url (http://...)</div>', 
				form_input(
					array(
						'name' => 'filename',
						'id' => 'filename',
						'value' => $this->get_value( $values, "filename" ),
						'size' => '50'
						)
					)
				),
			array(
				form_label('Just import posts?', 'just_posts') .
				'<div class="subtext">Only import posts, or include other post types (eg, attachments)</div>',
				form_checkbox('just_posts', '1', ( $this->get_value( $values, "just_posts" ) == 1 ? TRUE : FALSE ), ' id="just_posts"')
			)
		);
	
		return $form;
	}
	
	function fetch() {

		// print ini_get( 'pcre.backtrack_limit' ); = 100000
		// ini_set( 'pcre.backtrack_limit', (int)ini_get( 'pcre.backtrack_limit' ) + (int)ini_get( 'pcre.backtrack_limit' ) ); 
		// print ini_get( 'pcre.backtrack_limit' ); = 200000
		ini_set( 'pcre.backtrack_limit', '250000' );

		$xml = @file_get_contents( $this->settings["filename"] );
		if( $xml === FALSE ) {
			$this->errors[] = "Cannot open file/url: " . $this->settings["filename"];
			return -1;
		}

		$this->items = array();
		$this->items = $this->_fetch_xml( $xml );

		if ( $this->items == "" ) {
			$this->errors[] = "Please check the path is correct: " . $this->path;
			return -1;
		}

	}

	function next() {

		$item = current( $this->items );
		next( $this->items );

		return $item;
		
	}
	
	function fetch_columns() {
		
		$this->fetch();
		$columns = $this->next();
		
		$titles = array(
			"title" => "Title",
			"pubDate" => "Published Date",
			"link" => "Link",
			"dc:creator" => "Creator",
			"guid" => "Guid",
			"description" => "Description",
			"content:encoded" => "Content",
			"wp:status" => "Post Status",
			
			"wp:comment/wp:comment_author" => "Comment Author",
			"wp:comment/wp:comment_author_email" => "Comment Author Email",
			"wp:comment/wp:comment_author_url" => "Comment Author URL",
			"wp:comment/wp:comment_date" => "Comment Date",
			"wp:comment/wp:comment_content" => "Comment Content",

			"categories" => "Categories",
			"tags" => "Tags",
			
			"wp:post_type" => "Post type"
			
		);
		
		foreach( $titles as $idx => $title ) {
			if( isset( $columns[ $idx ] ) ) {
				$eg = $columns[ $idx ];
				if ( strlen( $eg ) > 32 ) {
					$eg = substr( htmlspecialchars( $eg ), 0, 32 ) . "...";
				}
				if( $eg != "" ) {
					$titles[ $idx ] .= " - eg, " . $eg;
				}
			}
		}
		
		return $titles;
	}
	
	/* Private functions */
	
	function _fetch_xml( $xml ) {

		$items = array();

		$item_array = $this->_fetch_tags( $xml, "item" );

		if (preg_last_error() == PREG_INTERNAL_ERROR) {
		    print '<p>There is an internal error</p>';
		}
		else if (preg_last_error() == PREG_BACKTRACK_LIMIT_ERROR) {
		    print '<p>Backtrack limit was exhausted</p>';
		}
		else if (preg_last_error() == PREG_RECURSION_LIMIT_ERROR) {
		    print '<p>Recursion limit was exhausted</p>';
		}
		else if (preg_last_error() == PREG_BAD_UTF8_ERROR) {
		    print '<p>Bad UTF8 error</p>';
		}
		else if (preg_last_error() == PREG_BAD_UTF8_ERROR) {
		    print '<p>Bad UTF8 offset error</p>';
		}

		foreach( $item_array as $i ) {

			$item = array();

			// Fetch post type
			$item["wp:post_type"] = $this->_fetch_tags( $i, "wp:post_type" );
			
			// We could filter the results by post type, or just add it as
			// an available field...
			
			if( isset( $this->settings["just_posts"] ) && $this->settings["just_posts"] == "1" && $item["wp:post_type"] != "post" ) { 
				continue;
			}

			// Fetch basic data
			$item["title"] = $this->_fetch_tags( $i, "title" );
			$item["pubDate"] = $this->_fetch_tags( $i, "pubDate" );
			$item["dc:creator"] = $this->_fetch_tags( $i, "dc:creator" );
			$item["link"] = $this->_fetch_tags( $i, "link" );
			$item["guid"] = $this->_fetch_tags( $i, "guid" );
			$item["description"] = $this->_fetch_tags( $i, "description" );
			$item["content:encoded"] = $this->_fetch_tags( $i, "content:encoded" );

			// Fetch and convert status
			$item["wp:status"] = $this->_fetch_tags( $i, "wp:status" );
			if( isset( $this->statuses[ $item["wp:status"] ] )) {
				$item["wp:status"] = $this->statuses[ $item["wp:status"] ];
			}


			// Fetch comments
			$comments = $this->_fetch_comments( $i );
			$item["wp:comment#"] = count( $comments );
			$item["wp:comment/wp:comment_content#"] = count( $comments );
			$count = 0;
			foreach( $comments as $comment ) {
				$count++;
				$prefix = "";
				if( $count > 1 ) { 
					$prefix = "#" . $count;
				}
				$item["wp:comment/wp:comment_author{$prefix}"] = $this->_fetch_tags( $comment, "wp:comment_author" );
				$item["wp:comment/wp:comment_author_email{$prefix}"] = $this->_fetch_tags( $comment, "wp:comment_author_email" );
				$item["wp:comment/wp:comment_author_url{$prefix}"] = $this->_fetch_tags( $comment, "wp:comment_author_url" );
				$item["wp:comment/wp:comment_date{$prefix}"] = $this->_fetch_tags( $comment, "wp:comment_date" );
				$item["wp:comment/wp:comment_content{$prefix}"] = $this->_fetch_tags( $comment, "wp:comment_content" );
			}
		
			// Fetch categories
			$item["categories"] = "";
			$categories = $this->_fetch_tags( $i, "category", 'domain="category"' );
			if( is_array( $categories ) ) {
				$categories = array_unique( $categories );
				foreach( $categories as $idx => $category ) {
					$categories[$idx] = $this->_remove_cdata( $category );
				}
				$item["categories"] = implode( ", ", $categories );
			}
			//tim addes to include post with single categories
			else{
				$item["categories"] = $this->_remove_cdata( $categories );
			}

			// Fetch tags
			$item["tags"] = "";
			$categories = $this->_fetch_tags( $i, "category", 'domain="tag"' );
			if( is_array( $categories ) ) {
				$categories = array_unique( $categories );
				foreach( $categories as $idx => $category ) {
					$categories[$idx] = $this->_remove_cdata( $category );
				}
				$item["tags"] = implode( ", ", $categories );
			}
			//tim addes to include post with single tags
			else {
				$item["tags"] = $this->_remove_cdata( $categories );
			}

			$items[] = $item;
			
		}
		//exit; 

		return $items;
	}
	
	function _fetch_tags( $xml, $tag, $attr="" ) {
		$reg = "|<$tag.*?>(.*?)</$tag>|is";
		if( $attr != "" ) {
			$reg = "|<$tag $attr.*?>(.*?)</$tag>|is";
		}
		$count = preg_match_all( $reg, $xml, $matches );
		if( $count == 0 ) {
			return array();
		}
		if( $count == 1 ) {
			$str = $matches[1][0];
			$str = $this->_remove_cdata( $str );
			return( $str );
		}
		return $matches[1];
	}
	
	function _remove_cdata( $str ) {
		$str = preg_replace( '#^<!\[CDATA\[(.*)\]\]>$#s', '$1', $str );
		return $str;
	}
	
	function _fetch_comments( $xml ) {
		$count = preg_match_all( '#<wp:comment>(.*?)</wp:comment>#is', $xml, $matches );
		if( $count == 0 ) {
			return array();
		}
		return $matches[1];
	}
	
	function _curl_fetch($url)
	{
		$ch = curl_init(); 
		curl_setopt($ch, CURLOPT_URL, $url); 
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_FRESH_CONNECT, 1);

		$data = curl_exec($ch);

		curl_close($ch);

		return $data;
	}

	function _fsockopen_fetch($url)
	{
		$target = parse_url($url);

		$data = '';

		$fp = fsockopen($target['host'], 80, $error_num, $error_str, 8); 

		if (is_resource($fp))
		{
			fputs($fp, "GET {$url} HTTP/1.0\r\n");
			fputs($fp, "Host: {$target['host']}\r\n");
			fputs($fp, "User-Agent: EE/xmlgrab PHP/" . phpversion() . "\r\n\r\n");

			$headers = TRUE;

			while( ! feof($fp))
			{
				$line = fgets($fp, 4096);

				if ($headers === FALSE)
				{
					$data .= $line;
				}
				elseif (trim($line) == '')
				{
					$headers = FALSE;
				}
			}

			fclose($fp); 
		}

		return $data;
	}
	
}

?>