FROM node:18-alpine

# environment variables
ENV NODE_ENV=production
ENV PORT=3001

WORKDIR /usr/src/app

# copy files to WORKDIR and install dependencies
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .

# expose port
EXPOSE ${PORT}

# change ownership of WORKDIR and run as node (user)
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]
