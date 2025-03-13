import http from 'http';

const port = process.env.PING_LISTEN_PORT || 3000; 

const requestListener = (req: http.IncomingMessage, res: http.ServerResponse) => {
  if (req.method === 'GET' && req.url === '/ping') {
    res.setHeader('Content-Type', 'application/json');
    res.writeHead(200);
    res.end(JSON.stringify(req.headers));
  } else {
    res.writeHead(404);
    res.end();
  }
};

const server = http.createServer(requestListener);

server.listen(port, () => {
  console.log(port);
});
