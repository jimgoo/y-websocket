#FROM node:12-alpine
FROM jupyter/base-notebook:python-3.8.8

## No commands work in k8s due to "exec format error"
# RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
# WORKDIR /home/node/app
# COPY package*.json ./
# USER node
# RUN npm install
# COPY --chown=node:node . .
# EXPOSE 1234
# CMD [ "npm", "start" ]

USER ${NB_UID}

# COPY package*.json ./
COPY package.json ./
RUN fix-permissions "./package.json"
# RUN fix-permissions "./package-lock.json"

RUN mamba install -c conda-forge -y nodejs && \
    npm install && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# COPY --chown=node:node . .
COPY . .
RUN fix-permissions "./"

EXPOSE 1234
CMD [ "npm", "start" ]
