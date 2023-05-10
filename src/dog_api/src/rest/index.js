const Router = require('@koa/router');
const installDogRouter = require('./_dog');

module.exports = (app) => {
    const router = new Router({
        prefix: '/api',
    });


    installCategorieRouter(router);

    app.use(router.routes()).use(router.allowedMethods());
};