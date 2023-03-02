DROP TABLE IF EXISTS step, material
DROP TABLE IF EXISTS project_category
DROP TABLE IF EXISTS category
DROP TABLE IF EXISTS project

CREATE TABLE project (
	project_id INT AUTO_INCREMENT NOT NULL,
	project_name varchar(128) NOT NULL,
	estimated_hours decimal(7,2),
	actual_hours decimal(7,2),
	difficulty int,
	notes text,
	primary key (project_id)
);

CREATE TABLE category (
	category_id int  NOT NULL,
	category_name varchar(128) NOT NULL,
	primary key (category_id)
);

CREATE TABLE project_category (
	project_id INT NOT NULL,
	category_id INT NOT null,
	foreign key (project_id) references project (project_id),
	foreign key (category_id) references category (category_id),
	unique key (project_id, category_id)
);

CREATE TABLE material (
	material_id INT NOT NULL,
	project_id INT NOT NULL,
	material_name VARCHAR(128) NOT NULL,
	num_required int,
	cost DECIMAL(7, 2),
	primary key (material_id),
	foreign key (project_id) references project (project_id)
);

CREATE TABLE step (
	step_id INT  NOT NULL,
	project_id INT NOT NULL,
	step_order INT NOT NULL,
	step_text TEXT NOT null,
	primary key (step_id),
	foreign key (project_id) references project (project_id)
);