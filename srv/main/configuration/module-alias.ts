// Dentro deste arquivo vamos dizer que sempre que utilizarmos no import o caracter @, ele deverá referenciar a pasta srv como base:
import moduleAlias from 'module-alias';
import { join } from 'path';

moduleAlias.addAlias('@', join(__dirname, '..', '..'));

//Após a configuração, vamos importar esta configuração em todos os serviços.ts
//  import { db } from '../../common/entities/db/models';