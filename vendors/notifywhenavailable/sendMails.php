<?php  
define('NWA_CLI', 'working');
$_GET['route'] = 'module/notifywhenavailable/sendMails';
$folder = dirname(dirname(dirname(__FILE__)));
chdir($folder);
require_once('index.php');