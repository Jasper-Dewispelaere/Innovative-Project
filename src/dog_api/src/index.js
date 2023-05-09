const Koa = require('koa');
const Router = require('@koa/router');
const dogService = require('./service/dog');
const { initializeData } = require('./data');

async function main() {
    try {
      const server = await createServer();
      await server.start();
  
      async function onClose() {
        await server.stop();
        process.exit(0);
      }

  
      process.on('SIGTERM', onClose);
      process.on('SIGQUIT', onClose);
    } catch (error){
      process.exit(-1);
    }
  }
  
  main();


// async function main() {
// 	// logger initialiseren

// 	await initializeData();

// 	// andere code
// }

// main();

// router.get('/api/dogs', async (ctx) => {
//     logger.info(JSON.stringify(ctx.request));
//     ctx.body = dogService.getAll();
// })

// router.post('/api/dogs', async (ctx) => {
//     const newDog = dogService.create({
//         ...ctx.request.body, dateOfBirth: new Date(ctx.request.body.date)
//     });
//     ctx.body = newDog;
// })

// router.get('/api/dogs/:id', async (ctx) => {
// 	ctx.body = dogService.getById(ctx.params.id);
// })

// app
//     .use(router.routes())
//     .use(router.allowedMethods());