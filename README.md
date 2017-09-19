This is to reproduce the issue reported at [New function added in 7.5.0.199 does not work](https://discuss.newrelic.com/t/new-function-added-in-7-5-0-199-does-not-work/51963):

> Function newrelic_record_datastore_segment() was introduced since 7.5.0.199. It seems that this function may not work for first few HTTP calls after a web server is started, although it does work smoothly for rest HTTP calls.
> 
> Also, this function probably not work under CLI, which is not documented [here](https://docs.newrelic.com/docs/agents/php-agent/php-agent-api/newrelic_record_datastore_segment).

# How To Reproduce It

```bash
# please provide a valid New Relic key here:
NEWRELIC_KEY=please_provide_a_valid_new_relic_key_here
docker build --build-arg NEWRELIC_KEY=$NEWRELIC_KEY -t deminy/test_newrelic -f Dockerfile .
docker run -it --rm --name web -p 80:80 deminy/test_newrelic
#
# Now in a 2nd terminal please run following command multiple times.
# The first response should return responses like
#     Fatal error:  Uncaught TypeError: Return value of testNewRelic() must be an instance of stdClass,
#     boolean returned in /var/www/html/index.php:13
# The rest curl calls should pass if you have a valid New Relic key specified when building the image.
curl -vi http://192.168.99.100
```
