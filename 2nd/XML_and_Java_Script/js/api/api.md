# JS - API

[Back](../../index.md)

- [JS - API](#js---api)
  - [API](#api)
  - [API Authentication](#api-authentication)
  - [Example: Spotify - Promise](#example-spotify---promise)
  - [Example: Spotify - Async](#example-spotify---async)

---

## API

- `API` stands for `Application Programming Interface`.

  - In the context of APIs, the word Application refers to any software with a distinct function.

- Interface can be thought of as a **contract of service** between two applications.
  - This contract defines how the two communicate with each other using requests and responses

---

## API Authentication

- `API authentication`

  - the processes of **certifying the identity of users** trying to access resources on the server.
  - `Authentication` is when an entity **verifies the identity** of a user. In other words, it proves that the clients trying to access a remote server are really who they say they are.
  - `Authorization` is the approval that a certain client **has the right** to make a request.

- Most common authentication methods

  - `HTTP Basic Authentication`

    - combines username and password to form a single value and passes it through a special HTTP header known as authorization where they are encoded with Base64.

  - `API Key Authentication`.

    - The API key is usually a long series of numbers and letters that you either include in the request header or request URL

  - `OAuth Authentication`

    - is a form of API authentication that gives applications with the ability to communicate with API server to provide access. When a user logs into the system, it requests authentication in the form of a token. The client is required to forward the request to an authentication server, which either allows or rejects this it.

---

## Example: Spotify - Promise

```js
const tokenUrl = "https://accounts.spotify.com/api/token";
const clientId = "910e59ec1184482d8932ab9e1bc3ff8d";
const clientSecret = "02f3d3633013444f86f33305092dcfb5";

/**
 * Promise
 */
fetch(tokenUrl, {
  method: "POST",
  headers: {
    "Content-Type": "application/x-www-form-urlencoded",
    Authorization: "Basic " + btoa(clientId + ":" + clientSecret),
  },
  body: "grant_type=client_credentials",
})
  .then((response) => response.json())
  .then((jsonData) => jsonData.access_token)
  .then((data) => console.log("Promise\t", data));
```

---

## Example: Spotify - Async

```js
const tokenUrl = "https://accounts.spotify.com/api/token";
const clientId = "910e59ec1184482d8932ab9e1bc3ff8d";
const clientSecret = "02f3d3633013444f86f33305092dcfb5";

/**
 * async/await
 */
const getToken = async (urlToken, id, secret) => {
  const response = await fetch(urlToken, {
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      Authorization: "Basic " + btoa(id + ":" + secret),
    },
    body: "grant_type=client_credentials",
  });

  const data = await response.json();
  return data.access_token;
};

const main = async () => {
  const token = await getToken(tokenUrl, clientId, clientSecret);
  console.log("async\t", token);
};

main();
```

---

[TOP](#js---api)
