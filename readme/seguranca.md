### Autenticação na prática:

```ts
@requires: 'authenticated-user'
service PurchaseOrderManagementService {
    entity PurchaseOrderHeaders as projection on models.PurchaseOrderHeaders;
    entity PurchaseOrderItems as projection on models.PurchaseOrderItems;
}
```

```ts
//Uma outra maneira de restringir os acessos é através da anotação @readonly, com ela somos capazes de permitir o acesso de somente leitura, bloqueando todo o restante do CRUD:

@requires: 'authenticated-user'
service PurchaseOrderManagementService {

    @readonly entity PurchaseOrderHeaders as projection on models.PurchaseOrderHeaders;

    @readonly entity PurchaseOrderItems as projection on models.PurchaseOrderItems;
}
```

```ts
@requires: 'authenticated-user'
service PurchaseOrderManagementService {

    @readonly entity PurchaseOrderHeaders as projection on models.PurchaseOrderHeaders;

    @readonly entity PurchaseOrderItems as projection on models.PurchaseOrderItems;
}

@requires: 'ROLE_DUMMY_ADMIN'
service PurchaseOrderManagementAdminService {
    entity PurchaseOrderHeaders as projection on models.PurchaseOrderHeaders;
    entity PurchaseOrderItems   as projection on models.PurchaseOrderItems;
}

```

```ts
@requires: 'authenticated-user'
service PurchaseOrderManagementService {
    // Se quisermos, por exemplo, restringir o acesso de CRUD completo somente para nosso usuário ROLE_DUMMY_ADMIN, podemos fazer o seguinte:
    @(restrict: [{ grant: ['READ', 'CREATE', 'UPDATE', 'DELETE'], to: 'ROLE_DUMMY_ADMIN' }])
    entity PurchaseOrderHeaders as projection on models.PurchaseOrderHeaders;

    //Se quisermos, por exemplo, restringir o acesso de CRUD completo, menos leitura, somente para nosso usuário ROLE_DUMMY_ADMIN, podemos fazer o seguinte:
    @(restrict: [{ grant: ['CREATE', 'UPDATE', 'DELETE'], to: 'ROLE_DUMMY_ADMIN' }])
    entity PurchaseOrderItems as projection on models.PurchaseOrderItems;
}
```

### Exercícios Teoricos:

`1) Explique a diferença entre autenticação e autorização no contexto do SAP CAP`
- A autenticação e a autorização são dois conceitos distintos, mas complementares.
- A autenticação refere-se ao processo de verificar a identidade de um usuário ou sistema. (quem você é)
- A autorização refere-se ao processo de determinar quais recursos ou funcionalidades um usuário autenticado tem permissão para acessar e quais operações ele pode realizar nesses recursos. (o que você pode fazer)
- 

`2)Descreva o papel do arquivo .cdsrc.json na configuração de segurança de um aplicativo CAP.`
- `.cdsrc.json` permite uma rápida implementação de mecanismos de segurança em um ambiente de desenvolvimento local.

`3) O que significa uma role no contexto de segurança de um aplicativo? Dê um exemplo.`
- Roles são usadas para definir o que diferentes tipos de usuários podem fazer dentro do aplicativo. 
- Ex: Usando o exemplo do nosso código, é de se imaginar que o historico das ordesn de compras, não seja um dado que qualquer usuarios possa acessar. Então vamos definir uma role para um administrador, `ROLE_DUMMY_ADMIN`. Dessa forma temos um campo no nosso usaurio para fazer uma verificação quando algum usuario fazer a requisição de listagem das ordens de compra, se esse usuario não possuir a role em questão, o acesso sera negado.

`4) Explique como a anotação @requires funciona para restringir o acesso em um serviço no SAP CAP.`
- Se quisermos restringir, por exemplo, que nosso serviço seja acessível somente por usuários que estejam logados, anotamos nosso serviço com  `@requires: 'authenticated-user'`

`5) Qual é o propósito da anotação @restrict e como ela difere de @requires?`
- Essa annotation nos permite entrar um pouco mais no detalhe de como queremos exibir determinado recurso ou entidade. Por exemplo, podemos, restringir o acesso de CRUD completo somente para nosso usuário ROLE_DUMMY_ADMIN