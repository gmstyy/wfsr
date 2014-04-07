CREATE TABLE `config` (
  `id` int(10) NOT NULL,
  `config_key` varchar(100) default NULL,
  `config_value` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
CREATE TABLE `food_list` (
  `id` int(10) NOT NULL,
  `name` varchar(50) default NULL,
  `path` varchar(200) default NULL,
  `menu_id` varchar(200) default NULL,
  `detail_path` varchar(200) default NULL,
  `remark` varchar(200) default NULL,
  `sort_no` int(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
CREATE TABLE `menu` (
  `id` int(10) NOT NULL,
  `parent_id` int(10) default NULL,
  `menu_level` int(2) default NULL,
  `name` varchar(50) default NULL,
  `url` varchar(200) default NULL,
  `sort_no` int(10) default NULL,
  `image_path` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
;
CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `menu_id` int(10) default NULL,
  `type` int(2) default NULL,
  `title` varchar(100) default NULL,
  `content` blob,
  `date` date default NULL,
  `sort_no` int(3) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;