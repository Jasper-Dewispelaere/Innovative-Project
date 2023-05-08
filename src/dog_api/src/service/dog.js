let { DOGS } = require('../data/mock-data');
const getAll = () => {
	return { items: DOGS, count: DOGS.length };
}	

const getById = (id) => {  throw new Error("not implemented yet"); }
const create = ({name, breed, sex, dateOfBirth, image, color}) => {
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
const updateById = (id, {name, breed, sex, dateOfBirth, image, color}) => {
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