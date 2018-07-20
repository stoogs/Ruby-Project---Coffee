DROP TABLE recipe;


CREATE TABLE recipes (
    id SERIAL8 PRIMARY KEY,
    name VARCHAR(255),
    brew_method VARCHAR(255),
    grams INT2,
    water_temperature INT2,
    water_weight INT2,
    grind VARCHAR(255),
    pre_infuse INT2,
    brew_time INT2,
    ratio INT2 
);

CREATE TABLE patrons (
    id SERIAL8 PRIMARY KEY,
    username VARCHAR(255),
    personal_bio VARCHAR(255)
);

CREATE TABLE reviews (
    id SERIAL8 PRIMARY KEY,
    review_title VARCHAR(255),
    bean_rating INT2,
    comments VARCHAR(255),
    review_id INT8 REFERENCES recipes(id),
    patron_id INT8 REFERENCES patrons(id) 
);

