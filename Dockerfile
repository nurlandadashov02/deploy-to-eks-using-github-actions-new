# Use latest node version 8.x
FROM node:alpine

# create app directory in container
RUN mkdir -p /app

# set /app directory as default working directory
WORKDIR /app

# only copy package.json initially so that `RUN yarn` layer is recreated only
# if there are changes in package.json
ADD package.json /app/

# --pure-lockfile: Don’t generate a yarn.lock lockfile
RUN npm install -f

# copy all file from current dir to /app in container
COPY . /app/

# expose port 4040
EXPOSE 4040

# cmd to start service
CMD [ "npm", "start" ]
