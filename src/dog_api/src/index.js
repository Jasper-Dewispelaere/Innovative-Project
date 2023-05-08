app.use(async (ctx, next) => {
	logger.info(JSON.stringify(ctx.request));
	ctx.body = 'Goodbye world';
	next();
});