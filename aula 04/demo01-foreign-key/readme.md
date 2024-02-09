### users

| id | name             | cpf       |
|----|------------------|-----------|
| 1  | Jonathan Ribeiro | 123456789 |
| 2  | Maria Ribeiro    | 987654321 |

## 1:1

### login

| id | user_id | email              | password |
|----|---------|--------------------|----------|
| 1  | 1       | jonathan@teste.com | 123      |
| 2  | 2       | maria@teste.com    | 321      |

## 1:N

### address

| id | user_id | name | cep | state | city        | street | number |
|----|---------|------|-----|-------|-------------|--------|--------|
| 1  | 1       | home | 123 | SC    | baln. camb. | a      | 123    |
| 2  | 1       | work | 321 | SP    | mauá        | b      | 321    |
| 3  | 2       | ap   | 999 | AC    | acrelandia  | c      | 456    |


## N:N

### skills
| id | name       |
|----|------------|
| 1  | sql        |
| 2  | javascript |
| 3  | html       |
| 4  | css        |

### users_skills
| id | user_id | skill_id |
|----|---------|----------|
| 1  | 1       | 1        |
| 2  | 1       | 2        |
| 3  | 1       | 3        |
| 4  | 1       | 4        |
| 5  | 2       | 3        |
| 8  | 2       | 4        |