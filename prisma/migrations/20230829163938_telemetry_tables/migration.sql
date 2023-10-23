-- CreateTable
CREATE TABLE `RequestLogs` (
    `request_id` INTEGER NOT NULL AUTO_INCREMENT,
    `url` VARCHAR(191) NOT NULL,
    `query` VARCHAR(191) NOT NULL,
    `method` VARCHAR(191) NOT NULL,
    `response_status_code` INTEGER NOT NULL,
    `timestamp` DATETIME(3) NOT NULL,

    INDEX `RequestLogs_timestamp_idx`(`timestamp`),
    PRIMARY KEY (`request_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ErrorLogs` (
    `error_id` INTEGER NOT NULL AUTO_INCREMENT,
    `request_id` INTEGER NOT NULL,
    `stack_trace` LONGTEXT NOT NULL,
    `message` LONGTEXT NOT NULL,

    UNIQUE INDEX `ErrorLogs_request_id_key`(`request_id`),
    INDEX `ErrorLogs_request_id_idx`(`request_id`),
    PRIMARY KEY (`error_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
