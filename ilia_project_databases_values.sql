CREATE DATABASE ilia_project;
USE ilia_project;

CREATE TABLE `ilia_project`.`machine_tool_classification` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `ilia_project`.`machine_tool_classification` (`name`) VALUES ('Станки токарные');
INSERT INTO `ilia_project`.`machine_tool_classification` (`name`) VALUES ('Станки сверлильные и расточные');
INSERT INTO `ilia_project`.`machine_tool_classification` (`name`) VALUES ('Станки шлифовальные, полировальные, доводочные');
INSERT INTO `ilia_project`.`machine_tool_classification` (`name`) VALUES ('Станки комбинированные (электрохимические, электромеханические, электроэрозионные и др.)');
INSERT INTO `ilia_project`.`machine_tool_classification` (`name`) VALUES ('Станки зубообрабатывающие, резьбообрабатывающие');
INSERT INTO `ilia_project`.`machine_tool_classification` (`name`) VALUES ('Станки фрезерные');
INSERT INTO `ilia_project`.`machine_tool_classification` (`name`) VALUES ('Станки строгальные, долбежные, протяжные');
INSERT INTO `ilia_project`.`machine_tool_classification` (`name`) VALUES ('Станки отрезные');
INSERT INTO `ilia_project`.`machine_tool_classification` (`name`) VALUES ('Станки разные');


CREATE TABLE `ilia_project`.`types_of_lathes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_machine_tool_classification` INT NOT NULL DEFAULT 1,
  `name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_machine_tool_classification`) REFERENCES `ilia_project`.`machine_tool_classification` (id),
  UNIQUE INDEX `id` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `ilia_project`.`types_of_lathes` (`id_machine_tool_classification`, `name`) VALUES ('1', 'Автоматы и полуавтоматы одношпиндельные');
INSERT INTO `ilia_project`.`types_of_lathes` (`id_machine_tool_classification`, `name`) VALUES ('1', 'Автоматы и полуавтоматы многошпиндельные');
INSERT INTO `ilia_project`.`types_of_lathes` (`id_machine_tool_classification`, `name`) VALUES ('1', 'Револьверные');
INSERT INTO `ilia_project`.`types_of_lathes` (`id_machine_tool_classification`, `name`) VALUES ('1', 'Сверлильно-отрезные');
INSERT INTO `ilia_project`.`types_of_lathes` (`id_machine_tool_classification`, `name`) VALUES ('1', 'Карусельные');
INSERT INTO `ilia_project`.`types_of_lathes` (`id_machine_tool_classification`, `name`) VALUES ('1', 'Токарные и лоботокарные');
INSERT INTO `ilia_project`.`types_of_lathes` (`id_machine_tool_classification`, `name`) VALUES ('1', 'Многорезцовые');
INSERT INTO `ilia_project`.`types_of_lathes` (`id_machine_tool_classification`, `name`) VALUES ('1', 'Специализированные для фасонных изделий');
INSERT INTO `ilia_project`.`types_of_lathes` (`id_machine_tool_classification`, `name`) VALUES ('1', 'Разные токарные');

