# Big Data - Zeppelin

[Back](../index.md)

- [Big Data - Zeppelin](#big-data---zeppelin)
  - [Zeppelin Notebook](#zeppelin-notebook)
  - [Dynamic form](#dynamic-form)

---

## Zeppelin Notebook

- `Zeppelin Notebook`

  - A Tool That uses Spark
  - Goto: http://localhost:9995

- specify interpreter:
  - `%<interpreter_name>`

| Interpreter | Syntax |
| ----------- | ------ |
| Markdown    | `%md`  |

---

## Dynamic form

- rel: https://zeppelin.apache.org/docs/0.8.0/usage/dynamic_form/intro.html#creates-programmatically-scope-paragraph

- Syntax:

  - `${form_name}`

- **Default value**:
  - `${formName=defaultValue}`

```md
%md Hello ${name=sun}
```

- **Select form**:
  - `${formName=defaultValue,option1|option2...}`

```md
%md This is ${day=mon, mon|tue|wed|thu|fri|sat|sun}
```

---

[TOP](#big-data---zeppelin)
