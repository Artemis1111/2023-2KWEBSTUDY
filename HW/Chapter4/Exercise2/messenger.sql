CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_ID` VARCHAR(20) NOT NULL,
    `user_password` VARCHAR(20) NOT NULL,
    `nickname` VARCHAR(20) NOT NULL,
    `propile_image_ink` VARCHAR(100) NOT NULL,
    `propile_messege` VARCHAR(100) NOT NULL,
    `withdraw_status` TINYINT(1) DEFAULT 0,
    `join_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `user` INT NOT NULL,
    `channel_link` VARCHAR(1000) NOT NULL,
    `max_number_of_people` INT NOT NULL,
    `withdraw_status` TINYINT(1) DEFAULT 0,
    `create_channel_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `chat_user` INT NOT NULL,
    `chat_channel` INT NOT NULL,
    `create_chat_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`chat_user`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`chat_channel`) REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `follow_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `blocking_user` INT NOT NULL,
    `blocked_user` INT NOT NULL,
    `block_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`blocking_user`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`blocked_user`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;