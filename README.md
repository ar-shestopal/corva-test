* Description

Your task is to build a POST web service that accepts a JSON value, computes and returns a result. Deliver the final endpoint for testing.

Endpoint: http://XXX/compute/<request_id>

Input POST Value:
````
{
    “timestamp”: 1493758596,
    “data”: [
        { “title”: “Part 1”, “values”: [0, 3, 5, 6, 2, 9] },
        { “title”: “Part 2”, “values”: [6, 3, 1, 3, 9, 4] }
    ]
}
````

The service shall take the array from Part 1 and subtract the values from Part 2, subtracting numbers that exist in the same index of the array. The final array is also the same size (6).

The return value will be a JSON document in the following format containing the resultant array and request ID.

Output:
```
{
    “request_id”: “<request_id>”,
    “timestamp”: 1493758596,
    “result”: { “title”: “Result”, “values”: […] }
}
```

* Ruby version 

    2.5.3
    
* Local setup
    
    `rails db:setup`
    
    `rails s`    

* How to run the test suite
    
    `rspec`

* Test deployed application
    
    run `ruby test_slient.rb`
    
    It will send request to  application deployed on Heroku
    
    Example: 
    ```corva-test (master) $ ruby test_client.rb 
     "{\"request_id\":\"123456\",\"timestamp\":1493758596,\"title\":\"Result\",\"result\":[-6,0,4,3,-7,5]}"
     ```
    

* Deployed

    `https://warm-waters-43210.herokuapp.com/`
