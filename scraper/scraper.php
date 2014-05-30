<?php
require_once('simplehtmldom_1_5/simple_html_dom.php');
 
$calendar = file_get_html('http://itp.nyu.edu/camp2013/calendar/');

$sessions = array();
$campers = array();

$counter = 0;

foreach($calendar->find('#ai1ec-calendar-view .ai1ec-day') as $day){
	foreach($day->find('.ai1ec-event-container') as $session){
		$timeElement = $session->find('.ai1ec-event-time', 0);
		if ($timeElement) {
			$time = $timeElement->plaintext;
		} else {
			$time = 'all day';
		}
		$sessionDetailPage = file_get_html(trim($session->href));
		$sessionHere = array(
			'title' => trim($session->find('.ai1ec-event-title', 0)->plaintext),
			'day' => trim($day->find('.ai1ec-date a', 0)->plaintext),
			'time' => trim($time),
			'full_time' => trim($sessionDetailPage->find('.ai1ec-time .ai1ec-field-value', 0)->plaintext),
			'organizer' => trim(str_replace('By ', '', $sessionDetailPage->find('.post-byline', 0)->plaintext)),
			'num_comments' => count($sessionDetailPage->find('.comment')),
			'url' => trim($session->href),
			'description' => trim($sessionDetailPage->find('p', 0)->plaintext),
		);
		foreach ($sessionDetailPage->find('.comment') as $comment) {
			$camper = trim($comment->find('.sfw-fn', 0)->plaintext);
			$camperSession = $sessionHere;
			$camperSession['comment'] = trim($comment->find('.sfw-comment-content', 0)->plaintext);
			$campers[$camper]['sessions'][] = $camperSession;
		}
		print (++ $counter) . ' ' . $sessionHere['title'] . PHP_EOL;
		$sessions[] = $sessionHere;
	}
}

// dump sessions to CSV
$fp = fopen('../data/2013/sessions.csv', 'w');
fputcsv($fp, array_keys($sessions[0]));
foreach ($sessions as $session) {
	fputcsv($fp, $session);
}

// dump campers to CSV
foreach ($campers as $camper => $sessions) {
	# code...
}

// one file per camper with their sessions
foreach ($campers as $camper => $props) {
	$fp = fopen('../data/2013/campers/' . $camper . '.csv', 'w');
	fputcsv($fp, array_keys($props['sessions'][0]));
	foreach ($props['sessions'] as $session) {
		fputcsv($fp, $session);
	}
}