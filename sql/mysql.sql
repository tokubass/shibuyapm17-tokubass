
CREATE TABLE IF NOT EXISTS member (
    id           INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(60) comment 'name comment',
    code         INTEGER  comment 'code comment',
  UNIQUE (`name`,`code`)
) comment='会員情報';
