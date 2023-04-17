# JS Fetch

[Back](../../index.md)

- [JS Fetch](#js-fetch)
  - [HTTP Structure](#http-structure)
  - [XMLHTTPRequest](#xmlhttprequest)
  - [Fetch API](#fetch-api)
  - [Example: Geting XML File](#example-geting-xml-file)
  - [Example: Geting Json File](#example-geting-json-file)

---

## HTTP Structure

- `Hypertext Transfer Protocol (HTTP)`: an application-level protocol.

  - It provides a standardized way for computers to communicate with each other.
  - `HTTP` specification specifies how clients' request data will be **constructed** and sent to the **server**, and how the servers **respond** to these requests.

- The `HTTP protocol`: a request/response protocol based on the `client/server-based architecture` where web browsers, robots and search engines, etc. act like **HTTP clients**, and the Web server acts as a **server**.

- `HTTP client` sends a request to the server in the form of a request method, URI, and protocol version, followed by a MIME-like message containing request modifiers, client information, and possible body content over a TCP/IP connection.

- `HTTP server` responds with a status line, including the message's protocol version and a success or error code, followed by a MIME-like message containing server information, entity meta information, and possible entity-body content.

- **HTTP Request types** – GET, POST, PUT, DELETE
  - `GET`: **retrieving, or getting, information** from some source (usually a website).
  - `POST`: **sending, or posting, information** to a source that will process
    the information and send it back.
  - `PUT`: **updating** already existing data
  - `DELETE`: **deleting data**

---

## XMLHTTPRequest

- `XMLHttpRequest(XHR)` objects are used to interact with servers. You can retrieve data from a URL without having to do a full-page refresh.

  - This enables a Web page to update just part of a page without disrupting what the user is doing.

- Promise

---

## Fetch API

- `Fetch API` is an interface for fetching resources. It is built-in browser JS function
- The `fetch()` function:
  - Creates a request object that contains relevant information that an API needs.
  - Sends that request object to the API endpoint provided.
  - **Returns a promise** that ultimately resolves to a response object, which contains the status of the promise with information the API sent back.

## Example: Geting XML File

```html
<script>
  const xml_url = "cards.xml";
  // promise
  const xmlReq = (url, method = "GET") =>
    new Promise((resolve, reject) => {
      const xhttpReq = new XMLHttpRequest();
      xhttpReq.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
          resolve(this.responseXML);
        }
      };
      xhttpReq.open(method, url);
      xhttpReq.send();
    });
  console.log("Promise");
  //   xmlReq(xml_url).then((data) => console.log(data));

  // async
  console.log("Async");
  const main_async = async () => {
    const xml_ele = await xmlReq("cards.xml");
    console.log(xml_ele);
  };

  //   main_async(xml_url);

  //   fetch
  console.log("Fetch");
  fetch(xml_url)
    .then((response) => response.text())
    .then((str) => new DOMParser().parseFromString(str, "text/xml"))
    .then((xml) => console.log(xml));
</script>
```

---

## Example: Geting Json File

```html
<script>
  // promise
  const JSON_URL = "books.json";

  console.log("Json:Fecth promise");

  fetch(JSON_URL)
    .then((response) => {
      if (response.ok) {
        return response.json();
      } else {
        throw Error(response.statusText);
      }
    })
    .then((json_data) => console.log("Json promise:", json_data))
    .catch((err) => console.log("Error", err));

  // async
  console.log("Json:Fecth async");

  const main_fetch_async = async (url) => {
    const json_data = await fetch(url).then((response) => response.json());
    console.log("Json Async:", json_data);
  };
  main_fetch_async(JSON_URL);
</script>
```

---

[TOP](#js-fetch)
