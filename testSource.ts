import * as fg from 'fast-glob';

fg(['a.*', 'b.txt', 'c.txt']).then(console.log);
