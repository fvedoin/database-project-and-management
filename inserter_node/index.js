const db = require('./database/connection');
/*
insertLastReceived(require('./files/csvjson1.json'));
insertLastReceived(require('./files/csvjson2.json'));
insertLastReceived(require('./files/csvjson3.json'));
insertLastReceived(require('./files/csvjson4.json'));
insertLastReceived(require('./files/csvjson5.json'));
insertLastReceived(require('./files/csvjson6.json'));
insertLastReceived(require('./files/csvjson7.json'));
insertLastReceived(require('./files/csvjson8.json'));
insertLastReceived(require('./files/csvjson9.json'));
insertLastReceived(require('./files/csvjson10.json'));
insertLastReceived(require('./files/csvjson11.json'));
insertLastReceived(require('./files/csvjson12.json'));
insertLastReceived(require('./files/csvjson13.json'));
insertLastReceived(require('./files/csvjson14.json'));
insertLastReceived(require('./files/csvjson15.json'));
insertLastReceived(require('./files/csvjson16.json'));
insertLastReceived(require('./files/csvjson17.json'));
insertLastReceived(require('./files/csvjson18.json'));
insertLastReceived(require('./files/csvjson19.json'));

var i = 1;
async function insertLastReceived(data) {
    for await (item of data) {
        if (i === 50)
            i = 1;
        var inserted = await db('dados_recebidos').insert({
            numero_de_serie: i,
            recebido_em: new Date(item.Time),
            etc: item.etc,
            ia: item.ia,
            ib: item.ib,
            ic: item.ic,
            pa: item.pa,
            pb: item.pb,
            pc: item.pc,
            va: item.va,
            vb: item.vb,
            vc: item.vc
        });
        i++;
        console.log('registro inserido');
    }
}
*/
insertUsers(require('./files/users.json'));

async function insertUsers(data) {
    return inserted = await db('funcionario').insert(data);
}
/*
insertClient(require('./files/clients.json'));

async function insertClient(data) {
    return await db('cliente').insert(data);
}

insertModel(require('./files/models.json'));

async function insertModel(data) {
    return await db('modelo').insert(data);
}

insertUser(require('./files/users.json'));

async function insertUser(data) {
    return await db('funcionario').insert(data);
}

insertGateway(require('./files/gateways.json'));

async function insertGateway(data) {
    return await db('gateway').insert(data);
}

insertMeter(require('./files/meters.json'));

async function insertMeter(data) {
    return await db('medidor').insert(data);
}
*/

return;