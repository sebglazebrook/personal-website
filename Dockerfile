FROM kkarczmarczyk/node-yarn

WORKDIR /code

COPY package.json .

COPY yarn.lock .

RUN yarn install

COPY . /code/

RUN yarn run webpack -p
