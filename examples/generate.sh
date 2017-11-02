#/bin/bash

node ../granite-css-modularizer.js ./src/node_modules/bootstrap/dist/css ./target/granite-bootstrap

node ../granite-css-modularizer.js ./src/node_modules/font-awesome/css ./target/granite-font-awesome

node ../granite-css-modularizer.js ./src/node_modules/prismjs/themes ./target/granite-prismjs