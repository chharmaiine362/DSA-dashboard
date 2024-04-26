FROM node

# Set the working directory inside the container
WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

# Set the execute permission for the entrypoint script
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]