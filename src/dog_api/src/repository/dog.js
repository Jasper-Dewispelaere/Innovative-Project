const { tables, getKnex } = require('../data/index');

const findAll = () => {
	return getKnex()(tables.dog)
		.select()
		.orderBy('name', 'ASC');
};

const findById = (id) => {
	return getKnex()(tables.dog)
		.where('id', id)
		.first();
};

const create = async ({
	name,
	breed,
	sex,
	dateOfBirth,
	image,
	color,
}) => {
	try {
		const [id] = await getKnex()(tables.dog)
			.insert({
				name,
				breed,
				sex,
				dateOfBirth: dateOfBirth.toISOString(),
				image,
				color
			});

		return id;
	} catch (error) {
		const logger = getLogger();
		logger.error('Error in create', {
			error,
		});
		throw error;
	}
};

const updateById = async (id, {
	name,
	breed,
	sex,
	dateOfBirth,
	image,
	color,
}) => {
	try {
		await getKnex()(tables.dog)
			.update({
				name,
				breed,
				sex,
				dateOfBirth: dateOfBirth.toISOString(),
				image,
				color,
			})
			.where('id', id);

		return id;
	} catch (error) {
		const logger = getLogger();
		logger.error('Error in updateById', {
			error,
		});
		throw error;
	}
};

const deleteById = async (id) => {
	try {
		const rowsAffected = await getKnex()(tables.dog)
			.delete()
			.where('id', id);

		return rowsAffected > 0;
	} catch (error) {
		const logger = getLogger();
		logger.error('Error in deleteById', {
			error,
		});
		throw error;
	}
};

module.exports = {
	findAll,
	findById,
	create,
	updateById,
	deleteById,
};