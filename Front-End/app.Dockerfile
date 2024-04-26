FROM node

# Set the working directory inside the container
WORKDIR /app

COPY . .

RUN npm install

RUN chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]