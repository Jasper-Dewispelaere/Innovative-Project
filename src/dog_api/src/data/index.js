const config = require('config');
const knex = require('knex');
const { getLogger } = require('../core/logging');

const NODE_ENV = config.get('env');
const isDevelopment = NODE_ENV === 'development';

const DATABASE_CLIENT = config.get('database.client');
const DATABASE_NAME = config.get('database.name');
const DATABASE_HOST = config.get('database.host');
const DATABASE_PORT = config.get('database.port');

let knexInstance;

async function initializeData() {
	const knexOptions = {
		client: DATABASE_CLIENT,
		connection: {
			host: DATABASE_HOST,
			port: DATABASE_PORT,
			database: DATABASE_NAME,
		},
		migrations: {
			tableName: 'knex_meta',
			directory: join('src', 'data', 'migrations'),
		},
		seeds: {
			directory: join('src', 'data', 'seeds'),
		},
	};
	knexInstance = knex(knexOptions);

	const logger = getLogger();

	try {
		await knexInstance.raw('SELECT 1+1 AS result');
	} catch (error) {
		logger.error(error.message, { error });
		throw new Error('Could not initialize the data layer');
	}

	// Run migrations
	let migrationsFailed = true;
	try {
	  await knexInstance.migrate.latest();
	  migrationsFailed = false;
	} catch (error) {
	  logger.error('Error while migrating the database', {
		error,
	  });
	  throw error;
	}
  
	// Run seeds in development
	if (isDevelopment) {
	  try {
		await knexInstance.seed.run();
	  } catch (error) {
		logger.error('Error while seeding database', {
		  error,
		});
	  }
	}

	return knexInstance;
}

function getKnex() {
	if (!knexInstance) throw new Error('Please initialize the data layer before getting the Knex instance');
	return knexInstance;
}

const tables = Object.freeze({
	dog: 'dogs'
});

module.exports = {
	initializeData,
	getKnex,
};