CREATE TABLE IF NOT EXISTS `device` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`track_device` int(10) NOT NULL,
	`state` int(10) NOT NULL,
	`deleted` int(3),
	`timer` DATETIME,
	`updated` DATETIME DEFAULT CURRENT_TIMESTAMP,
	`created` DATETIME,
	PRIMARY KEY (`id`),
	KEY `track` (`track_device`),
	KEY `state` (`state`),
	KEY `timer` (`timer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `terminal` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`name` varchar(64) NOT NULL,
	`slug` varchar(64) NOT NULL,
  `deleted` int(3),
  `created` DATETIME,
	`updated` DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`),
	KEY `name` (`name`),
	KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `state` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`value` int(10) NOT NULL,
  `name` varchar(64) NOT NULL,
  `slug` varchar(64) NOT NULL,
	PRIMARY KEY (`id`),
	KEY `state_type` (`value`),
	KEY `name` (`name`),
	KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `device_terminal` (
  `device_id` int(10) unsigned NOT NULL,
  `terminal_id` int(10) unsigned NOT NULL,
  CONSTRAINT cs_pk PRIMARY KEY (device_id, terminal_id),
  CONSTRAINT FOREIGN KEY (device_id) REFERENCES device (id),
  CONSTRAINT FOREIGN KEY (terminal_id) REFERENCES terminal (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `terminal_state` (
	`terminal_id` int(10) unsigned NOT NULL,
	`state_id` int(10) unsigned NOT NULL,
  CONSTRAINT cs_pk PRIMARY KEY (terminal_id, state_id),
  CONSTRAINT FOREIGN KEY (terminal_id) REFERENCES terminal (id),
  CONSTRAINT FOREIGN KEY (state_id) REFERENCES state (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `packages` (
	`id` int(10) unsigned NOT NULL AUTO_INCREMENT,
	`code` int(10) NOT NULL,
	`state` int(10) NOT NULL,
	`deleted` int(3),
	`updated` DATETIME DEFAULT CURRENT_TIMESTAMP,
	`created` DATETIME,
	PRIMARY KEY (`id`),
	KEY `code` (`code`),
	KEY `state` (`state`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Estructura para la tabla `category_specialty`
--

# CREATE TABLE IF NOT EXISTS `ipc_category_specialty` (
# 	`category_id` int(10) unsigned NOT NULL,
# 	`specialty_id` int(10) unsigned NOT NULL,
#   CONSTRAINT cs_pk PRIMARY KEY (category_id, specialty_id),
#   CONSTRAINT FOREIGN KEY (category_id) REFERENCES ipc_category (id),
#   CONSTRAINT FOREIGN KEY (specialty_id) REFERENCES ipc_specialty (id)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#
# --
# -- Estructura para la tabla `professional_specialty`
# --
#
# CREATE TABLE IF NOT EXISTS `ipc_professional_specialty` (
# 	`professional_id` int(10) unsigned NOT NULL,
# 	`specialty_id` int(10) unsigned NOT NULL,
#   CONSTRAINT cs_pk PRIMARY KEY (professional_id, specialty_id),
#   CONSTRAINT FOREIGN KEY (professional_id) REFERENCES ipc_professional (id),
#   CONSTRAINT FOREIGN KEY (specialty_id) REFERENCES ipc_specialty (id)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
#
# --
# -- Estructura para la tabla `category_professional`
# --
#
# CREATE TABLE IF NOT EXISTS `ipc_category_professional` (
# 	`category_id` int(10) unsigned NOT NULL,
# 	`professional_id` int(10) unsigned NOT NULL,
# 	CONSTRAINT cs_pk PRIMARY KEY (category_id, professional_id),
# 	CONSTRAINT FOREIGN KEY (category_id) REFERENCES ipc_category (id),
# 	CONSTRAINT FOREIGN KEY (professional_id) REFERENCES ipc_professional (id)
# ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
