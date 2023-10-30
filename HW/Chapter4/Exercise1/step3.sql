-- your code
CREATE TABLE `courses` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `student_code` INT NOT NULL, -- 학생 개별코드 
    `entering_year` INT NOT NULL,
    `major` INT NOT NULL, -- 단과대학 코드(2자리) + 그 속에서 전공 코드(2자리)로 구성
    `call_number` VARCHAR(11) NOT NULL,
    `address` VARCHAR(100) NOT NULL,
    `accumulated_complete_credits` INT NOT NULL DEFAULT 0,
    `average_credits` FLOAT NOT NULL DEFAULT 0.0,
    `attendence` TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 이 때, "입학년도 + 단과대학 코드 + 학생 개별 코드"가 학번이 된다.