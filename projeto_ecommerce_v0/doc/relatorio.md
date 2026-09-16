# 📋 Homologação em Par — Teste Cruzado (Flutter)

**Projeto avaliado:** ‹projeto_ecommerce_v0 / repositório: https://github.com/BrunoRprogm/Flutter_aulas›
**Dupla autora:** ‹Gustavo› e ‹Bruno›
**Dupla avaliadora:** ‹Gustavo› e ‹Bruno›
**Data:** ‹10/09/2026›

> Rode o projeto da outra dupla e anote abaixo os **bugs** que encontrar durante o uso e as **práticas ruins** que notar no código.

---

## 🐞 Bugs encontrados

_(o que quebra ou não funciona ao usar o app — descreva o problema e, se possível, como reproduzir)_

- Filtro de produtos não está funcionando
- Falta fazer o filtro por marcas(brands) de produtos

---

## ⚠️ Práticas ruins de codificação

_(o que está mal feito no código — ex.: tudo em um arquivo só, nomes confusos, código duplicado, sem tratamento de erro, warnings no `flutter analyze`)_

## Tela Login:
# Page:

# Controller:
- apagar prints do código
- Você montou uma classe dentro da controller o que não é o ideal, o ideal seria vc criar uma camada model e dai sim criar o seu modelo de Usuário (User)

## Tela Signup:
# Page:
- método de Back-End na tela do front-end.
- método está fora do gerenciamento de estado atual (está usando o setState, utilizar o changeNotifier)
# Controller:
- classe escrita em pascalCase o correto é CamelCase
- print(apagar!)
- validateSenha está como um String? mas não retorna nada, poderia ser um void

## Tela Recover:
# Controller:
- na logica do changeActiveButton acredito que seria melhor vc somente retornar a negação do botão !isActiveButton e separar essa lógica do email em outro método.

# Page:
- está fora de padrão de gerenciamento de estado (changeNotifier)

## 👁️‍🗨️ Observações 
- # Tela Login:
- A senha do login não contem validação de caracteres.

- # Tela Signup:
- O botão de continuar não está bloqueando quando os campos estão vazios e o checkbox desmarcado.
- O botão 'Entrar' está sem a animação de carregamento (loading)
- Quando imputado um login de um usuário inexistente o sistema não mostra o pop-up embaixo da tela de senha ou email inválidos.

- # Tela Principal (Home):
- Implementar carrossel e carrinho.

- # Tela Produtos por Categoria: 
- Implementar os filtros