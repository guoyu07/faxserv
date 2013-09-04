BEGIN;

CREATE TABLE faxmaster_action_log (
    id INT NOT NULL,
    username VARCHAR( 32 ) NOT NULL,
    activity VARCHAR( 32 ) NOT NULL,
    timePerformed INTEGER NOT NULL,
    faxID INT NOT NULL,
    PRIMARY KEY (id),
);

COMMIT;