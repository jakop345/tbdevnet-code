-- phpMyAdmin SQL Dump
-- version 2.9.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jan 05, 2008 at 12:55 PM
-- Server version: 5.0.33
-- PHP Version: 5.2.1
-- 
-- Database: `tb`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `avps`
-- 

CREATE TABLE `avps` (
  `arg` varchar(20) collate latin1_general_ci NOT NULL default '',
  `value_s` text collate latin1_general_ci NOT NULL,
  `value_i` int(11) NOT NULL default '0',
  `value_u` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`arg`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `bans`
-- 

CREATE TABLE `bans` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `addedby` int(10) unsigned NOT NULL default '0',
  `comment` varchar(255) collate latin1_general_ci NOT NULL default '',
  `first` int(11) default NULL,
  `last` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `first_last` (`first`,`last`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `blocks`
-- 

CREATE TABLE `blocks` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` int(10) unsigned NOT NULL default '0',
  `blockid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `userfriend` (`userid`,`blockid`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `categories`
-- 

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(30) collate latin1_general_ci NOT NULL default '',
  `image` varchar(255) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `comments`
-- 

CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user` int(10) unsigned NOT NULL default '0',
  `torrent` int(10) unsigned NOT NULL default '0',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `text` text collate latin1_general_ci NOT NULL,
  `ori_text` text collate latin1_general_ci NOT NULL,
  `editedby` int(10) unsigned NOT NULL default '0',
  `editedat` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `user` (`user`),
  KEY `torrent` (`torrent`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `countries`
-- 

CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(50) collate latin1_general_ci default NULL,
  `flagpic` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `files`
-- 

CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `torrent` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) collate latin1_general_ci NOT NULL default '',
  `size` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `torrent` (`torrent`),
  FULLTEXT KEY `filename` (`filename`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `forums`
-- 

CREATE TABLE `forums` (
  `sort` tinyint(3) unsigned NOT NULL default '0',
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(60) collate latin1_general_ci NOT NULL default '',
  `description` varchar(200) collate latin1_general_ci default NULL,
  `minclassread` tinyint(3) unsigned NOT NULL default '0',
  `minclasswrite` tinyint(3) unsigned NOT NULL default '0',
  `postcount` int(10) unsigned NOT NULL default '0',
  `topiccount` int(10) unsigned NOT NULL default '0',
  `minclasscreate` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `friends`
-- 

CREATE TABLE `friends` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` int(10) unsigned NOT NULL default '0',
  `friendid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `userfriend` (`userid`,`friendid`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `messages`
-- 

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `sender` int(10) unsigned NOT NULL default '0',
  `receiver` int(10) unsigned NOT NULL default '0',
  `added` datetime default NULL,
  `msg` text collate latin1_general_ci,
  `unread` enum('yes','no') collate latin1_general_ci NOT NULL default 'yes',
  `poster` bigint(20) unsigned NOT NULL default '0',
  `location` enum('in','out','both') collate latin1_general_ci NOT NULL default 'in',
  PRIMARY KEY  (`id`),
  KEY `receiver` (`receiver`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `news`
-- 

CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` int(11) NOT NULL default '0',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `body` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `added` (`added`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `peers`
-- 

CREATE TABLE `peers` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `torrent` int(10) unsigned NOT NULL default '0',
  `peer_id` varchar(20) character set latin1 collate latin1_bin NOT NULL default '',
  `ip` varchar(64) collate latin1_general_ci NOT NULL default '',
  `port` smallint(5) unsigned NOT NULL default '0',
  `uploaded` bigint(20) unsigned NOT NULL default '0',
  `downloaded` bigint(20) unsigned NOT NULL default '0',
  `to_go` bigint(20) unsigned NOT NULL default '0',
  `seeder` enum('yes','no') collate latin1_general_ci NOT NULL default 'no',
  `started` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_action` datetime NOT NULL default '0000-00-00 00:00:00',
  `connectable` enum('yes','no') collate latin1_general_ci NOT NULL default 'yes',
  `userid` int(10) unsigned NOT NULL default '0',
  `agent` varchar(60) collate latin1_general_ci NOT NULL default '',
  `finishedat` int(10) unsigned NOT NULL default '0',
  `downloadoffset` bigint(20) unsigned NOT NULL default '0',
  `uploadoffset` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `torrent_peer_id` (`torrent`,`peer_id`),
  KEY `torrent` (`torrent`),
  KEY `torrent_seeder` (`torrent`,`seeder`),
  KEY `last_action` (`last_action`),
  KEY `connectable` (`connectable`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `pollanswers`
-- 

CREATE TABLE `pollanswers` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pollid` int(10) unsigned NOT NULL default '0',
  `userid` int(10) unsigned NOT NULL default '0',
  `selection` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `pollid` (`pollid`),
  KEY `selection` (`selection`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `polls`
-- 

CREATE TABLE `polls` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `question` varchar(255) collate latin1_general_ci NOT NULL default '',
  `option0` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option1` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option2` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option3` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option4` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option5` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option6` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option7` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option8` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option9` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option10` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option11` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option12` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option13` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option14` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option15` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option16` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option17` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option18` varchar(40) collate latin1_general_ci NOT NULL default '',
  `option19` varchar(40) collate latin1_general_ci NOT NULL default '',
  `sort` enum('yes','no') collate latin1_general_ci NOT NULL default 'yes',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `posts`
-- 

CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `topicid` int(10) unsigned NOT NULL default '0',
  `userid` int(10) unsigned NOT NULL default '0',
  `added` datetime default NULL,
  `body` text collate latin1_general_ci,
  `editedby` int(10) unsigned NOT NULL default '0',
  `editedat` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `topicid` (`topicid`),
  KEY `userid` (`userid`),
  FULLTEXT KEY `body` (`body`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `readposts`
-- 

CREATE TABLE `readposts` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` int(10) unsigned NOT NULL default '0',
  `topicid` int(10) unsigned NOT NULL default '0',
  `lastpostread` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `topicid` (`topicid`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `searchcloud`
-- 

CREATE TABLE `searchcloud` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `searchedfor` varchar(50) collate utf8_unicode_ci NOT NULL,
  `howmuch` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- 
-- Table structure for table `sitelog`
-- 

CREATE TABLE `sitelog` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `added` datetime default NULL,
  `txt` text collate latin1_general_ci,
  PRIMARY KEY  (`id`),
  KEY `added` (`added`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `stylesheets`
-- 

CREATE TABLE `stylesheets` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uri` varchar(255) collate latin1_general_ci NOT NULL default '',
  `name` varchar(64) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `topics`
-- 

CREATE TABLE `topics` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `userid` int(10) unsigned NOT NULL default '0',
  `subject` varchar(40) collate latin1_general_ci default NULL,
  `locked` enum('yes','no') collate latin1_general_ci NOT NULL default 'no',
  `forumid` int(10) unsigned NOT NULL default '0',
  `lastpost` int(10) unsigned NOT NULL default '0',
  `sticky` enum('yes','no') collate latin1_general_ci NOT NULL default 'no',
  `views` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `userid` (`userid`),
  KEY `subject` (`subject`),
  KEY `lastpost` (`lastpost`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `torrents`
-- 

CREATE TABLE `torrents` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `info_hash` varchar(20) character set latin1 collate latin1_bin NOT NULL default '',
  `name` varchar(255) collate latin1_general_ci NOT NULL default '',
  `filename` varchar(255) collate latin1_general_ci NOT NULL default '',
  `save_as` varchar(255) collate latin1_general_ci NOT NULL default '',
  `search_text` text collate latin1_general_ci NOT NULL,
  `descr` text collate latin1_general_ci NOT NULL,
  `ori_descr` text collate latin1_general_ci NOT NULL,
  `category` int(10) unsigned NOT NULL default '0',
  `size` bigint(20) unsigned NOT NULL default '0',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `type` enum('single','multi') collate latin1_general_ci NOT NULL default 'single',
  `numfiles` int(10) unsigned NOT NULL default '0',
  `comments` int(10) unsigned NOT NULL default '0',
  `views` int(10) unsigned NOT NULL default '0',
  `hits` int(10) unsigned NOT NULL default '0',
  `times_completed` int(10) unsigned NOT NULL default '0',
  `leechers` int(10) unsigned NOT NULL default '0',
  `seeders` int(10) unsigned NOT NULL default '0',
  `last_action` datetime NOT NULL default '0000-00-00 00:00:00',
  `visible` enum('yes','no') collate latin1_general_ci NOT NULL default 'yes',
  `banned` enum('yes','no') collate latin1_general_ci NOT NULL default 'no',
  `owner` int(10) unsigned NOT NULL default '0',
  `numratings` int(10) unsigned NOT NULL default '0',
  `ratingsum` int(10) unsigned NOT NULL default '0',
  `nfo` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `info_hash` (`info_hash`),
  KEY `owner` (`owner`),
  KEY `visible` (`visible`),
  KEY `category_visible` (`category`,`visible`),
  FULLTEXT KEY `ft_search` (`search_text`,`ori_descr`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(40) collate latin1_general_ci NOT NULL default '',
  `passhash` varchar(32) collate latin1_general_ci NOT NULL default '',
  `secret` varchar(20) character set latin1 collate latin1_bin NOT NULL default '',
  `email` varchar(80) collate latin1_general_ci NOT NULL default '',
  `status` enum('pending','confirmed') collate latin1_general_ci NOT NULL default 'pending',
  `added` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_login` datetime NOT NULL default '0000-00-00 00:00:00',
  `last_access` datetime NOT NULL default '0000-00-00 00:00:00',
  `editsecret` varchar(20) character set latin1 collate latin1_bin NOT NULL default '',
  `privacy` enum('strong','normal','low') collate latin1_general_ci NOT NULL default 'normal',
  `stylesheet` int(10) default '1',
  `info` text collate latin1_general_ci,
  `acceptpms` enum('yes','friends','no') collate latin1_general_ci NOT NULL default 'yes',
  `ip` varchar(15) collate latin1_general_ci NOT NULL default '',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `avatar` varchar(100) collate latin1_general_ci NOT NULL default '',
  `uploaded` bigint(20) unsigned NOT NULL default '0',
  `downloaded` bigint(20) unsigned NOT NULL default '0',
  `title` varchar(30) collate latin1_general_ci NOT NULL default '',
  `country` int(10) unsigned NOT NULL default '0',
  `notifs` varchar(100) collate latin1_general_ci NOT NULL default '',
  `modcomment` text collate latin1_general_ci NOT NULL,
  `enabled` enum('yes','no') collate latin1_general_ci NOT NULL default 'yes',
  `avatars` enum('yes','no') collate latin1_general_ci NOT NULL default 'yes',
  `donor` enum('yes','no') collate latin1_general_ci NOT NULL default 'no',
  `warned` enum('yes','no') collate latin1_general_ci NOT NULL default 'no',
  `warneduntil` datetime NOT NULL default '0000-00-00 00:00:00',
  `torrentsperpage` int(3) unsigned NOT NULL default '0',
  `topicsperpage` int(3) unsigned NOT NULL default '0',
  `postsperpage` int(3) unsigned NOT NULL default '0',
  `deletepms` enum('yes','no') collate latin1_general_ci NOT NULL default 'yes',
  `savepms` enum('yes','no') collate latin1_general_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `status_added` (`status`,`added`),
  KEY `ip` (`ip`),
  KEY `uploaded` (`uploaded`),
  KEY `downloaded` (`downloaded`),
  KEY `country` (`country`),
  KEY `last_access` (`last_access`),
  KEY `enabled` (`enabled`),
  KEY `warned` (`warned`)
) ENGINE=MyISAM ;