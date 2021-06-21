var shell = require('shelljs');

shell.echo('execution server');
shell.exec('cd neoFoodFactory/server && yarn start');