CREATE TABLE `ilia_project`.`lathes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_types_of_lathes` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `characteristics` VARCHAR(1000) NULL,
  `weight` VARCHAR(45) NULL,
  `power` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_types_of_lathes`) REFERENCES `ilia_project`.`types_of_lathes` (id),
  UNIQUE INDEX `id` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `ilia_project`.`lathes` (`id_types_of_lathes`, `name`, `characteristics`, `weight`, `power`) VALUES ('9', '1104ИР', 'Станки модели 1104ир предназанчены для выполнения разнообразных работ отрезным абразивным кругом. Отрезка труб, уголков, арматурных прутков, полос и других профилей. 1104ИР.01 - базовая модель для 1104ИРП и 1104ИРБ', '80', '380');
INSERT INTO `ilia_project`.`lathes` (`id_types_of_lathes`, `name`, `characteristics`, `weight`, `power`) VALUES ('2', '1512ПФ1', 'На станках модели 1512ПФ1 можно производить: Обтачивание и растачивание цилиндрических и конических поверхностей, Протачивание торцовых поверхностей, Прорезку канавок и отрезку, Сверление, зенкерование и развёртывание центральных отверстий', '3200', '3000');
INSERT INTO `ilia_project`.`lathes` (`id_types_of_lathes`, `name`, `characteristics`, `weight`, `power`) VALUES ('5', '1550П', 'Станки модели 1550п предназначены для черновой и чистовой обработки стальных и чугунных деталей, изделий из цветных металлов и их сплавов, а также из неметаллических материалов', '140000', '125000');
INSERT INTO `ilia_project`.`lathes` (`id_types_of_lathes`, `name`, `characteristics`, `weight`, `power`) VALUES ('7', '16А20Ф40', 'Станки модели 16а20ф40 предназначены для тонкой обработки деталей типа тел вращения в замкнутом полуавтоматическом цикле.', '4050', '1200');
INSERT INTO `ilia_project`.`lathes` (`id_types_of_lathes`, `name`, `characteristics`, `weight`, `power`) VALUES ('4', '16К25Г', 'Станки модели 16к25г предназначены для обработки в центрах, патроне или планшайбе и для нарезания резьб', '3810', '1250');
INSERT INTO `ilia_project`.`lathes` (`id_types_of_lathes`, `name`, `characteristics`, `weight`, `power`) VALUES ('3', '1471ИГСА', 'Станки модели 1471игса предназначены для глубокого сверления деталей из стали и цветных металлов диаметром 20мм, длиной 150мм и наружным диаметром заготовки 35мм.', '3550', '900');


CREATE TABLE `ilia_project`.`types_drilling_and_boring` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_machine_tool_classification` INT NOT NULL,
  `name` VARCHAR(60) NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_machine_tool_classification`) REFERENCES `ilia_project`.`machine_tool_classification` (id),
  UNIQUE INDEX `id` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `ilia_project`.`types_drilling_and_boring` (`id_machine_tool_classification`, `name`) VALUES ('2', 'Вертикально-сверлильные');
INSERT INTO `ilia_project`.`types_drilling_and_boring` (`id_machine_tool_classification`, `name`) VALUES ('2', 'Одношпиндельные полуавтоматы');
INSERT INTO `ilia_project`.`types_drilling_and_boring` (`id_machine_tool_classification`, `name`) VALUES ('2', 'Многошпиндельные полуавтоматы');
INSERT INTO `ilia_project`.`types_drilling_and_boring` (`id_machine_tool_classification`, `name`) VALUES ('2', 'Координатно-расточные одностоечные');
INSERT INTO `ilia_project`.`types_drilling_and_boring` (`id_machine_tool_classification`, `name`) VALUES ('2', 'Радиально-сверлильные');
INSERT INTO `ilia_project`.`types_drilling_and_boring` (`id_machine_tool_classification`, `name`) VALUES ('2', 'Расточные');
INSERT INTO `ilia_project`.`types_drilling_and_boring` (`id_machine_tool_classification`, `name`) VALUES ('2', 'Алмазно-расточные');
INSERT INTO `ilia_project`.`types_drilling_and_boring` (`id_machine_tool_classification`, `name`) VALUES ('2', 'Горизонтально-сверлильные');
INSERT INTO `ilia_project`.`types_drilling_and_boring` (`id_machine_tool_classification`, `name`) VALUES ('2', 'Разные сверлильные');


CREATE TABLE `ilia_project`.`drilling_and_boring` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_types_drilling_and_boring` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `characteristics` VARCHAR(1000) NULL,
  `weight` VARCHAR(45) NULL,
  `power` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_types_drilling_and_boring`) REFERENCES `ilia_project`.`types_drilling_and_boring` (id),
  UNIQUE INDEX `id` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `ilia_project`.`drilling_and_boring` (`id_types_drilling_and_boring`, `name`, `characteristics`, `weight`, `power`) VALUES ('3', '2204ВМ1Ф4.0', 'Станки модели 2204вм1ф4.0 предназначены для комплексной обработки корпусых деталей средних размеров без переустановки', '6000', '1500');
INSERT INTO `ilia_project`.`drilling_and_boring` (`id_types_drilling_and_boring`, `name`, `characteristics`, `weight`, `power`) VALUES ('2', '2570ПМФ4', 'Станки модели 2570пмф4 предназначены для обработки крупногабаритных деталей из черных и цветных металлов методами фрезерования, сверления в единичном, мелкосерийном и серийном', '2800', '1900');
INSERT INTO `ilia_project`.`drilling_and_boring` (`id_types_drilling_and_boring`, `name`, `characteristics`, `weight`, `power`) VALUES ('7', '2Н135Б', 'Станки модели 2н135б предназначены для сверления, рассверливания, зенкования, развертывания, нарезания резьбы; применяется в условиях единичного и серийного производства', '3550', '400');
INSERT INTO `ilia_project`.`drilling_and_boring` (`id_types_drilling_and_boring`, `name`, `characteristics`, `weight`, `power`) VALUES ('2', '243ВМФ2', 'Станки модели 243вмф2 предназначены для комплексной обработки детали при подходе инструмента с одной стороны', '3350', '2200');
INSERT INTO `ilia_project`.`drilling_and_boring` (`id_types_drilling_and_boring`, `name`, `characteristics`, `weight`, `power`) VALUES ('6', '2622Г', 'Станки модели 2622г предназначены для обработки корпусных деталей массой до 3000 кг, имеющие точные отверстия, связанные точными межосевыми расстояниями', '1110', '850');
INSERT INTO `ilia_project`.`drilling_and_boring` (`id_types_drilling_and_boring`, `name`, `characteristics`, `weight`, `power`) VALUES ('9', '2651Ф1', 'Станки модели 2651ф1 предназначены для комплексной обработки сложных корпусных деталей из черных и цветных металлов', '77000', '3700');



CREATE TABLE `ilia_project`.`types_grinding_polishing_and_finishing` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_machine_tool_classification` INT NOT NULL,
  `name` VARCHAR(60) NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_machine_tool_classification`) REFERENCES `ilia_project`.`machine_tool_classification` (id),
  UNIQUE INDEX `id` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `ilia_project`.`types_grinding_polishing_and_finishing` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Круглошлифовальные');
INSERT INTO `ilia_project`.`types_grinding_polishing_and_finishing` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Внутришлифовальные');
INSERT INTO `ilia_project`.`types_grinding_polishing_and_finishing` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Обдирочно-шлифовальные');
INSERT INTO `ilia_project`.`types_grinding_polishing_and_finishing` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Специализированные шлифовальные');
INSERT INTO `ilia_project`.`types_grinding_polishing_and_finishing` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Заточные');
INSERT INTO `ilia_project`.`types_grinding_polishing_and_finishing` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Плоскошлифовальные с прямоугольным или круглым столом');
INSERT INTO `ilia_project`.`types_grinding_polishing_and_finishing` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Притирочные и полировальные');
INSERT INTO `ilia_project`.`types_grinding_polishing_and_finishing` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Разные станки, работающие абразивным инструментом');

CREATE TABLE `ilia_project`.`grinding_polishing_and_finishing` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_types_grinding_polishing_and_finishing` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `characteristics` VARCHAR(1000) NULL,
  `weight` VARCHAR(45) NULL,
  `power` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_types_grinding_polishing_and_finishing`) REFERENCES `ilia_project`.`types_grinding_polishing_and_finishing` (id),
  UNIQUE INDEX `id` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `ilia_project`.`grinding_polishing_and_finishing` (`id_types_grinding_polishing_and_finishing`, `name`, `characteristics`, `weight`, `power`) VALUES ('1', '3345А-Р1', 'Станки модели 3345а-р1 предназначены для одновременного шлифования двух противоположных торцов деталей типа колец подшипников и применяется в поточном производстве.', '1260', '37000');
INSERT INTO `ilia_project`.`grinding_polishing_and_finishing` (`id_types_grinding_polishing_and_finishing`, `name`, `characteristics`, `weight`, `power`) VALUES ('3', '3872Б', 'Станки модели 3872б предназначены для чистовой и черновой суперфинишной обработки круглых деталей. Шлифование производится в центрах по реле времени или по прибору активного контроля', '9000', '4000');
INSERT INTO `ilia_project`.`grinding_polishing_and_finishing` (`id_types_grinding_polishing_and_finishing`, `name`, `characteristics`, `weight`, `power`) VALUES ('6', '3А740', 'Станки модели 3а740 предназначены для обработки периферией круга плоских и конических (вогнутых и выпуклых) поверхностей деталей.', '3300', '7000');
INSERT INTO `ilia_project`.`grinding_polishing_and_finishing` (`id_types_grinding_polishing_and_finishing`, `name`, `characteristics`, `weight`, `power`) VALUES ('4', '3Б756', 'Станки модели 3б756 предназначены для шлифования плоскостей деталей торцом круга, закрепленных на зеркале стола, на магнитной или электромагнитной плите или в приспособлении', '6750', '35000');
INSERT INTO `ilia_project`.`grinding_polishing_and_finishing` (`id_types_grinding_polishing_and_finishing`, `name`, `characteristics`, `weight`, `power`) VALUES ('2', '3Д723', 'Станки модели 3д723 предназначены для шлифования плоских поверхностей различных изделий, закрепленных на зеркале стола, на магнитной или электромагнитной плите или в приспособлении.', '8700', '17000');
INSERT INTO `ilia_project`.`grinding_polishing_and_finishing` (`id_types_grinding_polishing_and_finishing`, `name`, `characteristics`, `weight`, `power`) VALUES ('5', '3Е721АФ1', 'Станки модели 3е721аф1 предназначены для обработки плоских поверхностей изделий из чугуна, сталей, цветных металлов на зеркале стола. Рекомендуется для серийного производства.', '5000', '7500');


CREATE TABLE `ilia_project`.`types_combined` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_machine_tool_classification` INT NOT NULL,
  `name` VARCHAR(60) NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_machine_tool_classification`) REFERENCES `ilia_project`.`machine_tool_classification` (id),
  UNIQUE INDEX `id` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `ilia_project`.`types_combined` (`id_machine_tool_classification`, `name`) VALUES ('4', 'Универсальные');
INSERT INTO `ilia_project`.`types_combined` (`id_machine_tool_classification`, `name`) VALUES ('4', 'Полуавтоматы');
INSERT INTO `ilia_project`.`types_combined` (`id_machine_tool_classification`, `name`) VALUES ('4', 'Автоматы');

CREATE TABLE `ilia_project`.`grinding_combined` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_types_grinding_combined` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `characteristics` VARCHAR(1000) NULL,
  `weight` VARCHAR(45) NULL,
  `power` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_types_grinding_combined`) REFERENCES `ilia_project`.`types_combined` (id),
  UNIQUE INDEX `id` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `ilia_project`.`grinding_combined` (`id_types_grinding_combined`, `name`, `characteristics`, `weight`, `power`) VALUES ('2', 'MULTIFORM 5020CNC', '-', '110', '6000');
INSERT INTO `ilia_project`.`grinding_combined` (`id_types_grinding_combined`, `name`, `characteristics`, `weight`, `power`) VALUES ('3', 'AGIE AGIECUT 120 EDM', 'максимум размер заготовки 810 х 580 х 250 мм, опорная поверхность 560 х 445 мм, перемещение Х 300 мм, Y 200 мм, Z 251 мм, вес заготовки макс. 200 кг', '3300', '2640');
INSERT INTO `ilia_project`.`grinding_combined` (`id_types_grinding_combined`, `name`, `characteristics`, `weight`, `power`) VALUES ('3', 'Agie HSS 150', '-', '3130', '10700');


CREATE TABLE `ilia_project`.`types_gear_working_and_thread_working` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_machine_tool_classification` INT NOT NULL,
  `name` VARCHAR(60) NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_machine_tool_classification`) REFERENCES `ilia_project`.`machine_tool_classification` (id),
  UNIQUE INDEX `id` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `ilia_project`.`types_gear_working_and_thread_working` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Круглошлифовальные');
INSERT INTO `ilia_project`.`types_gear_working_and_thread_working` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Внутришлифовальные');
INSERT INTO `ilia_project`.`types_gear_working_and_thread_working` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Обдирочно-шлифовальные');
INSERT INTO `ilia_project`.`types_gear_working_and_thread_working` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Специализированные шлифовальные');
INSERT INTO `ilia_project`.`types_gear_working_and_thread_working` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Заточные');
INSERT INTO `ilia_project`.`types_gear_working_and_thread_working` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Плоскошлифовальные с прямоугольным или круглым столом');
INSERT INTO `ilia_project`.`types_gear_working_and_thread_working` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Притирочные и полировальные');
INSERT INTO `ilia_project`.`types_gear_working_and_thread_working` (`id_machine_tool_classification`, `name`) VALUES ('3', 'Разные станки, работающие абразивным инструментом');

CREATE TABLE `ilia_project`.`gear_working_and_thread_working` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_types_gear_working_and_thread_working` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `characteristics` VARCHAR(1000) NULL,
  `weight` VARCHAR(45) NULL,
  `power` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_types_gear_working_and_thread_working`) REFERENCES `ilia_project`.`types_gear_working_and_thread_working` (id),
  UNIQUE INDEX `id` (`id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `ilia_project`.`gear_working_and_thread_working` (`id_types_gear_working_and_thread_working`, `name`, `characteristics`, `weight`, `power`) VALUES ('6', '5122В', 'Станки модели 5122в предназначены для нарезания цилиндрических зубчатых колес с прямыми и косыми зубъями внутреннего и наружного зацепления методом обкатки заготовки долбяком в условиях единичного и серийного', '4500', '3000');
