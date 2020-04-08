INSERT INTO `device` (`track`, `type_id`, `deleted`, `updated`, `created`) VALUES
  (1010, 1, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (1011, 2, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO `state` (`value`, `name`, `slug`) VALUES
  (0x20DF10EF, 'prender TV', 'prender-tv'),
  (0x20DF10EF, 'apagar TV', 'apagar-tv');

INSERT INTO `terminal` (`name`, `slug`, `deleted`, `updated`, `created`) VALUES
  ('TV LG', 'tv-lg', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('Luz Living', 'luz-living', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO `device_terminal` (`device_id`, `terminal_id`) VALUES
  (1, 1),
  (2, 2);

INSERT INTO `terminal_state` (`terminal_id`, `state_id`) VALUES
  (1, 1),
  (1, 2);
