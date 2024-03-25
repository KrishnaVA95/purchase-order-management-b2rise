using { managed } from '@sap/cds/common';

// Um namespace em programação é uma forma de organizar e agrupar elementos relacionados, como classes, funções, variáveis, etc., sob um único nome. Ele serve para evitar conflitos de nomes entre diferentes partes do código, já que cada elemento pertencente a um namespace é acessado com um prefixo que o identifica.
namespace db;
// a função do namespace db neste código é fornecer um escopo para a entidade Books e quaisquer outras entidades relacionadas ao banco de dados que podem ser definidas dentro deste namespace. Isso ajuda a organizar e manter uma estrutura mais clara em seu código, especialmente quando há muitas entidades ou outras construções relacionadas ao banco de dados sendo definidas.

entity Books: managed {
    key id: UUID;
        title: String(100);
        author: String(100);
        publishedYear: Integer;
}