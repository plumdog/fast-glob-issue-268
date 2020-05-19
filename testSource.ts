import * as fg from 'fast-glob';

fg(['a.*', 'b.txt', 'c.txt']).then((results: Array<string>) => {
    console.log(JSON.stringify(results));
    if (results.length === 3) {
        console.log('GOOD: found 3 files');
    } else {
        console.log(`BAD: found ${results.length} files`);
    }
});
