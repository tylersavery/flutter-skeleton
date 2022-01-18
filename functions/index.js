const functions = require("firebase-functions");

const fs = require("fs");
const axios = require("axios");
const BotDetector = require("device-detector-js/dist/parsers/bot");

const DEBUG_BOT = true;

  
exports.categories = functions.https.onRequest(async (request, response) => {
  let html = fs.readFileSync("./index.html", "utf-8");

  const url = request.url;

  const urlParts = request.path.split("/");
  const id = urlParts[urlParts.length - 1];

  const botDetector = new BotDetector();
  const userAgent = request.headers["user-agent"].toString();
  const bot = botDetector.parse(userAgent);

  let siteTitle = 'Flutter Skeleton';
  let title = 'Categories';
  let image = '';

  if (bot || DEBUG_BOT) {

    try{

      

    var fullTitle = title ? `${title} - ${siteTitle}` : title;

    html = `
      <!doctype html>
      <html lang="en">
      <head>
          <title>${fullTitle}</title>
          <meta property="og:locale" content="en_US" />
          <meta property="og:type" content="website" />
          <meta property="og:title" content="${fullTitle}" />
          <meta property="og:description" content="List of categories" />
          <meta property="og:site_name" content="${fullTitle}" />
          <meta property="og:url" content="${url}" />
          <meta property="og:image" content="${image}" />

          <meta name="description" content="List of categories">
          <meta name="keywords" content="category,love">

      </head>
      <body>
          <h1>${siteTitle}</h1>
          <h2>${title}</h2>
          <p>List of categories</p>
      </body>
      
      </html>
    `;
     } catch(e) {
       return response.send(html);
     }
  }
  return response.send(html);
});

exports.users = functions.https.onRequest(async (request, response) => {
  let html = fs.readFileSync("./index.html", "utf-8");

  const url = request.url;

  const urlParts = request.path.split("/");
  const id = urlParts[urlParts.length - 1];

  const botDetector = new BotDetector();
  const userAgent = request.headers["user-agent"].toString();
  const bot = botDetector.parse(userAgent);

  let siteTitle = 'Flutter Skeleton';
  let title = 'Users List';
  let image = '';

  if (bot || DEBUG_BOT) {

    try{

      

    var fullTitle = title ? `${title} - ${siteTitle}` : title;

    html = `
      <!doctype html>
      <html lang="en">
      <head>
          <title>${fullTitle}</title>
          <meta property="og:locale" content="en_US" />
          <meta property="og:type" content="website" />
          <meta property="og:title" content="${fullTitle}" />
          <meta property="og:description" content="List of users" />
          <meta property="og:site_name" content="${fullTitle}" />
          <meta property="og:url" content="${url}" />
          <meta property="og:image" content="${image}" />

          <meta name="description" content="List of users">
          <meta name="keywords" content="flutter,dev">

      </head>
      <body>
          <h1>${siteTitle}</h1>
          <h2>${title}</h2>
          <p>List of users</p>
      </body>
      
      </html>
    `;
     } catch(e) {
       return response.send(html);
     }
  }
  return response.send(html);
});

exports.userDetail = functions.https.onRequest(async (request, response) => {
  let html = fs.readFileSync("./index.html", "utf-8");

  const url = request.url;

  const urlParts = request.path.split("/");
  const id = urlParts[urlParts.length - 1];

  const botDetector = new BotDetector();
  const userAgent = request.headers["user-agent"].toString();
  const bot = botDetector.parse(userAgent);

  let siteTitle = 'Flutter Skeleton';
  let title = 'User Detail';
  let image = '';

  if (bot || DEBUG_BOT) {

    try{

      const url = 'https://service.storyplace.com/api/user/:id'.replace(":id", id);
      const response = await axios.get(url);
      const result = response.data;

      
      title = result.username;
      

      

      

    var fullTitle = title ? `${title} - ${siteTitle}` : title;

    html = `
      <!doctype html>
      <html lang="en">
      <head>
          <title>${fullTitle}</title>
          <meta property="og:locale" content="en_US" />
          <meta property="og:type" content="website" />
          <meta property="og:title" content="${fullTitle}" />
          <meta property="og:description" content="User Detail" />
          <meta property="og:site_name" content="${fullTitle}" />
          <meta property="og:url" content="${url}" />
          <meta property="og:image" content="${image}" />

          <meta name="description" content="User Detail">
          <meta name="keywords" content="flutter,dev">

      </head>
      <body>
          <h1>${siteTitle}</h1>
          <h2>${title}</h2>
          <p>User Detail</p>
      </body>
      
      </html>
    `;
     } catch(e) {
       return response.send(html);
     }
  }
  return response.send(html);
});

exports.categoryDetail = functions.https.onRequest(async (request, response) => {
  let html = fs.readFileSync("./index.html", "utf-8");

  const url = request.url;

  const urlParts = request.path.split("/");
  const id = urlParts[urlParts.length - 1];

  const botDetector = new BotDetector();
  const userAgent = request.headers["user-agent"].toString();
  const bot = botDetector.parse(userAgent);

  let siteTitle = 'Flutter Skeleton';
  let title = 'Category Detail';
  let image = '';

  if (bot || DEBUG_BOT) {

    try{

      const url = 'https://service.storyplace.com/api/user/:id'.replace(":id", id);
      const response = await axios.get(url);
      const result = response.data;

      
      title = result.name;
      

            image = result.image.asset.url;
      

      

    var fullTitle = title ? `${title} - ${siteTitle}` : title;

    html = `
      <!doctype html>
      <html lang="en">
      <head>
          <title>${fullTitle}</title>
          <meta property="og:locale" content="en_US" />
          <meta property="og:type" content="website" />
          <meta property="og:title" content="${fullTitle}" />
          <meta property="og:description" content="Category Detail" />
          <meta property="og:site_name" content="${fullTitle}" />
          <meta property="og:url" content="${url}" />
          <meta property="og:image" content="${image}" />

          <meta name="description" content="Category Detail">
          <meta name="keywords" content="flutter,dev">

      </head>
      <body>
          <h1>${siteTitle}</h1>
          <h2>${title}</h2>
          <p>Category Detail</p>
      </body>
      
      </html>
    `;
     } catch(e) {
       return response.send(html);
     }
  }
  return response.send(html);
});
