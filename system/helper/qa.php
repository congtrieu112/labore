<?php
if (!defined('JSON_UNESCAPED_SLASHES')) {
    define('JSON_UNESCAPED_SLASHES', 0xFFFF);
}

/**
  * Use our custom json_encode function in case of older PHP versions
  *
  **/
function json_enc($value, $options = 0, $depth = 512) {
    if (version_compare(phpversion(), '5.5.0') >= 0) {
        return json_encode($value, $options, $depth);
    } elseif (version_compare(phpversion(), '5.4.0') >= 0) {
        return json_encode($value, $options);
    } else {
        return json_encode($value);
    }
}

/*
 * Validate an email address.
 * Provide email address (raw input)
 * Returns true if the email address has the email
 * address format and the domain exists.
 *
 **/
function validate_email($email) {
    $isValid = true;
    $atIndex = strrpos($email, "@");
    if (is_bool($atIndex) && !$atIndex) {
        $isValid = false;
    } else {
        $domain = substr($email, $atIndex+1);
        $local = substr($email, 0, $atIndex);
        $localLen = strlen($local);
        $domainLen = strlen($domain);
        if ($localLen < 1 || $localLen > 64) {
            // local part length exceeded
            $isValid = false;
        } else if ($domainLen < 1 || $domainLen > 255) {
            // domain part length exceeded
            $isValid = false;
        } else if ($local[0] == '.' || $local[$localLen-1] == '.') {
            // local part starts or ends with '.'
            $isValid = false;
        } else if (preg_match('/\\.\\./', $local)) {
            // local part has two consecutive dots
            $isValid = false;
        } else if (!preg_match('/^[A-Za-z0-9\\-\\.]+$/', $domain)) {
            // character not valid in domain part
            $isValid = false;
        } else if (preg_match('/\\.\\./', $domain)) {
            // domain part has two consecutive dots
            $isValid = false;
        } else if (!preg_match('/^(\\\\.|[A-Za-z0-9!#%&`_=\\/$\'*+?^{}|~.-])+$/',
                      str_replace("\\\\","",$local)))
        {
            // character not valid in local part unless
            // local part is quoted
            if (!preg_match('/^"(\\\\"|[^"])+"$/', str_replace("\\\\","",$local))) {
                $isValid = false;
            }
        }
        if ($isValid && !(checkdnsrr($domain,"MX") || checkdnsrr($domain,"A"))) {
            // domain not found in DNS
            $isValid = false;
        }
    }
    return $isValid;
}

/**
  * Remaps an array keys to SQL id fields
  *
  **/
function arrayRemapKeysToIds($key, $results) {
    $new_array = array();

    foreach ($results as $result) {
        if (isset($result[$key])) {
            $new_array[$result[$key]] = $result;
        }
    }

    return $new_array;
}

/**
  * Sort columns by index key
  *
  **/
function column_sort($a, $b) {
    if ($a['index'] == $b['index']) {
        return 0;
    }
    return ($a['index'] < $b['index']) ? -1 : 1;
}

/**
  * Filter columns by display value
  *
  **/
function column_display($a) {
    return (isset($a['display'])) ? (int)$a['display'] : false;
}

if (!function_exists("utf8_strlen")) {
    function utf8_strlen($string) {
        return strlen(utf8_decode($string));
    }
}
?>
