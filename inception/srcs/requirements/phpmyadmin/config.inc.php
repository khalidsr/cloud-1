<?php
declare(strict_types=1);

/**
 * This is needed for cookie based authentication to encrypt the cookie.
 * Needs to be a 32-bytes long string of random bytes. See FAQ 2.10.
 */
$cfg['blowfish_secret'] = 'YOUR_RANDOM_32_BYTE_STRING'; /* YOU MUST FILL THIS FOR COOKIE AUTH! */

/**
 * Servers configuration
 */
$i = 0;

/**
 * First server
 */
$i++;
/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['host'] = 'mariadb';  // The hostname must match your docker-compose service name
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = false;
/* Optional: If you're using specific users for PHPMyAdmin features like bookmarks or tracking, uncomment and configure these. */
// $cfg['Servers'][$i]['controluser'] = 'pma';
// $cfg['Servers'][$i]['controlpass'] = 'pmapass';

/* Upload and Save directories */
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
