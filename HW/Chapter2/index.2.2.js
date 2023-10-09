const fs = require('fs');
const util = require('util');
const path = require('path');
const { createDiffieHellmanGroup } = require('crypto');

const readdir = util.promisify(fs.readdir);
const stat = util.promisify(fs.stat);
const extname = util.promisify(path.extname);
const join = util.promisify(path.join);

const filename = 'HW/Chapter2/test';

const directoryJSSearch = async filename => {
  try {
    await readdir(filename, function(err, fileList) {
      for(i=0; i < fileList.length; i++){
        stat(fileList[i], (err, stats) =>{
          if (stats.isDirectory()){
            console.log("a");
          }
          
        });
        
      }
    });
  } catch (err) {
    console.error(err);
  }
};

directoryJSSearch(filename);

