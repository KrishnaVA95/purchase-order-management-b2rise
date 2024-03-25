using { db } from '../db/book';

service BookManagement {
    //ordene os livros por publishedYear em ordem decrescente e, em seguida, por title em ordem ascendente.
    entity Books as projection on db.Books order by publishedYear DESC, title ASC;
    entity TestBooks as select title, publishedYear, author  from db.Books where publishedYear >= 2000;
    entity Books1990 as select title, author from db.Books where publishedYear < 1990
}
