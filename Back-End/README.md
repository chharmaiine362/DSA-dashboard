# File Structure
docker-compose.yml - Specifies the images required for Docker Compose, the ports they need to expose, whether they have access to the host filesystem, what commands should be run when they start up etc.

model.py - Coding file containing the model built for the platform. The main script calls the get_prices() function to retrieve the price data, and then calls fit_predict_insert(data) to fit the linear regression model, insert the predicted prices, and generate the 'data.json' file containing the historical and predicted prices for each attraction and category.

Dockerfile - A text document containing all the commands the user requires to call on the command line to assemble an image.