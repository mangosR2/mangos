
UPDATE `command`
SET `help` = 'Syntax: .send mass items #racemask|$racename|alliance|horde|all [male|female] "#subject" "#text" itemid1[:count1] itemid2[:count2] ... itemidN[:countN]\r\n\r\nSend a mail to players. Subject and mail text must be in "". Gender may be omitted. If for itemid not provided related count values then expected 1, if count > max items in stack then items will be send in required amount stacks. All stacks amount in mail limited to 12.'
WHERE `name` = 'send mass items';

UPDATE `command`
SET `help` = 'Syntax: .send mass mail #racemask|$racename|alliance|horde|all [male|female] "#subject" "#text"\r\n\r\nSend a mail to players. Subject and mail text must be in "". Gender may be omitted.'
WHERE `name` = 'send mass mail';

UPDATE `command`
SET `help` = 'Syntax: .send mass money #racemask|$racename|alliance|horde|all [male|female] "#subject" "#text" #money\r\n\r\nSend mail with money to players. Subject and mail text must be in "". Gender may be omitted.'
WHERE `name` = 'send mass money';
