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
