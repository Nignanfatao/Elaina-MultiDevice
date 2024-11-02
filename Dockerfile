FROM node:lts-buster

RUN apt-get update && \
    apt-get install -y ffmpeg imagemagick webp && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Nignanfatao/Elaina-MultiDevice
WORKDIR /usr/src/app
COPY package.json 
RUN npm i

COPY . .

# Expose the required port
EXPOSE 5000

# Command to run the application
CMD ["node", "index.js"]
