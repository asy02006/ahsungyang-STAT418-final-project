# Flask-Api

This is a flask API that returns prediction for direction of share price return (pos/neg) of Apple Inc. stock using a Naive Bayes Classifier. The model is built based on NY Times Articles (abstract) on Apple Inc. and corresponding directions of daily share price returns from Jan. 1, 2014 to Apr. 30, 2019.

**1. Open a terminal, change directory to the "docker" folder, and run:**

`docker-compose up`

If it has created the localhost server correctly, you will see the following lines:

Recreating docker_flask_1 ... done  
Attaching to docker_flask_1  
flask_1  |  * Serving Flask app "server" (lazy loading)  
flask_1  |  * Environment: production  
flask_1  |    WARNING: Do not use the development server in a production environment.  
flask_1  |    Use a production WSGI server instead.  
flask_1  |  * Debug mode: on  
flask_1  |  * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)  
flask_1  |  * Restarting with stat  
flask_1  |  * Debugger is active!  
flask_1  |  * Debugger PIN: [Debugger PIN]  

**2. Open a new terminal and run the following command to confirm that the server is up**

`curl http://localhost:5000/`

If the server is running, you will get the following output: 

server is up - nice job!  

**3. Then use the following command to get prediction. Change the values of predictor (text) and run the command in a terminal to get the corresponding prediction for share price direction.** 

`curl -H "Content-Type: application/json" -X POST -d '{"text":"we pressure women lawyers worth"}' "http://localhost:5000/predict_price"`

If it is successfully run, you will get the following output: 

{  
"predict response": "neg"
}  

**4. Both of the curl commands can be found in the file `curl_test.sh`.** 

**5. To stop running the API, type `ctrl-C`.** 

**6. Check to see if there is any docker container running using  `docker container ls` and stop them running  `docker container kill <container-name>`.** 
