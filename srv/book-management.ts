import cds, { Request } from '@sap/cds';

export class BookManagementService extends cds.ApplicationService {
    constructor(){
        super();
        this.before('READ', 'Books', (request) => this.beforeReadBooks)
    }

    public async beforeReadBooks(request: Request): Promise<void> {
        const books = await cds
        .read('Books')
        .columns('title', 'publishedYear', 'author')
        .where('publishedYear', '>=', 2000)
        .orderBy('publishedYear', 'title');
        console.log(books)
    }
 }
