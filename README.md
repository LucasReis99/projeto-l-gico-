# E-commerce Database Project

## Descrição do Desafio
Este projeto tem como objetivo replicar a modelagem de um banco de dados lógico para o cenário de e-commerce, utilizando MySQL. O foco está na criação de um esquema que atenda aos requisitos de chaves primárias, chaves estrangeiras e constraints, além de refletir os relacionamentos definidos no modelo Entidade-Relacionamento Estendido (EER).

### Objetivo
Clientes PJ e PF: A modelagem considera que uma conta pode ser Pessoa Jurídica (PJ) ou Pessoa Física (PF), mas não ambas.
Pagamentos: Permite o cadastro de mais de uma forma de pagamento.
Pedidos: Inclui o status do pedido e o código de rastreio para acompanhar a entrega.
A modelagem lógica foi refinada com base nos conceitos de modelagem conceitual, assegurando um esquema robusto e eficiente para o cenário de e-commerce.

### Estrutura do Projeto
As principais tabelas e suas funcionalidades são:

#### clients: Armazena informações de clientes, seja PJ ou PF, incluindo CPF/CNPJ e endereço.
#### product: Contém dados dos produtos, como nome, categoria e avaliação.
#### orders: Registra os pedidos feitos por clientes, com status e descrição.
#### payments: Controla os métodos de pagamento utilizados, permitindo múltiplas formas por cliente.
#### productStorage: Gerencia a quantidade de produtos em estoque e suas localizações.
#### supplier: Mantém o cadastro de fornecedores com CNPJ e contatos.
#### seller: Armazena os vendedores ou terceiros que disponibilizam produtos na plataforma.
#### productSeller: Faz a associação entre os produtos e seus respectivos vendedores.
#### productOrder: Relaciona os produtos com os pedidos feitos.
#### productSupplier: Liga os fornecedores aos produtos fornecidos.

## Queries Implementadas
Foram desenvolvidas consultas SQL para explorar os dados inseridos no banco de dados. Entre as cláusulas e consultas utilizadas estão:

#### SELECT: Recuperações simples de dados.
#### WHERE: Aplicação de filtros para consultas específicas.
#### ORDER BY: Definição de ordenações para a apresentação dos resultados.
#### HAVING: Aplicação de condições sobre grupos de dados.
#### JOIN: Criação de junções para fornecer uma visão mais ampla dos relacionamentos entre tabelas.

### Algumas perguntas respondidas pelas consultas:

Quantos pedidos foram feitos por cada cliente?
Existe algum vendedor que também é fornecedor?
Qual a relação entre produtos, fornecedores e estoques?
Qual a relação entre os nomes dos fornecedores e os produtos que fornecem?
