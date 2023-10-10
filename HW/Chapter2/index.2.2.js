process.chdir(__dirname);

const fs = require('fs');
const util = require('util');
const path = require('path');
const { createDiffieHellmanGroup } = require('crypto');

const readdir = util.promisify(fs.readdir);
const stat = util.promisify(fs.stat);
const extname = util.promisify(path.extname);
const join = util.promisify(path.join);

const filename = './test';

const directoryJSSearch = async filename => {
  try {
    await readdir(filename, function(err, fileList) {
      fileList.forEach(async file => {
        const ansPath = path.join(filename, file);
        const Stat = await stat(ansPath);
        if (Stat.isDirectory()) {
          await directoryJSSearch(ansPath);
        } else if (path.extname(ansPath) === '.js') {
          console.log(ansPath);
        }
      });
    });
  } catch (err) {
    console.error(err);
  }
};

directoryJSSearch(filename);

