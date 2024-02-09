DELIMITER $$

create trigger prevent_self_follows
  before insert on follows for each row
  BEGIN
    if new.follower_id = new.followee_id
    then
      signal sqlstate '45000'
      set message_text = 'You cannot follow yourself!';
    end if;
  end;

$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER create_unfollow
    AFTER DELETE ON follows FOR EACH ROW 
BEGIN
    INSERT INTO unfollows
    SET follower_id = OLD.follower_id,
        followee_id = OLD.followee_id;
END$$

DELIMITER ;
