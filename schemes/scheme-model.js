const db = require('../data/dbConfig');

const find = () => {
	return db('schemes');
};

const findById = (id) => {
	return db('schemes').where({ id }).first();
};

const findSteps = (id) => {
	return db('steps as st')
		.join('schemes as sc', 'sc.id', 'st.scheme_id')
		.select('st.id', 'sc.scheme_name', 'st.step_number', 'st.instructions')
		.where({ scheme_id: id })
		.orderBy('step_number');
};

const add = async (scheme) => {
	const id = await db('schemes').insert(scheme);
	return await findById(id);
};

const update = async (changes, id) => {
	const res = await db('schemes').where({ id }).update(changes);
	return findById(id);
};

const remove = async (id) => {
	const response = await findById(id);
	await db('schemes').where({ id }).del();
	return response;
};

const addStep = async (step, scheme_id) => {
	const id = await db('steps').insert({ ...step, scheme_id });
	return await db('steps').where({ id }).first();
};

module.exports = {
	find,
	findById,
	findSteps,
	add,
	update,
	remove,
	addStep,
};