INSERT INTO `ilia_project`.`gear_working_and_thread_working` (`id_types_gear_working_and_thread_working`, `name`, `characteristics`, `weight`, `power`) VALUES ('4', '5701', 'Станки модели 5701 предназначены для чистовой обработки (после зубофрезерования и снятия фасок на торцах зубьев) незакаленных прямозубовых и косозубовых', '1560', '350');
INSERT INTO `ilia_project`.`gear_working_and_thread_working` (`id_types_gear_working_and_thread_working`, `name`, `characteristics`, `weight`, `power`) VALUES ('8', '5851Ц', 'Станки модели 5851ц предназначены для шлифования эвольвентного профиля тяжелонагруженных прямозубых и косозубых цилиндрических колес наружного зацепления.', '5800', '750');
INSERT INTO `ilia_project`.`gear_working_and_thread_working` (`id_types_gear_working_and_thread_working`, `name`, `characteristics`, `weight`, `power`) VALUES ('2', 'К502', 'Станки модели к502 предназначены для нарезания резьбы на трубах и болтах', '320', '2000');
INSERT INTO `ilia_project`.`gear_working_and_thread_working` (`id_types_gear_working_and_thread_working`, `name`, `characteristics`, `weight`, `power`) VALUES ('6', 'КТ45', 'Станки модели кт45 предназначены для нарезания короткой внутренней и наружной цилиндрической резьбы. Применяется в условиях массового производства. Резьба нарезается специальными гребенчатыми фрезами ГОСТ 1336-62', '3200', '1300');
INSERT INTO `ilia_project`.`gear_working_and_thread_working` (`id_types_gear_working_and_thread_working`, `name`, `characteristics`, `weight`, `power`) VALUES ('7', '5822А', 'Станки модели 5822а предназначены для резьбошлифовальных операций в инструментальных цехах. Для шлифования Цилиндрических и конических резьбовых калибров-пробок и калибров-колец, точных винтов и червяков, затылование метчиков', '4500', '4500');