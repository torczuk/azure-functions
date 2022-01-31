module.exports = function(context, req) {
    context.log('HealthCheck ...', req.originalUrl);
    context.res = {
        status: 200,
        body: "it works"
    };
    context.done();
};