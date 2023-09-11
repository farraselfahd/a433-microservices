# using image from node 14
FROM node:14

# create working dir in /app
WORKDIR /app

# copy files from root dir to working dir
COPY . .

# define environment var 
ENV NODE_ENV=production DB_HOST=item-db

# install dependencies and build app
RUN npm install --production --unsafe-perm && npm run build

# run app from start script
CMD [ "npm", "start" ]   

# expose port 8080
EXPOSE 8080