<?php

/**
 * @return stdClass
 */
function testNewRelic(): stdClass
{
    return newrelic_record_datastore_segment(
        function () {
            return new stdClass();
        },
        [
            'product'   => 'test',
            'operation' => 'http_get',
        ]
    );
}

testNewRelic();
