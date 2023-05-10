const {
    tables
} = require('..');

module.exports = {
    up: async (knex) => {
        await knex.schema.createTable(tables.dog, (table) => {
            table.uuid('id')
                .primary();
            table.string('name', 255)
                .notNullable();
            table.string('breed', 255)
                .notNullable();
            table.string('sex', 255)
                .notNullable();
            table.string('dateOfBirth', 255)
                .notNullable();
            table.string('image', 255)
                .notNullable();
            table.string('color', 255)
                .notNullable();
        });
    },
    down: (knex) => {
        return knex.schema.dropTableIfExists(tables.dog);
    },
};