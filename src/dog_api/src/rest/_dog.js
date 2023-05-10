const Joi = require('joi');
const Router = require('@koa/router');

const dogService = require('../service/dog');

const getAllDog = async(ctx) => {
    const dogs = await dogService.getAll(ctx.state.session);
    ctx.body = dogs;
};


const getDogEnSdg = async(ctx) => {
    const dogs = await dogService.getCatEnSdg(ctx.state.session);
    ctx.body = dogs;
};

module.exports = function installUsersRoutes(app) {
    const router = new Router({
        prefix: '/dog',
    });

    router.get('/',  getAllDog);
    router.get('/sdg/',  getDogEnSdg);

    app
        .use(router.routes())
        .use(router.allowedMethods());
};