let { DOGS } = require('../data/mock-data');
const dogRepository = require('../repository/dog');

const getAll = async () => {
	debugLog('Fetching all dogs');
	const items = await dogRepository.findAll();
	return { items };
};

const getById = (id) => {
	debugLog(`Fetching dog with id ${id}`);
	return dogRepository.findById(id);
  };

const create = ({ name, breed, sex, dateOfBirth, image, color }) => {
	let existingDog;
	if (dogId) {
		existingDog = DOGS.find((dog) => dog.id === dogId);

		if (!existingDog) {
			getLogger().error(`There is no dog with id ${id}.`, { id });
		}
	}
	const maxId = Math.max(...DOGS.map(i => i.id));
	const newDog = {
		id: maxId + 1,
		name,
		breed,
		sex,
		dateOfBirth: dateOfBirth.toISOString(),
		image,
		color
	};
	DOGS = [...DOGS, newDog];
	return newDog;
}
const updateById = (id, { name, breed, sex, dateOfBirth, image, color }) => {
	throw new Error("not implemented yet");
}
const deleteById = (id) => {
	throw new Error("not implemented yet");
}

module.exports = {
	getAll,
	getById,
	create,
	updateById,
	deleteById,
}