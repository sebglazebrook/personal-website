FROM kkarczmarczyk/node-yarn

RUN apt-get update && apt-get install --yes nginx

WORKDIR /code

COPY package.json .

COPY yarn.lock .

RUN yarn install

COPY . /code/

RUN yarn run webpack -p

COPY config/etc/nginx/sites-enabled/default /etc/nginx/sites-enabled/default
COPY config/etc/nginx/nginx.conf /etc/nginx/nginx.conf

CMD nginx
